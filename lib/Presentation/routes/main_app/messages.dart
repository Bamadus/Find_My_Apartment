import 'package:flutter/material.dart';

class Messages extends StatefulWidget {
  final String propertyId;
  final DateTime inspectionDate;

  const Messages({
    super.key,
    required this.propertyId,
    required this.inspectionDate,
  });

  @override
  State<Messages> createState() => _MessagesState();
}

class _MessagesState extends State<Messages> {
  final TextEditingController messageController =
      TextEditingController();

  final List<Map<String, String>> messages = [
    {
      'role': 'assistant',
      'content':
          "Hello! I'm your AI property assistant. "
          "Feel free to ask me anything about the property.",
    },
  ];

  void sendMessage() {
    final text = messageController.text.trim();

    if (text.isEmpty) return;

    setState(() {
      messages.add({
        'role': 'user',
        'content': text,
      });
    });

    messageController.clear();

    // Next step: Send the message to your AI backend.
  }

  @override
  void dispose() {
    messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF8F7F4),
      appBar: AppBar(
        title: const Text('AI Property Agent'),
        backgroundColor: const Color(0xffF8F7F4),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              'Inspection date: '
              '${widget.inspectionDate.day}/'
              '${widget.inspectionDate.month}/'
              '${widget.inspectionDate.year}',
            ),
          ),

          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final message = messages[index];
                final isUser = message['role'] == 'user';

                return Align(
                  alignment: isUser
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 12),
                    padding: const EdgeInsets.all(14),
                    constraints: BoxConstraints(
                      maxWidth:
                          MediaQuery.sizeOf(context).width * 0.8,
                    ),
                    decoration: BoxDecoration(
                      color: isUser
                          ? const Color(0xff002855)
                          : Colors.white,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Text(
                      message['content'] ?? '',
                      style: TextStyle(
                        color: isUser
                            ? Colors.white
                            : Colors.black87,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: messageController,
                    decoration: InputDecoration(
                      hintText: 'Ask about this property...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    onFieldSubmitted: (_) => sendMessage(),
                  ),
                ),
                IconButton(
                  onPressed: sendMessage,
                  icon: const Icon(Icons.send),
                  color: const Color(0xff002855),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}