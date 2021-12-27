import 'package:flutter/material.dart';
import 'package:flutterapiconsume/pages/home/widgets/custom_tab.dart';



class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var tabIndex=0;
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
            )
        ],
      )
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

}
