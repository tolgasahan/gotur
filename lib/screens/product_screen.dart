import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gotur/widgets/bottom_bar.dart';
import 'package:gotur/widgets/cart_button.dart';

class ProductScreen extends StatelessWidget {
  @override
  PageController _controller = PageController(
    initialPage: 0,
  );
  void dispose() {
    _controller.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back,
          ),
        ),
        backgroundColor: Colors.purple,
        title: Text(
          "Ürünler",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
        ),
        centerTitle: true,
        elevation: 0,
        actions: <Widget>[CartButton(true)],
      ),
      body: Column(
        children: [
          Container(
            color: Colors.purpleAccent,
            height: 40,
            width: double.infinity,
            alignment: Alignment.centerLeft,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  SizedBox(child: TextButton(

                    onPressed: () {
                      _controller.animateToPage(0,
                          duration: Duration(milliseconds: 500),
                          curve: Curves.decelerate);
                    },
                    style: ButtonStyle(overlayColor: MaterialStateProperty.all(Colors.transparent), splashFactory: NoSplash.splashFactory,),
                    child: Text("Ürünler",style: TextStyle(color: Colors.white),),

                  ),)
                  ,
                  ElevatedButton(
                      onPressed: () {
                        _controller.animateToPage(1,
                            duration: Duration(milliseconds: 500),
                            curve: Curves.decelerate);
                      },
                      child: Text("Ürünler")),
                  ElevatedButton(
                      onPressed: () {
                        _controller.animateToPage(2,
                            duration: Duration(milliseconds: 500),
                            curve: Curves.decelerate);
                      },
                      child: Text("Ürünler")),
                  ElevatedButton(
                      onPressed: () {
                        _controller.animateToPage(3,
                            duration: Duration(milliseconds: 500),
                            curve: Curves.decelerate);
                      },
                      child: Text("Ürünler"))
                ],
              ),
            ),
          ),
          Expanded(
            child: PageView(
              controller: _controller,
              children: [
                Container(
                  width: 10,
                  height: 10,
                  color: Colors.grey[200],
                  child: Column(
                    children: [
                      Container(
                          width: double.infinity,
                          height: 40,
                        color: Colors.white,
                        child: Text("Yeni Ürünler"),
                        ),
                      Container(
                          width: double.infinity,
                          height: 1,
                          decoration: BoxDecoration(
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                  color: Colors.black54,
                                  blurRadius: 15.0,
                                  offset: Offset(0.0, 0.75)
                              )
                            ],
                          )
                      )

                    ],
                  ),
                ),
                Container(
                  width: 10,
                  height: 10,
                  color: Colors.grey[200],
                  child: Column(
                    children: [
                      Container(
                          width: double.infinity,
                          height: 40,
                        color: Colors.white,
                          child: Text("Yeni Ürünler"),
                          ),
                      Container(
                          width: double.infinity,
                          height: 1,
                          decoration: BoxDecoration(
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                  color: Colors.black54,
                                  blurRadius: 15.0,
                                  offset: Offset(0.0, 0.75)
                              )
                            ],
                          )
                      )
                    ],
                  ),
                ),
                Container(
                  width: 10,
                  height: 10,
                  color: Colors.grey[200],
                  child: Column(
                    children: [
                      Container(
                          width: double.infinity,
                          height: 40,
                        color: Colors.white,
                          child: Text("Yeni Ürünler"),
                          ),
                      Container(
                        width: double.infinity,
                        height: 1,
                        decoration: BoxDecoration(
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                                color: Colors.black54,
                                blurRadius: 15.0,
                                offset: Offset(0.0, 0.75)
                            )
                          ],
                        )
                      )
                    ],
                  ),
                ),
                Container(
                  width: 10,
                  height: 10,
                  color: Colors.grey[200],
                  child: Column(
                    children: [
                      Container(
                        color: Colors.white,
                          width: double.infinity,
                          height: 40,
                          child: Text("Yeni Ürünler"),
                          ),
                      Container(
                          width: double.infinity,
                          height: 1,
                          decoration: BoxDecoration(
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                  color: Colors.black54,
                                  blurRadius: 15.0,
                                  offset: Offset(0.0, 0.75)
                              )
                            ],
                          )
                      )
                    ],
                  ),
                ),
              ],
            ),
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
      ),
    );
  }
}
