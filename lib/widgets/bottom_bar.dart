import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {
  @override

  List<int> whichPage = [];
  BottomBar(this.whichPage);

  Widget build(BuildContext context) {
    return Row(
       children: [
         buttons(context, Icons.home, '/home',whichPage[0]),
         buttons(context, Icons.search, '/search',whichPage[1]),
         buttons(context, Icons.person, '/profile',whichPage[2]),
         buttons(context, Icons.card_giftcard, '/gifts',whichPage[3]),
       ],
    );
  }

  Widget buttons(BuildContext context, var icon ,String routate,int isSelected) {
    var color = Colors.blueGrey;
    if(isSelected == 1) color = Colors.purple;
    return Flexible(
      fit: FlexFit.tight,
      flex: 1,
      child: IconButton(
        icon: Icon(icon, color: color),
        onPressed: () {
          Navigator.pushNamed(context, routate);
        },
      ),
    );
  }
}
