import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gotur/widgets/bottom_bar.dart';
import 'package:gotur/widgets/cart_button.dart';
import 'package:gotur/widgets/products_widgets/products_scrolls.dart';
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



  @override


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
            child: PageView.builder(
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
              itemCount: 5,
              itemBuilder: (context,index){
                return Container(
                  width: 10,
                  height: 10,
                  color: Colors.grey[200],
                  child: ProductsScrolls(),
                );

              },
            ),
          ),
          Container(
            decoration: BoxDecoration(
                border:
                    Border(top: BorderSide(color: Colors.black, width: 0.1))),
            child: BottomBar([1,0,0,0])
          ),
        ],
      ),
    );
  }
}
