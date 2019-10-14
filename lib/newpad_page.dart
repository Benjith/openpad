import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_extend/share_extend.dart';

class NewPad extends StatefulWidget {
  bool isUpdate;
  NewPad({@required this.isUpdate});
  @override
  _NewPadState createState() => _NewPadState(isUpdate: isUpdate);
}

class _NewPadState extends State<NewPad> {
  bool isUpdate;
  _NewPadState({@required this.isUpdate});
  TextEditingController _title = TextEditingController();
  TextEditingController _content = TextEditingController();

  Future<void> _write() async {
    if (_title.text.isNotEmpty && _content.text.isNotEmpty) {
      // final directory = await getApplicationDocumentsDirectory();
      final directory = await getExternalStorageDirectory();
      final file = File('${directory.path}/${_title.text}.txt');
      await file.writeAsString(_content.text);
      print('saved.!');
    }
  }

  _clearTextValues() {
    setState(() {
      _title.clear();
      _content.clear();
    });
  }

  Future<void> _share() async {
    Directory dir = await getExternalStorageDirectory();
    File testFile = new File("${dir.path}/${_title.text}.txt");
    if (await testFile.exists()) {
      ShareExtend.share(testFile.path, "file");
    } else
      print('file not exist');
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              // ListTile(
              //   title: Text('Saved notes'),
              //   onTap: () {},
              // ),
              // ListTile(
              //   title: Text('External Directory'),
              //   onTap: () {},
              // ),
              ListTile(
                title: Text('About'),
                onTap: () {
                  Navigator.pushNamed(context, '/about');
                },
              ),
            ],
          ),
        ),
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.blue,
          title: Text('New Text'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.save),
              onPressed: () async {
                await _write();
                _clearTextValues();
              },
            ),
            IconButton(
              icon: Icon(Icons.share),
              onPressed: () async {
                await _write();
                await _share();
                _clearTextValues();
              },
            )
          ],
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
          children: <Widget>[
            TextField(
              // style: TextStyle(letterSpacing: 1.5),
              controller: _title,
              decoration: InputDecoration(hintText: 'Title',),
              cursorColor: Colors.red,
            ),
            Expanded(
              child: TextField(
                style: TextStyle(letterSpacing: 2),
                controller: _content,
                maxLines: null,
                minLines: null,
                cursorColor: Colors.red,
                expands: true,
                decoration: InputDecoration(hintText: '...'),
              ),
            ),
          ],
        ),
        ),
      ),
    );
  }
}
