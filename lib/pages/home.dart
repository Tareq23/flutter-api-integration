import 'package:flutter/material.dart';
import 'package:flutterapiconsume/constants/api_url.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
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

  String? stringReponse;

  Future apiCall() async{

    http.Response response;
    response = await http.get(Uri.parse(APIURL.SINGLE_USER));
    if(response.statusCode == 200){

      setState(() {
        stringReponse = response.body;
      });

    }
  }

  @override
  void initState() {
    apiCall();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('API Integration',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700,fontSize: 28),),
        backgroundColor: Colors.deepOrange.shade700,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Text(stringReponse.toString()),
        ),
      ),
    );
  }
}

