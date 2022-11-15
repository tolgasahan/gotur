import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartButton extends StatelessWidget{
  bool cartVisibility = false;

  CartButton(this.cartVisibility);

  @override
  Widget build(BuildContext context) {

    return  Visibility(
      visible: cartVisibility,
      child: Container(
          margin: EdgeInsets.symmetric(vertical: 12,horizontal: 5),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey[200],
                elevation: 0,
                padding: EdgeInsets.only(
                    left: 0,
                    right: 10
                ),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))
            ),
            onPressed: (){},
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 7),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(5),
                      topLeft: Radius.circular(5),

                    ),
                    color: Colors.white,
                  ),
                  height: 31,

                  child: Icon(Icons.shopping_bag, color: Colors.purple,),
                ),
                SizedBox(width: 10,),
                Text("₺107,95",style: TextStyle(color: Colors.purple),)
              ],
            ),

          )
      ),
    );
  }

}