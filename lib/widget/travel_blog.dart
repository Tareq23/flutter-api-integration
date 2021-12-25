import 'package:flutter/material.dart';
import 'package:flutterapiconsume/model/travel.dart';
import 'package:flutterapiconsume/page/details.dart';

class TravelBlog extends StatelessWidget {
  final list = Travel.generateTravelBlog();
  final pageController = PageController(viewportFraction: 0.9);
  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        controller: pageController,
        itemCount: list.length,
        itemBuilder: (context, index){

      var travel = list[index];
      return GestureDetector(
        onTap: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context){
            return DetailsPage(travel: travel,);
          }));
        },
        child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(left:0,right: 10,bottom: 30),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image.asset(
                    travel.url,
                    height:double.infinity,
                    // width:double.infinity,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                left: 15,
                bottom: 60,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Material(
                      color: Colors.transparent,
                      child: Text(
                        travel.name,
                        style: const TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w600),
                      ),
                    ),
                    Material(
                      color: Colors.transparent,
                      child: Text(
                        travel.location,
                        style: const TextStyle(color: Colors.white,fontSize: 28,letterSpacing:2,fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                right: 40,
                bottom: 0,
                child: Container(
                    decoration:  BoxDecoration(
                    color: Colors.deepOrange,
                    borderRadius: BorderRadius.circular(30)
                  ),
                  child: const Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                    size: 45,
                  ),
                ),
              ),
            ],
        ),
      );
        }
    );
  }
}
