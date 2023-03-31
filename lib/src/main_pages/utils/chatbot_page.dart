import 'package:flutter/material.dart';
import 'package:temugov_dev/src/app_styles.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final List<String> _messages = [];
  final TextEditingController _textController = TextEditingController();

  void _handleSubmitted(String text) {
    _textController.clear();
    setState(() {
      _messages.insert(0, text);
      _messages.insert(0, 'Chatbot: Hello, how can I assist you today?');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        centerTitle: true,
        backgroundColor: kPurple,
        title: const Text(
          "HelperBot",
        ),
        titleTextStyle: kMontExtraBold.copyWith(fontSize: 24, color: kWhite),
        foregroundColor: kWhite,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              reverse: true,
              itemCount: _messages.length,
              itemBuilder: (BuildContext context, int index) {
                final String message = _messages[index];
                return Container(
                  margin: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Text(message),
                );
              },
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 8.0),
            padding: const EdgeInsets.all(12),
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 14, vertical: 27),
              decoration: const BoxDecoration(color: kLightPurple),
              child: TextField(
                controller: _textController,
                onSubmitted: _handleSubmitted,
                decoration: InputDecoration.collapsed(
                  hintText: 'Enter your message',
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_textController.text.isNotEmpty) {
            _handleSubmitted(_textController.text);
          }
        },
        child: Icon(Icons.send),
      ),
    );
  }
}
