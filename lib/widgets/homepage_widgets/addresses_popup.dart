import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddressesPopup extends StatelessWidget{
  AsyncSnapshot snapshot;
  AddressesPopup(this.snapshot);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: snapshot.data.length,
      itemBuilder: (context,index){
        final list = snapshot.data;
        var typeIcon;
        switch(list[index].addressType){
          case "Ev":
            typeIcon = Icons.home_outlined;
            break;
          case "İş":
            typeIcon = Icons.home_work_outlined;
            break;
          case "Diğer":
            typeIcon = Icons.park_outlined;
            break;
          default:
        }
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            RadioListTile(
              value: list[index].selectedAddress,
              groupValue: 1,
              title: Row(children: [Icon(typeIcon, color: Colors.purple,size: 18.0,),SizedBox(width: 5,),Text(list[index].addressType)]),
              subtitle: Text(list[index].addressText),
              onChanged: (val) {
                for(int i = 0;i<snapshot.data.length;i++){
                  snapshot.data[i].selectedAddress = 0;
                }
                snapshot.data[index].selectedAddress = 1;
                Navigator.pop(context,snapshot.data[index]);
              },
              activeColor: Colors.purple,
              selected: false,
            ),
            Divider()
          ],
        );
      },
    );

  }

}