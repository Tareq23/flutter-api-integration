import 'package:flutter/material.dart';
import 'package:flutterapiconsume/pages/home/widgets/book_staggered_grid_view.dart';
import 'package:flutterapiconsume/pages/home/widgets/custom_tab.dart';



class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var tabIndex=0;
  var bottomIndex=0;
  final pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Column(
        children: [
            CustomTab(
              tabIndex,
                (int index){
                  setState(() {
                    tabIndex = index;
                  });

                  if(pageController.hasClients) {
                    pageController.jumpToPage(index);
                  }
                }
            ),
          Expanded(
            child: BookStaggeredGridView(
              tabIndex,
              pageController,
                (int index){
                  setState(() {
                    index = tabIndex;
                  });
                }
            ),
          ),
        ],
      ),
      bottomNavigationBar: _bottomNavigationBar(),
    );
  }

  AppBar _buildAppBar()
  {
    return AppBar(
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      leading: const Icon(
        Icons.menu_rounded,
        color: Colors.grey,
      ),
      title: const Text('All Books',style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w600,fontSize: 24),),
      centerTitle: true,
      actions: [
        IconButton(
            onPressed: (){},
            icon: const Icon(Icons.search,color: Colors.grey,)
        ),
      ],

    );
  }

  Widget _bottomNavigationBar()
  {
    final bottoms = [
      Icons.home_outlined,
      Icons.analytics_outlined,
      Icons.keyboard_voice_outlined,
      Icons.bookmark_border_outlined,
      Icons.person_outlined,
    ];
    var width = MediaQuery.of(context).size.width;
    return SizedBox(
      width: width,
      height: 56,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder:(context,index){
            return GestureDetector(
              onTap: () => setState(() {
                bottomIndex = index;
              }),
              child: Container(
                width: (width - 40)/5,
                padding: const EdgeInsets.symmetric(vertical: 10),
                decoration: bottomIndex == index ? const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      width: 3,
                      color: Colors.deepOrange,
                    )
                  )
                ) : null,
                child: Icon(
                  bottoms[index],
                  size: 30,
                  color: bottomIndex == index ? Colors.lime : Colors.grey[600],
                ),
              ),

            );
          },
          separatorBuilder: (_,index){
            return const SizedBox(width: 10,);
          },
          itemCount: bottoms.length,
      ),
    );
  }

}
