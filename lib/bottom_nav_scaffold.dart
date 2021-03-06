import 'package:flutter/material.dart';
import 'package:icons_helper/icons_helper.dart';
import 'glider.dart';

class BottomNavScaffold extends StatefulWidget {
  final Map<String, dynamic> _json;

  const BottomNavScaffold(this._json, {Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _BottomNavScaffoldState(_json);
  }
}

class _BottomNavScaffoldState extends State<BottomNavScaffold> {
  final Map<String, dynamic> _json;
  List<dynamic> _itemsJson;

  int _currentSelection = 0;

  _BottomNavScaffoldState(this._json) {
    this._itemsJson = _json['items'] as List;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _json['app_bar'] != null
          ? AppBar(
              title: Text(_json['app_bar']['title'] as String),
            )
          : null,
      body: _itemsJson[_currentSelection] != null
          ? Glider(_itemsJson[_currentSelection]['body'] as Map)
          : null,
      bottomNavigationBar: _buildNavigationBar(context),
      floatingActionButton:
          _json['fab'] != null ? Glider(_json['fab'] as Map) : null,
      drawer: _json['drawer'] != null ? Glider(_json['drawer'] as Map) : null,
      bottomSheet: _json['bottom_sheet'] != null
          ? Glider(_json['bottom_sheet'] as Map)
          : null,
    );
  }

  BottomNavigationBar _buildNavigationBar(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _currentSelection,
      items: _itemsJson.map((dynamic item) {
        return BottomNavigationBarItem(
          icon: Icon(getMaterialIcon(name: item['icon'] as String)),
          title: Text(item['title'] as String),
        );
      }).toList(),
      onTap: (position) {
        setState(() {
          this._currentSelection = position;
        });
      },
    );
  }
}
