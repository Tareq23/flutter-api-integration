import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {


  final GlobalKey<ScaffoldState> globalKey;
  const DrawerWidget({Key? key, required this.globalKey}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        width: MediaQuery.of(context).size.width/2.5,
        height: double.infinity,
        decoration: BoxDecoration(
          color:Colors.cyan.shade900,
        ),
        child: ListView(
          children: [
            Container(
              height: 340,
              color: Colors.orange.shade900,
              alignment: Alignment.center,
              child: const Text('API Consume',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w900,fontSize: 32),),
            ),
            GestureDetector(
              onTap: (){
                globalKey.currentState!.openEndDrawer();
              },
              child: Container(
                  margin: const EdgeInsets.only(top: 20),
                  padding: const EdgeInsets.only(left: 30),
                  child: const Text('All Users',style: TextStyle(color: Colors.white,fontSize: 26,fontWeight: FontWeight.w500),),
              ),
            ),
            GestureDetector(
              onTap: (){
                globalKey.currentState!.openEndDrawer();
              },
              child: Container(
                  margin: const EdgeInsets.only(top: 20),
                  padding: const EdgeInsets.only(left: 30),
                  child: const Text('All Resource',style: TextStyle(color: Colors.white,fontSize: 26,fontWeight: FontWeight.w500),),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
