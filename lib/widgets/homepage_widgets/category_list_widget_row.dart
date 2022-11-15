import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class CategoryListWidgetRow extends StatelessWidget{
  final list;
  int index;
  CategoryListWidgetRow(this.list,this.index);
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
              child: Image.network(list[index].imagePath,
                width: 70,
                height: 70,
              ),
            )),
        Text(list[index].name, style: TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w500,
            color: Colors.grey[600]
        ),
        )
      ],
    );
  }

}