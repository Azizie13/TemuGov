import 'package:flutter/material.dart';
import 'package:temugov_dev/src/app_styles.dart';
import 'package:temugov_dev/src/decoration/background.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final List<String> _messages = [
    "Hello, my name is HelperBot. Nice to meet you. How can I assist you in today.",
    "I want to renew my driving license.",
    "Understood. Is there anything else I can help you with?"
  ];

  final TextEditingController _textController = TextEditingController();

  void _handleSubmitted(String text) {
    _textController.clear();
    setState(() {
      _messages.add(text);
      _messages.add("Understood, I'll get right to it.");
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
          "Chat Bot",
        ),
        titleTextStyle: kMontExtraBold.copyWith(fontSize: 24, color: kWhite),
        foregroundColor: kWhite,
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: backgroundGradient(),
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  reverse: false,
                  itemCount: _messages.length,
                  itemBuilder: (BuildContext context, int index) {
                    final String message = _messages[index];
                    bool sentByCurrentUser = (index % 2 == 0);

                    return Container(
                      alignment: sentByCurrentUser
                          ? Alignment.centerLeft
                          : Alignment.centerRight,
                      margin: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 8.0),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.75,
                        child: Card(
                          color: sentByCurrentUser ? kPurple : kBlack,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text(
                              message,
                              style: const TextStyle(color: kWhite),
                            ),
                          ),
                        ),
                      ),
                    );
                    ;
                  },
                ),
              ),
              Container(
                margin:
                    const EdgeInsets.only(left: 30.0, right: 30.0, top: 5.0),
                child: Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 14, vertical: 27),
                  child: TextField(
                    controller: _textController,
                    onSubmitted: _handleSubmitted,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: kBlack,
                      hintStyle: kOpenSansSemiBold.copyWith(
                          color: kGreyButton, fontStyle: FontStyle.italic),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16.0),
                        borderSide: const BorderSide(
                          color: Colors.black,
                          width: 3.0,
                        ),
                      ),
                      hintText: 'Enter your message',
                    ),
                    style: kOpenSansRegular.copyWith(color: kWhite),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_textController.text.isNotEmpty) {
            _handleSubmitted(_textController.text);
          }
        },
        backgroundColor: kLightPurple,
        child: const Icon(
          Icons.send_sharp,
          color: kWhite,
        ),
      ),
    );
  }
}
