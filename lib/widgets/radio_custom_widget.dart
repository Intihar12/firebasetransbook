import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../modals/radio_modal/radio_modal.dart';
import '../values/my_colors.dart';

class RadioItem extends StatelessWidget {
  final RadioModel _item;
  RadioItem(this._item);
  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: new EdgeInsets.symmetric(vertical: 15.0),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          new Container(
            margin: new EdgeInsets.only(left: 0.0),
            child: new Text(_item.text),
          ),
          Container(
            alignment: Alignment.center,
            height: 20.0,
            width: 20.0,
            child: new Center(
                child: _item.isSelected
                    ? Icon(
                        Icons.done,
                        color: MyColors.white,
                        size: 15,
                      )
                    : SizedBox()
                // Text(_item.buttonText,
                //
                //     style: new TextStyle(
                //         color:
                //         _item.isSelected ? Colors.white : Colors.black,
                //         //fontWeight: FontWeight.bold,
                //         fontSize: 18.0)),
                ),
            decoration: new BoxDecoration(
              color: _item.isSelected ? Colors.blueAccent : Colors.transparent,
              border: new Border.all(width: 1.0, color: _item.isSelected ? Colors.blueAccent : Colors.grey),
              borderRadius: const BorderRadius.all(const Radius.circular(2.0)),
            ),
          ),
        ],
      ),
    );
  }
}
