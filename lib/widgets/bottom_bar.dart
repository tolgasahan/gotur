

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget{
  var icon;
  var color;
  BottomBar(this.icon,this.color);
  @override
  Widget build(BuildContext context) {
    return Flexible(
      fit: FlexFit.tight,
      flex: 1,
      child: IconButton(
        icon: Icon(icon,color: color),
        onPressed: () {  },

      ),
    );
  }

}