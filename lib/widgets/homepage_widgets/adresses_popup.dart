import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdressesPopup extends StatelessWidget{
  int selectedRadioTile = 0;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: 6,
      itemBuilder: (context,index){
        return Column(
          mainAxisSize: MainAxisSize.min,
            children: [
              RadioListTile(
                value: 1,
                groupValue: selectedRadioTile,
                title: Row(children: [Icon(Icons.home_outlined, color: Colors.purple,size: 18.0,),SizedBox(width: 5,),Text("Ev")]),
                subtitle: Text("dfdsjkfhkdslaflsdkjsdlfkdslfjsdfkadsfjlasdfjsdakfasdfadslfşsdfljasdkfsd"),
                onChanged: (val) {
                },
                activeColor: Colors.red,
                selected: false,
              ),
              Divider()
            ],
        );
      },
    );

  }

}