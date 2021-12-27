import 'package:flutter/material.dart';



class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: const Center(
        child: Text('Home Page'),
      ),
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
