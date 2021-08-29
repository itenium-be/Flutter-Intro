import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_intro/model/zwaarste-lijst-entry.dart';
import 'package:flutter_intro/model/zwaarste-lijst-result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final title = 'Zwaarste lijst';
  ZwaarsteLijstEntry? _selectedEntry;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        accentColor: Colors.red,
      ),
      home: Navigator(
        pages: [
          MaterialPage(
            child: TableView(
              title: title,
              entrySelected: (entry) => setState(() => _selectedEntry = entry),
            ),
          ),
          if (_selectedEntry != null)
            MaterialPage(child: TrackDetailsView(entry: _selectedEntry!))
        ],
        onPopPage: (route, result) {
          _selectedEntry = null;
          return route.didPop(result);
        },
      ),
    );
  }
}

class TableView extends StatelessWidget {
  final String title;
  final ValueChanged<ZwaarsteLijstEntry>? entrySelected;

  TableView({Key? key, required this.title, this.entrySelected})
      : super(key: key);

  Future<ZwaarsteLijstResult> _loadData() async {
    await Future.delayed(Duration(seconds: 1)); // mock http call, ...
    bool testWhatHappensIfError = false;
    if (testWhatHappensIfError) {
      throw ('Test what happens if error thrown');
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
                return TableViewItem(
                    entry: data.top10[index],
                    entrySelected: this.entrySelected);
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
  final ValueChanged<ZwaarsteLijstEntry>? entrySelected;

  const TableViewItem({Key? key, required this.entry, this.entrySelected})
      : super(key: key);

  @override
  _TableViewItemState createState() => _TableViewItemState();
}

class _TableViewItemState extends State<TableViewItem> {
  bool _isFavorited = false;

  void _openEntry() {
    if (widget.entrySelected != null) {
      widget.entrySelected!(widget.entry);
    }
  }

  void _toggleFavorite() {
    setState(() {
      _isFavorited = !_isFavorited;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('${widget.entry.ranking}. ${widget.entry.artist}'),
      subtitle: Text(widget.entry.song),
      leading: Container(
        decoration: _isFavorited
            ? BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                      blurRadius: 12.0, color: Theme.of(context).accentColor),
                ],
              )
            : null,
        child: CircleAvatar(
          radius: 20.0,
          foregroundImage: ExactAssetImage(widget.entry.getIconAssetName()),
          foregroundColor: Theme.of(context).accentColor,
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

class TrackDetailsView extends StatelessWidget {
  final ZwaarsteLijstEntry entry;

  const TrackDetailsView({Key? key, required this.entry}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${entry.artist} - ${entry.song}'),
      ),
      body: Center(
        child: Text('Track details'),
      ),
    );
  }
}
