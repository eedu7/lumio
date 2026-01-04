import 'dart:convert';

import 'package:frontend/core/config/env.dart';
import 'package:frontend/features/home/model/product_model.dart';
import 'package:frontend/features/home/services/product_service.dart';
import 'package:http/http.dart' as http;

class ChatResult {
  final String text;
  final List<ProductModel>? products;
  final bool isUser;

  ChatResult({required this.text, this.products, this.isUser = false});
}

class ChatService {
  final String _url = "https://api.openai.com/v1/chat/completions";

  int _totalProductsShown = 0;

  int? _extractNumberFromMessage(String message) {
    print('🔍 Parsing message: "$message"');

    final patterns = [
      RegExp(r'\b(\d+)\s*(?:products?|items?)\b', caseSensitive: false),
      RegExp(r'(?:show|give|get|find)\s+(?:me\s+)?(\d+)', caseSensitive: false),
      RegExp(r'\b(\d+)\b'),
    ];

    for (var regex in patterns) {
      final match = regex.firstMatch(message);
      if (match != null) {
        final number = int.tryParse(match.group(1)!);
        return number;
      }
    }
    return null;
  }

  Future<ChatResult> getChatResponse(List<ChatResult> history) async {
    try {
      String latestUserMessage = '';
      if (history.isNotEmpty && history.last.isUser) {
        latestUserMessage = history.last.text;
      }
      final userRequestedLimit = _extractNumberFromMessage(latestUserMessage);

      List<Map<String, dynamic>> messages = [
        {
          "role": "system",
          "content":
              "You are Lumio AI, a charismatic salesperson. "
              "IMPORTANT PAGINATION INFO: $_totalProductsShown products have already been shown. "
              "When calling get_products:\n"
              "- Use limit parameter for the number of products to show\n"
              "- ALWAYS use skip=$_totalProductsShown to avoid showing duplicate products\n"
              "${userRequestedLimit != null ? '- The user wants exactly $userRequestedLimit products, so use limit=$userRequestedLimit\n' : ''}"
              "Keep responses friendly and concise.",
        },
        ...history.map(
          (m) => {"role": m.isUser ? "user" : "assistant", "content": m.text},
        ),
      ];

      final tools = [
        {
          "type": "function",
          "function": {
            "name": "get_products",
            "description": "Fetch products from the store.",
            "parameters": {
              "type": "object",
              "properties": {
                "limit": {
                  "type": "integer",
                  "description": "Number of products to fetch",
                },
                "skip": {
                  "type": "integer",
                  "description": "Number of products to skip for pagination",
                },
                "category_id": {
                  "type": "string",
                  "description": "Optional category ID to filter products",
                },
              },
              "required": ["limit", "skip"],
            },
          },
        },
      ];

      final response = await http.post(
        Uri.parse(_url),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${ENV.OPENAI_API_KEY}',
        },
        body: jsonEncode({
          "model": "gpt-4o",
          "messages": messages,
          "tools": tools,
          "tool_choice": "auto",
        }),
      );

      if (response.statusCode != 200) {
        return ChatResult(
          text: "I'm having trouble accessing the catalog right now. ✨",
        );
      }

      final Map<String, dynamic> data = jsonDecode(response.body);
      final message = data['choices'][0]['message'];

      if (message['tool_calls'] != null) {
        final toolCall = message['tool_calls'][0];
        final functionName = toolCall['function']['name'];

        if (functionName == 'get_products') {
          final params = toolCall['arguments'] != null
              ? jsonDecode(toolCall['arguments'])
              : {};

          int limit = userRequestedLimit ?? (params['limit'] ?? 5);
          int skip = params['skip'] ?? _totalProductsShown;
          final String? categoryId = params['category_id'];

          print(
            '📊 Fetching products: limit=$limit, skip=$skip (total shown so far: $_totalProductsShown)',
          );

          final products = categoryId != null
              ? await ProductService.getProductsByCategoryId(
                  categoryId: categoryId,
                  limit: limit,
                  skip: skip,
                )
              : await ProductService.getProducts(limit: limit, skip: skip);

          _totalProductsShown += products.length;

          messages.add(message);
          messages.add({
            "role": "tool",
            "tool_call_id": toolCall['id'],
            "name": functionName,
            "content": jsonEncode(products.map((p) => p.toJson()).toList()),
          });

          final secondResponse = await http.post(
            Uri.parse(_url),
            headers: {
              'Content-Type': 'application/json',
              'Authorization': 'Bearer ${ENV.OPENAI_API_KEY}',
            },
            body: jsonEncode({"model": "gpt-4o", "messages": messages}),
          );

          final secondData = jsonDecode(secondResponse.body);
          return ChatResult(
            text: secondData['choices'][0]['message']['content'].trim(),
            products: products,
          );
        }
      }

      return ChatResult(text: message['content'].trim());
    } catch (e) {
      print('❌ Error: $e');
      return ChatResult(
        text:
            "It looks like our connection dropped. Please check your internet!",
      );
    }
  }

  void resetPagination() {
    _totalProductsShown = 0;
  }
}
