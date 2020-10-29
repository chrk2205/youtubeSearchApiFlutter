import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchBarWidget extends StatelessWidget {
  final controller;
  final onChanged;

  @required
  const SearchBarWidget({Key key, this.controller, this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.all(12),
        child: TextField(
          onChanged: onChanged,
          autofocus: true,
          controller: controller,
          style: TextStyle(height: 1.4),
          decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.search,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(24),
            ),
          ),
        ),
      ),
    );
  }
}
