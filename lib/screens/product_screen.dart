import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gotur/widgets/bottom_bar.dart';
import 'package:gotur/widgets/cart_button.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class ProductScreen extends StatelessWidget {
  @override
  PageController _controller = PageController(
    initialPage: 0,
  );

  ItemScrollController _scrollController = ItemScrollController();

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
                  SizedBox(
                    child: TextButton(
                      onPressed: () {
                        _controller.animateToPage(0,
                            duration: Duration(milliseconds: 500),
                            curve: Curves.decelerate);
                      },
                      style: ButtonStyle(
                        overlayColor:
                            MaterialStateProperty.all(Colors.transparent),
                        splashFactory: NoSplash.splashFactory,
                      ),
                      child: Text(
                        "Ürünler",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                          width: double.infinity,
                          height: 40,
                          color: Colors.white,
                          child: Row(
                            children: [
                              ElevatedButton(
                                  child: Text("1"),
                                  onPressed: () {
                                    _scrollController.scrollTo(
                                        index: 0,
                                        duration: Duration(milliseconds: 500),
                                        curve: Curves.decelerate);
                                  }),
                              ElevatedButton(
                                  child: Text("2"),
                                  onPressed: () {
                                    _scrollController.scrollTo(
                                        index: 1,
                                        duration: Duration(milliseconds: 500),
                                        curve: Curves.decelerate);
                                  }),
                            ],
                          )),
                      Container(
                          width: double.infinity,
                          height: 1,
                          decoration: BoxDecoration(
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                  color: Colors.black54,
                                  blurRadius: 15.0,
                                  offset: Offset(0.0, 0.75))
                            ],
                          )),
                      Expanded(
                        child: ScrollablePositionedList.builder(
                          padding: EdgeInsets.only(bottom: 10),
                          scrollDirection: Axis.vertical,
                          itemScrollController: _scrollController,
                          itemCount: 8,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                Container(margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),child: Text("Yeni ürünler 1",style: TextStyle(color: Colors.grey[700],fontWeight: FontWeight.w400),),alignment: FractionalOffset.bottomLeft,),
                                Container(
                                    decoration: BoxDecoration(
                                      boxShadow: <BoxShadow>[
                                        BoxShadow(
                                            color: Colors.black12,
                                            blurRadius: 5,
                                            offset: Offset(0.0, 0.5))
                                      ],
                                      color: Colors.white,
                                    ),
                                    width: double.infinity,
                                    height: 150,
                                  ),

                              ],
                            );
                          },
                        ),
                      ),
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
                                  offset: Offset(0.0, 0.75))
                            ],
                          ))
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
                                  offset: Offset(0.0, 0.75))
                            ],
                          ))
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
                                  offset: Offset(0.0, 0.75))
                            ],
                          ))
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
