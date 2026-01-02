import 'package:flutter/material.dart';
import 'package:frontend/features/chat/presentations/widgets/chat_bubble.dart';
import 'package:frontend/features/chat/presentations/widgets/chat_product_card.dart'; // Create this from the previous snippet
import 'package:frontend/features/chat/services/chat_service.dart';
import 'package:frontend/features/settings/presentations/widgets/custom_app_bar.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final ChatService _chatService = ChatService();

  // Now using the ChatResult model instead of a Map
  final List<ChatResult> _messages = [];
  bool _isTyping = false;

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  Future<void> _handleSendMessage() async {
    final text = _messageController.text.trim();
    if (text.isEmpty) return;

    _messageController.clear();
    setState(() {
      _messages.add(ChatResult(text: text, isUser: true));
      _isTyping = true;
    });
    _scrollToBottom();

    // Pass the entire history for context
    final response = await _chatService.getChatResponse(_messages);

    setState(() {
      _isTyping = false;
      _messages.add(response);
    });
    _scrollToBottom();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: const CustomAppBar(
        title: 'Lumio Support',
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              padding: const EdgeInsets.symmetric(vertical: 10),
              itemCount: _messages.length + (_isTyping ? 1 : 0),
              itemBuilder: (context, index) {
                if (index == _messages.length && _isTyping) {
                  return _buildTypingIndicator();
                }

                final chatItem = _messages[index];

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // The Standard Message Bubble
                    ChatBubble(
                      message: chatItem.products != null
                          ? 'Let me know if you like any of these or need more information'
                          : chatItem.text,
                      isUser: chatItem.isUser,
                    ),

                    // The Horizontal Product Carousel (only if products exist)
                    if (chatItem.products != null &&
                        chatItem.products!.isNotEmpty)
                      _buildProductCarousel(chatItem.products!),
                  ],
                );
              },
            ),
          ),
          _buildInputArea(theme),
        ],
      ),
    );
  }

  Widget _buildProductCarousel(List products) {
    return Container(
      height: 220, // Height for the horizontal cards
      margin: const EdgeInsets.only(top: 8, bottom: 16),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ChatProductCard(product: products[index]);
        },
      ),
    );
  }

  Widget _buildTypingIndicator() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Text(
        "Lumio is typing...",
        style: TextStyle(
          fontStyle: FontStyle.italic,
          color: Colors.grey,
          fontSize: 12,
        ),
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
            color: Colors.black.withOpacity(0.05),
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
                onSubmitted: (_) => _handleSendMessage(),
                decoration: const InputDecoration(
                  hintText: 'Type a message...',
                  border: InputBorder.none,
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          GestureDetector(
            onTap: _isTyping ? null : _handleSendMessage,
            child: CircleAvatar(
              backgroundColor: _isTyping ? Colors.grey : theme.primaryColor,
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
