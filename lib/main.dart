import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_intro/model/zwaarste-lijst-entry.dart';
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
      home: TableView(title: title),
    );
  }
}

class TableView extends StatelessWidget {
  final String title;

  TableView({Key? key, required this.title}) : super(key: key);

  Future<ZwaarsteLijstResult> _loadData() async {
    await Future.delayed(Duration(seconds: 1)); // mock http call, ...
    bool testWhatHappensIfError = false;
    if (testWhatHappensIfError) {
      throw('Test what happens if error thrown');
    } else {
      String jsonString =
      await rootBundle.loadString('assets/zwaarste-lijst.json');
      var decoded = json.decode(jsonString);
      return ZwaarsteLijstResult.fromJson(decoded);
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ZwaarsteLijstResult>(
      future: _loadData(),
      builder: (context, snapshot) {
        Widget body;
        if (snapshot.connectionState == ConnectionState.waiting) {
          body = Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          body = Center(child: Text('Error: ${snapshot.error}'));
        } else {
          ZwaarsteLijstResult data = snapshot.data!;
          body = RefreshIndicator(
            child: ListView.builder(
              itemCount: data.top10.length,
              itemBuilder: (context, index) {
                return TableViewItem(entry: data.top10[index]);
              },
            ),
            onRefresh: _loadData,
          );
        }

        return Scaffold(
            appBar: AppBar(
              title: Text(this.title),
            ),
            body: body);
      },
    );
  }
}

class TableViewItem extends StatefulWidget {
  final ZwaarsteLijstEntry entry;

  const TableViewItem({Key? key, required this.entry}) : super(key: key);

  @override
  _TableViewItemState createState() => _TableViewItemState();
}

class _TableViewItemState extends State<TableViewItem> {
  bool _isFavorited = false;

  void _openEntry() {
    print('Not yet implemented to open entry ${widget.entry}');
  }

  void _toggleFavorite() {
    setState(() {
      _isFavorited = !_isFavorited;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(widget.entry.artist),
      subtitle: Text(widget.entry.song),
      leading: Container(
        child: CircleAvatar(
          radius: _isFavorited ? 20.0 : 18.0,
          backgroundColor: Theme.of(context).accentColor,
          foregroundColor: Theme.of(context).buttonColor,
          child: Text('${widget.entry.ranking}'),
        ),
      ),
      trailing: Wrap(
        children: [
          IconButton(
            icon: const Icon(Icons.open_in_new),
            color: Colors.green[500],
            onPressed: _openEntry,
          ),
          IconButton(
            icon: (_isFavorited
                ? const Icon(Icons.star)
                : const Icon(Icons.star_border)),
            color: Colors.red[500],
            onPressed: _toggleFavorite,
          ),
        ],
      ),
    );
  }
}
