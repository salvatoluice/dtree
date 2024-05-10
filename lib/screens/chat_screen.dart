import 'package:dtree/main.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.only(left: 4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Chat with John'),
              Text(
                'Last seen 2 hours ago',
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
        leading: IconButton(
          onPressed: () {
            // Handle back button press
          },
          icon: const Icon(Icons.arrow_back),
        ),
        actions: [
          PopupMenuButton<String>(
            offset: const Offset(0,
                60), // Adjust offset to position the popup menu below the app bar
            onSelected: (value) {
              // Handle menu item selection
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              const PopupMenuItem<String>(
                value: 'delete',
                child: ListTile(
                  leading: Icon(Icons.delete),
                  title: Text('Delete Chat'),
                ),
              ),
              const PopupMenuItem<String>(
                value: 'mute',
                child: ListTile(
                  leading: Icon(Icons.volume_off),
                  title: Text('Mute Notifications'),
                ),
              ),
              const PopupMenuItem<String>(
                value: 'block',
                child: ListTile(
                  leading: Icon(Icons.block),
                  title: Text('Block User'),
                ),
              ),
            ],
          ),
        ],
      ),
      body: Column(
        children: [
          // Chat messages
          Expanded(
            child: ChatWidget(),
          ),
          Container(
            padding: const EdgeInsets.symmetric(
                horizontal: 12, vertical: 8), // Adjust vertical padding here
            color: Colors.grey[100],
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Type a message...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Colors.grey[400]!),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(
                            color:
                                primaryColor), // Change border color to primaryColor when focused
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 12,
                          horizontal: 6), // Adjust content padding here
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                ElevatedButton(
                  onPressed: () {
                    // Action to send message
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    shape: CircleBorder(),
                    padding: const EdgeInsets.all(12), // Adjust padding here
                  ),
                  child: const Icon(Icons.send, color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ChatWidget extends StatelessWidget {
  final List<ChatMessage> _messages = [
    const ChatMessage(message: 'Hello', isMe: false),
    const ChatMessage(message: 'Hi there!', isMe: true),
    const ChatMessage(message: 'How are you?', isMe: false),
    const ChatMessage(message: 'I\'m good, thanks!', isMe: true),
    const ChatMessage(message: 'What about you?', isMe: true),
    const ChatMessage(message: 'I\'m doing well too.', isMe: false),
    const ChatMessage(message: 'Hello', isMe: false),
    const ChatMessage(message: 'Hi there!', isMe: true),
    const ChatMessage(message: 'How are you?', isMe: false),
    const ChatMessage(message: 'I\'m good, thanks!', isMe: true),
    const ChatMessage(message: 'What about you?', isMe: true),
    const ChatMessage(message: 'I\'m doing well too.', isMe: false),
    const ChatMessage(message: 'Hi there!', isMe: true),
    const ChatMessage(message: 'How are you?', isMe: false),
    const ChatMessage(message: 'I\'m good, thanks!', isMe: true),
    const ChatMessage(message: 'What about you?', isMe: true),
    const ChatMessage(message: 'I\'m doing well too.', isMe: false),
    const ChatMessage(message: 'Hello', isMe: false),
    const ChatMessage(message: 'Hi there!', isMe: true),
    const ChatMessage(message: 'How are you?', isMe: false),
    const ChatMessage(message: 'I\'m good, thanks!', isMe: true),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _messages.length,
      itemBuilder: (context, index) {
        return ChatBubble(message: _messages[index]);
      },
    );
  }
}

class ChatBubble extends StatelessWidget {
  final ChatMessage message;

  const ChatBubble({required this.message});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: message.isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: message.isMe ? primaryColor : Colors.grey[500],
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(
          message.message,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class ChatMessage {
  final String message;
  final bool isMe;

  const ChatMessage({required this.message, required this.isMe});
}
