import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Noticefication',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: const MyHomePage(title: 'Notice your fications'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
