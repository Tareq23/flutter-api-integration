import 'package:flutter/material.dart';
import 'package:flutterapiconsume/widget/most_popular.dart';
import 'package:flutterapiconsume/widget/travel_blog.dart';

class HomePage extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: AppBar(
          elevation: 1,
          // backgroundColor: Colors.white.withOpacity(0.5),
          backgroundColor: Colors.white,
          actions: const [
            Padding(
              padding: EdgeInsets.all(10),
              child: Icon(
                Icons.menu,
                size: 50,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget> [
          Padding(
            padding: EdgeInsets.only(left: 15),
            child: Text("Travel Blog",style: TextStyle(fontSize: 30,letterSpacing: 0,wordSpacing: 5),),
          ),
          Expanded(
            flex: 2,
            child: TravelBlog(),
          ),
          Padding(
            // padding: const EdgeInsets.all(8.0),
            padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Most Populer",style: TextStyle(fontSize: 18),),
                const Text("View More", style: TextStyle(fontSize: 18,color: Colors.deepOrangeAccent),),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: MostPopular(),
          )
        ],
      ),
    );
  }
}