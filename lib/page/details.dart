import 'package:flutter/material.dart';
import 'package:flutterapiconsume/model/travel.dart';
class DetailsPage extends StatelessWidget {

  final Travel travel;

  DetailsPage({required this.travel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              _buildSliverHead(MediaQuery.of(context).size.height/3),
              SliverToBoxAdapter(
                child: _buildDetails(),
              )
            ],
          ),
          Padding(
            padding:  EdgeInsets.only(top: MediaQuery.of(context).padding.top,left: 20,right: 20),
            child: SizedBox(
              height: 80,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:  [
                    GestureDetector(
                      onTap: (){
                          Navigator.of(context).pop();
                      },
                      child: const Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                      },
                      child: const Icon(
                        Icons.menu,
                        color: Colors.white,
                        size: 30,
                      ),
                    )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
  Widget _buildSliverHead(contextWidth){
    return SliverPersistentHeader(
      delegate: DetailsSliverDelegated(travel: travel,mxExtent: contextWidth),
    );
  }
  Widget _buildDetails()
  {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          _buildUserInfo(),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
            child: Text(
                  ' headers should behave in response to RenderObject.showOnScreen calls. '
                  'Specifies how floating headers and pinned headers should behave in response to RenderObject.showOnScreen calls. '
                  'Specifies how floating headers and pinned headers should behave in response to RenderObject.showOnScreen calls.',
              style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400,color: Colors.black38),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Featured",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 24,color: Colors.black),),
                TextButton(onPressed: (){}, child: const Text("view all",style: TextStyle(fontSize: 16,color: Colors.deepOrange),)),
              ],
            ),
          ),
          // FeaturedWidget(),  here get error
        ],
      ),
    );
  }
  Widget _buildUserInfo(){
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 15,vertical: 10),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Image.asset(
              travel.url,
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding:  EdgeInsets.only(left: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(travel.name,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
                Text(travel.location,style: TextStyle(fontSize: 20,),),
              ],
            ),
          ),
          Spacer(),
          Icon(
            Icons.share,
            color: Colors.grey,
          )
        ],
      ),
    );
  }
}

class FeaturedWidget extends StatelessWidget{
  // ignore: non_constant_identifier_names
  final _travel_list = Travel.generateMostPopular();

  @override
  Widget build(BuildContext context){
    return ListView.separated(
        // shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.all(10),
        itemBuilder:(context,index){
          var travel = _travel_list[index];
          return Container(
            height: 50,
            width: 150,
            child: Image.asset(
              travel.url,
              // height: double.infinity,
              fit: BoxFit.cover,
            ),
          );
        },
        separatorBuilder: (context, index){
          return  SizedBox(width: 10,);
        },
        itemCount: _travel_list.length
    );
  }
}




class DetailsSliverDelegated extends SliverPersistentHeaderDelegate
{

  final Travel travel;
  final mxExtent;
  final mnExtent = 0.0;
  DetailsSliverDelegated({required this.travel,required this.mxExtent});

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    // print('$shrinkOffset');
    return Stack(
      children: [
        Opacity(
          opacity: 0.6,
          child: Image.asset(
            travel.url,
            width: MediaQuery.of(context).size.width,
            height: mxExtent,
            // height: 400.0,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          left: 0,
          top: mxExtent - 50 - shrinkOffset,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: mxExtent - 120 ,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
          ),
        ),
        Positioned(
          left: 20,
          top: mxExtent - 120 - shrinkOffset,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(travel.name,style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18,color: Colors.brown),),
              SizedBox(height: 15,),
              Text(travel.location,style: TextStyle(fontWeight: FontWeight.w400,fontSize: 16,color: Colors.brown),),

            ],
          )
        ),
      ],
    );
  }

  @override
  // TODO: implement maxExtent
  double get maxExtent => mxExtent;

  @override
  // TODO: implement minExtent
  double get minExtent => mnExtent;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    // // TODO: implement shouldRebuild
    // throw UnimplementedError();
    return true;
  }

}