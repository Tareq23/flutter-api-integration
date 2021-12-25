import 'package:flutter/material.dart';
import 'package:flutterapiconsume/model/travel.dart';
import 'package:flutterapiconsume/page/details.dart';


class MostPopular extends StatelessWidget {

  final list = Travel.generateMostPopular();

  MostPopular({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        padding: const EdgeInsets.only(left: 10,right: 15,bottom: 20),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context,index){
          var _travel = list[index];
          return GestureDetector(
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context){
                return DetailsPage(travel: _travel,);
              }));
            },
            child: Stack(
              children: <Widget> [
                ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image.asset(
                    _travel.url,
                    width: 150,
                    height: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  left: 15,
                  bottom: 30,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget> [
                      Material(
                        color: Colors.transparent,
                        child: Text(_travel.name,style: TextStyle(fontSize: 22,fontWeight: FontWeight.w500,color: Colors.white),),
                      ),
                      Material(
                        color: Colors.transparent,
                        child: Text(_travel.location,style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400,color: Colors.white),),
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        },
        separatorBuilder: (_, index){
          return const SizedBox(
            width: 20,
          );
        },
        itemCount: list.length
    );
  }
}
