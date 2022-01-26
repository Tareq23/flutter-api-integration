import 'package:flutter/material.dart';
import 'package:flutterapiconsume/constants/fetch_data_from_api.dart';
import 'package:flutterapiconsume/model/user.dart';
import 'package:flutterapiconsume/pages/home.dart';

class UserPage extends StatefulWidget {
  final id;
  final name;
  const UserPage({Key? key,this.id,this.name}) : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  _UserPageState createState() => _UserPageState(id: id);
}



class _UserPageState extends State<UserPage> {
  var appBarTitle = "User Details";
  final id;
  final name;
  var textStyle = const TextStyle(fontWeight: FontWeight.w400,fontSize: 24);
  _UserPageState({this.id,this.name});

  // @override
  // void initState() {
  //   setState(() {
  //     appBarTitle = name.toString() + " Details";
  //   });
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(appBarTitle,style: TextStyle(fontSize: 26,fontWeight: FontWeight.w500,color: Colors.cyan.shade900),),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
            // Navigator.push(context, MaterialPageRoute(builder: (context)=>const HomePage()));
          },
          icon: const Icon(
            Icons.arrow_back_ios_rounded,
            color: Colors.grey,
          ),
        ),
      ),
      body: FutureBuilder(
        future: FetchApiData.readUserData(id),
        builder: (context,dataSet){
          if(dataSet.hasError)
            {
              return Center(
                child: Text(dataSet.error.toString()),
              );
            }
          else if(dataSet.hasData)
            {
              var user = dataSet.data as UserModel;
              // setState(() {
              //   appBarTitle = user.firstName.toString() + " " + user.lastName.toString() + " Details";
              // });
              return Column(
                children: [
                  const SizedBox(height: 20,),
                  Column(
                      children : [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            constraints: const BoxConstraints(
                              minHeight: 250,
                            ),
                            child: Image(
                              image: NetworkImage(user.avatarUrl.toString()),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(height: 30,),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Text('First Name : ',style: textStyle,),
                              Expanded(child: Text("${user.firstName}",style: textStyle,)),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Text('Last Name : ',style: textStyle,),
                              Expanded(child: Text("${user.lastName}",style: textStyle,)),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Text('Email : ',style: textStyle,),
                              Expanded(child: Text("${user.email}",style: textStyle,)),
                            ],
                          ),
                        ),
                      ]
                  ),
                ],
              );
            }
          else {
            return const CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
