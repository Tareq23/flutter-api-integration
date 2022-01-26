import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutterapiconsume/constants/fetch_data_from_api.dart';
import 'package:flutterapiconsume/model/user.dart';
import 'package:flutterapiconsume/model/users.dart';
import 'package:flutterapiconsume/pages/user.dart';
import 'package:flutterapiconsume/widgets/drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
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
      drawer: DrawerWidget(
        globalKey: _globalKey,
      ),
      key: _globalKey,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            _globalKey.currentState!.openDrawer();
          },
          icon: const Icon(
            Icons.menu_rounded,
            color: Colors.grey,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: FetchApiData.readAllUserData(),
              builder: (context,dataSet){
                if(dataSet.hasError)
                  {
                    return Center(
                      child: Text(dataSet.error.toString()),
                    );
                  }
                else if(dataSet.hasData){
                  var userData = dataSet.data as AllUsersModel;
                  return MasonryGridView.count(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    physics: const ScrollPhysics(),
                    itemCount: userData.userList!.length,
                    crossAxisCount: 2,
                    mainAxisSpacing: 4,
                    crossAxisSpacing: 4,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: (){

                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) =>
                                  UserPage(
                                      id: userData.userList![index].id,
                                  )));
                        },
                        child: Card(
                          elevation: 13,
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 15),

                            decoration: BoxDecoration(
                                color: Colors.white60,
                                borderRadius: BorderRadius.circular(15),
                            ),
                            child: Column(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(30),
                                  child: Container(
                                    constraints: const BoxConstraints(
                                        minHeight: 250
                                    ),
                                    child: Image(
                                      image: NetworkImage(userData.userList![index].avatarUrl.toString()),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 20,),
                                Text(userData.userList![index].firstName.toString()+" "+userData.userList![index].lastName.toString(),style: TextStyle(fontWeight: FontWeight.w500,fontSize: 22),),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }
                else{
                  return const  Center(
                    child: CircularProgressIndicator(),
                  );
                }
                
              },
            ),
          )
        ],
      ),
    );
  }
}
