import 'package:flutter/material.dart';
import 'package:flutter_intro/model/zwaarste-lijst-result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final title = 'Zwaarste lijst';

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TableView(title: title, data: zwaarsteLijst),
    );
  }
}

class TableView extends StatelessWidget {
  final String title;
  final ZwaarsteLijstResult data;

  TableView({Key? key, required this.title, required this.data})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Zwaarste Lijst'),
      ),
      body: ListView.builder(
        itemCount: data.top10.length,
        itemBuilder: (context, index) {
          final item = data.top10[index];

          return ListTile(
            title: Text(item.artist),
            subtitle: Text(item.song),
          );
        },
      ),
    );
  }
}
