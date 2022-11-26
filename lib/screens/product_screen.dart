import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gotur/widgets/bottom_bar.dart';
import 'package:gotur/widgets/cart_button.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class ProductScreen extends StatefulWidget {
  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  PageController _controller = PageController(
    initialPage: 0,
  );

  int selectedIndex = 0;

  var selectedIndexColor;

  ItemScrollController _scrollVertical = ItemScrollController();

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
            child: ScrollablePositionedList.builder(
                padding: EdgeInsets.symmetric(horizontal: 10),
                shrinkWrap: true,
                itemScrollController: _scrollVertical,
                itemCount: 20,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  if (selectedIndex == index) {
                    selectedIndexColor = Colors.yellowAccent;
                  } else {
                    selectedIndexColor = Colors.transparent;
                  }
                  return Container(
                    padding: EdgeInsets.only(bottom: 2),
                    child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.purpleAccent),
                            overlayColor:
                                MaterialStateProperty.all(Colors.purpleAccent),
                            elevation: MaterialStateProperty.all(0),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.zero))),
                        onPressed: () {
                          _controller.animateToPage(index,
                              duration: Duration(milliseconds: 500),
                              curve: Curves.decelerate);
                        },
                        child: Text("Ürünler ${index + 1}")),
                    color: selectedIndexColor,
                  );
                }),
          ),
          Expanded(
            child: PageView(
              onPageChanged: (index) {
                setState(() {
                  _scrollVertical.scrollTo(
                      index: index,
                      duration: Duration(milliseconds: 500),
                      curve: Curves.decelerate,
                      alignment: 0.40);
                  selectedIndex = index;
                });
              },
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
                                  color: Colors.black12,
                                  blurRadius: 5,
                                  offset: Offset(0.0, 0.5))
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
                                Container(
                                  margin: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 10),
                                  child: Text(
                                    "Yeni ürünler ${index + 1}",
                                    style: TextStyle(
                                        color: Colors.grey[700],
                                        fontWeight: FontWeight.w400),
                                  ),
                                  alignment: FractionalOffset.bottomLeft,
                                ),
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
          Container(
            decoration: BoxDecoration(
                border:
                    Border(top: BorderSide(color: Colors.black, width: 0.1))),
            child: Row(
              children: <Widget>[
                BottomBar(Icons.home, Colors.purple),
                BottomBar(Icons.search, Colors.blueGrey),
                BottomBar(Icons.person, Colors.blueGrey),
                BottomBar(Icons.card_giftcard, Colors.blueGrey),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
