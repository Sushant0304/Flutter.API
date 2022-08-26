import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
void main()=>runApp(const MaterialApp(home: HomePage(),debugShowCheckedModeBanner: false,));
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  var stringResponse;
  final url = 'https://jsonplaceholder.typicode.com/users';
  var _postJson = [];
  @override
  Widget build(BuildContext context) {
      fetchData();
    return Scaffold(
      appBar: AppBar(title:const Center(child: Text('Flutter API assignment')),backgroundColor: Colors.yellow[900],),
      body: ListView.builder(
          itemCount: _postJson.length,
          itemBuilder: (context,i){
            final post = _postJson[i];
            return Text("Username : ${post["username"]}\n email : ${post["email"]}\nname : ${post["name"]} \n");
          }
      ),
    );
  }
  Future fetchData() async{
    try{
    final response = await http.get(Uri.parse(url));
    final jsonData = jsonDecode(response.body) as List;
    setState(() {
      _postJson = jsonData;
    });
    }catch(err) {}
  }
}
