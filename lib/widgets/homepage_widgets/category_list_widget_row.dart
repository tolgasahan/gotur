import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class CategoryListWidgetRow extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            margin: EdgeInsets.only(bottom: 5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.purple.withOpacity(0.6),
                    spreadRadius:0.7,
                    blurRadius: 5,
                    offset: Offset(0, 1), // changes position of shadow
                  ),
                ]
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image.network("https://www.thecountrycook.net/wp-content/uploads/2021/08/thumbnail-Stove-Top-Mac-Cheese-720x720.jpg",
                width: 70,
                height: 70,
              ),
            )),
        Text("Deneme", style: TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w500,
            color: Colors.grey[600]
        ),
        )
      ],
    );
  }

}