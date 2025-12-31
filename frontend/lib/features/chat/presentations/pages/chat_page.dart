import 'package:flutter/material.dart';
import 'package:frontend/features/chat/presentations/widgets/chat_bubble.dart';
import 'package:frontend/features/settings/presentations/widgets/custom_app_bar.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _messageController = TextEditingController();
  final List<Map<String, dynamic>> _messages = [
    {
      'text':
          'Hi JD! Good morning! 👋 How can I help you with your order today?',
      'isUser': false,
      'time': '09:00 AM',
    },
    {
      'text': 'Is there a special offer for the Popular Products?',
      'isUser': true,
      'time': '09:01 AM',
    },
    {
      'text':
          'Yes, JD! We currently have a 15% discount on all Popular Products for our premium members. Would you like me to apply the code LUMIO15 to your cart?',
      'isUser': false,
      'time': '09:01 AM',
    },
    {
      'text':
          'That would be great! Also, can I check the status of my vintage denim jacket?',
      'isUser': true,
      'time': '09:02 AM',
    },
    {
      'text':
          'Checking your latest order... 🔎 Your Vintage Denim Jacket is currently with our courier and is estimated to arrive today by 5:00 PM!',
      'isUser': false,
      'time': '09:02 AM',
    },
    {
      'text': 'Awesome! What if the size doesn\'t fit? Can I return it?',
      'isUser': true,
      'time': '09:04 AM',
    },
    {
      'text':
          'Absolutely! We offer a 30-day hassle-free return policy. You can generate a return label directly from your "My Orders" page. 📦',
      'isUser': false,
      'time': '09:04 AM',
    },
    {
      'text': 'One last thing—how many Lumio points do I have left?',
      'isUser': true,
      'time': '09:05 AM',
    },
    {
      'text':
          'You currently have 450 Lumio Points! You only need 50 more to unlock a \$10 voucher for your next purchase. ✨',
      'isUser': false,
      'time': '09:06 AM',
    },
    {
      'text': 'Perfect, thank you for the help!',
      'isUser': true,
      'time': '09:06 AM',
    },
    {
      'text':
          'You\'re very welcome! Is there anything else I can assist you with today? 😊',
      'isUser': false,
      'time': '09:07 AM',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: Colors.grey[50], // Matches HomePage background
      appBar: const CustomAppBar(
        title: 'Lumio Support',
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];
                return ChatBubble(
                  message: message['text'],
                  isUser: message['isUser'],
                );
              },
            ),
          ),
          _buildInputArea(theme),
        ],
      ),
    );
  }

  Widget _buildInputArea(ThemeData theme) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 32),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(32)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 15,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(24),
                border: Border.all(color: Colors.grey.shade200),
              ),
              child: TextField(
                controller: _messageController,
                decoration: const InputDecoration(
                  hintText: 'Type a message...',
                  border: InputBorder.none,
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          // Using Seed Color (PinkAccent) for the send button
          GestureDetector(
            onTap: () {
              if (_messageController.text.trim().isNotEmpty) {
                setState(() {
                  _messages.add({
                    'text': _messageController.text,
                    'isUser': true,
                  });
                  _messageController.clear();
                });
              }
            },
            child: CircleAvatar(
              backgroundColor: theme.primaryColor,
              radius: 24,
              child: const Icon(
                Icons.send_rounded,
                color: Colors.white,
                size: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
