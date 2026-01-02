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

  Future<String> getChatResponse(List<Map<String, String>> history) async {
    try {
      List<Map<String, dynamic>> messages = [
        {
          "role": "system",
          "content":
              "You are Lumio AI, a charismatic salesperson. You have access to a product database. If a user asks for products, recommendations, or specific items, use the 'get_products' tool to browse our catalog before answering.",
        },
        ...history,
      ];

      final tools = [
        {
          "type": "function",
          "function": {
            "name": "get_products",
            "description": "Fetch a list of available products from the store.",
            "parameters": {
              "type": "object",
              "properties": {
                "limit": {
                  "type": "integer",
                  "description": "Number of products to fetch",
                },
              },
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
          "temperature": 0.7,
        }),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);
        final message = data['choices'][0]['message'];

        if (message['tool_calls'] != null) {
          final toolCall = message['tool_calls'][0];
          final functionName = toolCall['function']['name'];

          if (functionName == 'get_products') {
            final products = await ProductService.getProducts(limit: 5);

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
            return secondData['choices'][0]['message']['content'].trim();
          }
        }

        return message['content'].trim();
      } else {
        return "I'm so sorry, I'm having a little trouble accessing our catalog. Give me a moment! ✨";
      }
    } catch (e) {
      return "It looks like our connection dropped. Please check your internet!";
    }
  }
}
