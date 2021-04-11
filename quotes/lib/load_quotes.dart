import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:isar/isar.dart';

import 'isar.g.dart';

class LoadQuotes extends StatefulWidget {
  final Isar isar;

  LoadQuotes({required this.isar});

  @override
  _LoadQuotesState createState() => _LoadQuotesState();
}

class _LoadQuotesState extends State<LoadQuotes> {
  String? _error;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Hey there!',
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(height: 10),
          SizedBox(
            width: 250,
            child: Text(
                'The quotes are not loaded yet. Do you load them from the assets?'),
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () async {
              try {
                final bytes = await rootBundle.load('assets/quotes.json');
                widget.isar.writeTxn((isar) async {
                  await isar.quotes.importJsonRaw(bytes.buffer.asUint8List());
                });
              } catch (e) {
                print(e);
                setState(() {
                  _error = e.toString();
                });
              }
            },
            child: Text('Load Quotes!'),
          ),
          SizedBox(height: 10),
          if (_error != null) Text(_error!),
        ],
      ),
    );
  }
}
