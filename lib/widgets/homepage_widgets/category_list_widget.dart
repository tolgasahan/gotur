import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gotur/widgets/homepage_widgets/category_list_widget_row.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
class CategoryListWidget extends StatelessWidget{
  AsyncSnapshot snapshot;
  CategoryListWidget(this.snapshot);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: <Widget>[
          ImageSlideshow(
            width: double.infinity,
            height: 200,
            initialPage: 0,
            indicatorColor: Colors.transparent,
            indicatorBackgroundColor: Colors.transparent,
            children: [
              Image.network(
                'https://i0.wp.com/www.drdavidludwig.com/wp-content/uploads/2017/01/1-RIS_6IbCLYv1X3bzYW1lmA.jpeg?fit=800%2C552&ssl=1',
                fit: BoxFit.cover,
              ),
              Image.network(
                'https://img.buzzfeed.com/tasty-app-user-assets-prod-us-east-1/recipes/9ca9adfae4a04ecf8ac3275fcef25e7b.png',
                fit: BoxFit.cover,
              ),
              Image.network(
                'https://image.winudf.com/v2/image/Y29tLmhhYmliaS5UYXN0eWFuZFl1bW15Rm9vZFJlY2lwZV9zY3JlZW5fMF8xNTE0MTkwNzU0XzA5Ng/screen-0.jpg?fakeurl=1&type=.webp',
                fit: BoxFit.cover,
              ),
            ],
            autoPlayInterval: 4000,
            isLoop: true,
          ),
          Container(
            padding: const EdgeInsets.all(10.0),
            child: GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                childAspectRatio: 1,
                mainAxisSpacing: 10.0,
                crossAxisSpacing:10.0,
              ),
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                return CategoryListWidgetRow(snapshot.data,index);
              },
            ),
          ),
        ],
      ),
    );
  }

}