import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/chat_provider.dart';

class ChatScreen extends StatefulWidget {

  final String prompt;

  const ChatScreen({super.key, required this.prompt});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {

  final TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      context.read<ChatProvider>().sendMessage(widget.prompt);
    });
  }

  @override
  Widget build(BuildContext context) {

    final provider = context.watch<ChatProvider>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Chat"),
      ),

      body: Column(
        children: [

          Expanded(
            child: provider.messages.isEmpty
                ? const Center(
                    child: Text("Start a conversation"),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.all(10),
                    itemCount: provider.messages.length,

                    itemBuilder: (context, index) {

                      final msg = provider.messages[index];

                      return Align(
                        alignment: msg.sender == "user"
                            ? Alignment.centerRight
                            : Alignment.centerLeft,

                        child: Container(
                          margin: const EdgeInsets.symmetric(vertical: 6),
                          padding: const EdgeInsets.all(12),

                          decoration: BoxDecoration(
                            color: msg.sender == "user"
                                ? Colors.blue
                                : Colors.grey.shade300,

                            borderRadius: BorderRadius.circular(12),
                          ),

                          child: Text(
                            msg.message,
                            style: TextStyle(
                              color: msg.sender == "user"
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
          ),

          if (provider.isLoading)
            const Padding(
              padding: EdgeInsets.all(8),
              child: CircularProgressIndicator(),
            ),

          SafeArea(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                children: [

                  Expanded(
                    child: TextField(
                      controller: controller,
                      decoration: const InputDecoration(
                        hintText: "Type message",
                      ),
                    ),
                  ),

                  IconButton(
                    icon: const Icon(Icons.send),

                    onPressed: () {

                      final text = controller.text.trim();

                      if (text.isEmpty) return;

                      context.read<ChatProvider>().sendMessage(text);

                      controller.clear();
                    },
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}