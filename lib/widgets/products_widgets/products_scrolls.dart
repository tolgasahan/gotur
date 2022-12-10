import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class ProductsScrolls extends StatefulWidget {
  @override
  State<ProductsScrolls> createState() => _ProductsScrollsState();
}

class _ProductsScrollsState extends State<ProductsScrolls> {
  ItemScrollController _scrollController = ItemScrollController();
  ItemPositionsListener _itemPositionsListener = ItemPositionsListener.create();
  ItemScrollController _scrollHorizontal = ItemScrollController();
  int selectedIndex = 0;
  var selectedIndexColor;
  var selectedIndexTextColor;
  int itemCount = 8;

  @override
  void initState() {
    scrollControl();
    super.initState();
  }

  scrollControl() async {
    _itemPositionsListener.itemPositions.addListener(() {
      final indices = _itemPositionsListener.itemPositions.value
          .map((item) => item.index)
          .toList();

      if (indices.last == itemCount - 1) {
        WidgetsBinding.instance!.addPostFrameCallback((_) =>
            _scrollHorizontal.scrollTo(
                index: indices.last,
                duration: Duration(milliseconds: 1000),
                curve: Curves.decelerate,
                alignment: 0.38));
        selectedIndex = indices.last;
      } else {
        WidgetsBinding.instance!.addPostFrameCallback((_) =>
            _scrollHorizontal.scrollTo(
                index: indices[0],
                duration: Duration(milliseconds: 1000),
                curve: Curves.decelerate,
                alignment: 0.38));
        selectedIndex = indices[0];
      }
    });
  }

  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: double.infinity,
          height: 40,
          color: Colors.white,
          child: ScrollablePositionedList.builder(
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 6),
              shrinkWrap: true,
              itemScrollController: _scrollHorizontal,
              itemCount: itemCount,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                if (selectedIndex == index) {
                  selectedIndexColor = Colors.yellowAccent;
                  selectedIndexTextColor = Colors.white;
                } else {
                  selectedIndexColor = Colors.transparent;
                }
                return Container(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.purpleAccent),
                        overlayColor:
                            MaterialStateProperty.all(Colors.purpleAccent),
                        elevation: MaterialStateProperty.all(0),
                      ),
                      onPressed: () {
                        _scrollController.scrollTo(
                            index: index,
                            duration: Duration(milliseconds: 500),
                            curve: Curves.decelerate);
                      },
                      child: Text("Ürünler ${index + 1}")),
                );
              }),
        ),
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
            itemPositionsListener: _itemPositionsListener,
            padding: EdgeInsets.only(bottom: 10),
            scrollDirection: Axis.vertical,
            itemScrollController: _scrollController,
            itemCount: itemCount,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: Text(
                      "Yeni ürünler ${index + 1}",
                      style: TextStyle(
                          color: Colors.grey[700], fontWeight: FontWeight.w400),
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
    );
  }
}
