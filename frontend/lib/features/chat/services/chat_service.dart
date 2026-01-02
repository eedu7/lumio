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

  Future<ChatResult> getChatResponse(List<ChatResult> history) async {
    try {
      List<Map<String, dynamic>> messages = [
        {
          "role": "system",
          "content":
              "You are Lumio AI, a charismatic salesperson. If a user asks for products or recommendations, use 'get_products' to browse our catalog. Keep your responses friendly and concise.",
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
            "description": "Fetch available products from the store.",
            "parameters": {
              "type": "object",
              "properties": {
                "limit": {
                  "type": "integer",
                  "description": "Number of products",
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
        }),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);
        final message = data['choices'][0]['message'];

        // Check if GPT wants to call a tool
        if (message['tool_calls'] != null) {
          final toolCall = message['tool_calls'][0];
          final functionName = toolCall['function']['name'];

          if (functionName == 'get_products') {
            // 1. Fetch products from your existing ProductService
            final products = await ProductService.getProducts(limit: 5);

            // 2. Feed the tool result back to GPT to get a final conversational response
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
              products: products, // Include the products in the result
            );
          }
        }

        return ChatResult(text: message['content'].trim());
      } else {
        return ChatResult(
          text: "I'm having trouble accessing the catalog right now. ✨",
        );
      }
    } catch (e) {
      return ChatResult(
        text:
            "It looks like our connection dropped. Please check your internet!",
      );
    }
  }
}
