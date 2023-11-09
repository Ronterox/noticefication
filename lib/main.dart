import 'package:flutter/material.dart';

void main() {
  runApp(const NoticeficationApp());
}

class NoticeficationApp extends StatelessWidget {
  const NoticeficationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Noticefication',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: const NotesApp(title: 'Notice your fications'),
    );
  }
}

class NotesApp extends StatefulWidget {
  const NotesApp({super.key, required this.title});
  final String title;

  @override
  State<NotesApp> createState() => _NotesAppState();
}

class _NotesAppState extends State<NotesApp> {
  // This is the search bar
  final TextEditingController _filter = TextEditingController();
  String _searchText = "";

  List texts = [
    'One-line with both widgets',
    'Two-line with both widgets',
    'Three-line with both widgets'
  ];

  Card _buildCard(BuildContext context, int index) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: [Colors.red, Colors.green, Colors.blue][index],
          child: Text(texts[index].substring(0, 3),
              style: const TextStyle(color: Colors.white)),
        ),
        title: Text(texts[index]),
        subtitle: const Text('Here is a second line'),
        trailing: const Icon(Icons.more_vert),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: const InputDecoration(
                  hintText: 'Search...',
                ),
                controller: _filter,
                onChanged: (value) => setState(() => _searchText = value),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: texts.length,
                itemBuilder: _buildCard,
              ),
            ),
          ],
        ));
  }
}

class ChatApp extends StatelessWidget {
  const ChatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chat',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: const ChatScreen(title: 'Chat'),
    );
  }
}

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key, required this.title});
  final String title;

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: const Center(child: Text('Chat')),
    );
  }
}
