import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const  MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: HomeApp(),
    );
  }
}

class HomeApp extends StatefulWidget {
  const HomeApp({Key? key}) : super(key: key);
  @override
  _HomeAppState createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp> {

  final GlobalKey<ScaffoldState> _globalKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: (){},
          icon: const Icon(Icons.arrow_back_ios_outlined,color: Colors.grey,),
        ),
        actions: const  [
          Icon(
            Icons.add_shopping_cart,color: Colors.blueGrey,
          ),
          SizedBox(width: 20,),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(18),
            child: Row(
              children:  [
               const Expanded(
                  child: Text(
                    "ShopX",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: (){},
                  icon: Icon(Icons.view_list_rounded),
                ),
                IconButton(
                  onPressed: (){},
                  icon:  Icon(Icons.grid_view),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

