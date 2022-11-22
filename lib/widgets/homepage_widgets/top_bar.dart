import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gotur/bloc/address_bloc.dart';
import 'package:gotur/widgets/homepage_widgets/addresses_popup.dart';

class TopBar extends StatefulWidget {
  AsyncSnapshot snapshot;
  TopBar(this.snapshot);

  @override
  State<TopBar> createState() => _TopBarState();
}

class _TopBarState extends State<TopBar> {
  @override
  Widget build(BuildContext context) {
    int i ;
    for(i = 0; i<widget.snapshot.data.length;i++){
      if(widget.snapshot.data[i].selectedAddress == 1){
        break;
      }
    }

    return Container(
        padding: EdgeInsets.zero,
        color: Colors.amberAccent,
        height: 50.0,

        child: Row(
          children: [
            Container(
              height: 50.0,
              width: 320,
              child: ElevatedButton(
                onPressed: () {
                  downPopupAddressMenu(context);
                },
                child: Row(
                  children: [
                    Container(
                      width: 265,
                      child: RichText(
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        text: TextSpan(
                          text: widget.snapshot.data[i].addressType+"  ",
                          style: TextStyle(
                              color: Colors.purple,
                              fontWeight: FontWeight.bold),
                          /*defining default style is optional */
                          children: <TextSpan>[
                            TextSpan(
                                text:
                                widget.snapshot.data[i].addressText,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal)),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: 20,
                      child: Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: Colors.purple,
                      ),
                    )
                  ],
                ),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.zero,
                            topLeft: Radius.zero,
                            topRight: Radius.circular(10),
                            bottomRight: Radius.circular(10)))),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 8.0, left: 10.0),
              height: 50,
              width: 80,
              child: Column(
                children: [
                  Text(
                    "TVS",
                    style: TextStyle(
                        color: Colors.purple,
                        fontWeight: FontWeight.bold,
                        fontSize: 10),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    "9dk",
                    style: TextStyle(
                        color: Colors.purple,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            )
          ],
        ));
  }

  void downPopupAddressMenu(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      context: context,
      builder: (context) => Padding(
        padding: const EdgeInsets.only(top: 25, left: 15, right: 15),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 15),
              transformAlignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(20.0)),
              width: 50,
              height: 5,
            ),
            Container(
              width: double.infinity,
              height: 50,
              child: Row(
                children: [
                  Flexible(
                      fit: FlexFit.tight,
                      flex: 20,
                      child: Text(
                        "Teslimat adresinizi seçin",
                        style: TextStyle(
                            color: Colors.grey[500],
                            fontWeight: FontWeight.bold),
                      )),
                  Flexible(
                    fit: FlexFit.tight,
                    flex: 6,
                    child: Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          color: Colors.purple,
                        ),
                        RichText(
                          textAlign: TextAlign.right,
                          text: TextSpan(
                              text: "Adreslerim",
                              style: TextStyle(
                                  color: Colors.purple,
                                  fontSize: 13,
                                  decoration: TextDecoration.underline),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  print("asd");
                                }),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Divider(),
            Container(
              child: AddressesPopup(widget.snapshot),
              constraints: BoxConstraints(maxHeight: 500),
            ),
            Container(
              height: 72,
              child: GestureDetector(
                onTap: (){},
                child: Row(
                  children: [
                    Icon(
                      Icons.add,
                      color: Colors.purple,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(20.0)),
                      width: 2,
                      height: 20,
                    ),
                    Text(
                      "Yeni Adres Ekle",
                      style: TextStyle(
                          color: Colors.purple, fontWeight: FontWeight.w500),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    ).then((value) => setState((){}));
  }
}