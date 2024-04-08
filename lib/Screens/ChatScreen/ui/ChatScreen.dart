import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colorSchemeTheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Ayna",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: colorSchemeTheme.primary,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 11,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: ListView.builder(
                  reverse: true,
                  itemCount: 5,
                  itemBuilder: (context, countIndex) {
                    return const Padding(
                      padding: EdgeInsets.symmetric(vertical: 5),
                      child: Row(
                        children: [
                          CircleAvatar(),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Text(
                                softWrap: true,
                                "working on this feature, will be available soon"),
                          )
                        ],
                        // leading: CircleAvatar(),
                        // title: Text("text data"),
                        // dense: true,
                      ),
                    );
                  }),
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                  color: colorSchemeTheme.primaryContainer,
                  borderRadius: BorderRadius.circular(100)),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        fillColor: colorSchemeTheme.onPrimary,
                        contentPadding: const EdgeInsets.only(left: 10),
                        border: InputBorder.none,
                        hintText: "Type a message...",
                      ),
                    ),
                  ),
                  IconButton(onPressed: () {}, icon: const Icon(Icons.send))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
