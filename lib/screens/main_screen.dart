import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gotur/bloc/address_bloc.dart';
import 'package:gotur/bloc/category_bloc.dart';
import 'package:gotur/widgets/bottom_bar.dart';
import 'package:gotur/widgets/cart_button.dart';
import 'package:gotur/widgets/homepage_widgets/category_list_widget.dart';
import 'package:gotur/widgets/homepage_widgets/top_bar.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "götür",
            style: TextStyle(
                color: Colors.amberAccent,
                fontWeight: FontWeight.bold,
                fontSize: 25),
          ),
          centerTitle: true,
          elevation: 0,
          actions: <Widget>[
           CartButton(true)
          ],
        ),
        resizeToAvoidBottomInset: false,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            buildAddressList(),
            Expanded(
              child: buildProductList(),
            ),
            Row(
              children: <Widget>[
                BottomBar(Icons.home, Colors.purple),
                BottomBar(Icons.search, Colors.blueGrey),
                BottomBar(Icons.person, Colors.blueGrey),
                BottomBar(Icons.card_giftcard, Colors.blueGrey),
              ],
            ),
          ],
        ));
  }
  Widget buildAddressList() {
    return StreamBuilder(
      initialData: addressBloc.getAll(),
      stream: addressBloc.getStream,
      builder: (context, snapshoot) {
        return snapshoot.data.length > 0
            ? TopBar(snapshoot)
            : Center(
          child: Text("Yükleniyor."),
        );
      },
    );
  }
  Widget buildProductList() {
    return StreamBuilder(
      initialData: categoryBloc.getAll(),
      stream: categoryBloc.getStream,
      builder: (context, snapshoot) {
        return snapshoot.data.length > 0
            ? CategoryListWidget(snapshoot)
            : Center(
          child: Text("Yükleniyor."),
        );
      },
    );
  }

}
