import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';


/*void main() {
  runApp(TestJson());
}*/


class TestJson extends StatefulWidget {
  const TestJson({Key? key}) : super(key: key);

  @override
  State<TestJson> createState() => _TestJsonState();
}

class _TestJsonState extends State<TestJson> {
  Future getData() async {

    var url = "https://raw.githubusercontent.com/elfayqkhalid/jsonflutterproject/main/productlist.json";
    var response = await http.get(Uri.parse(url));
    var responseBody = jsonDecode(response.body);
    return responseBody;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Test JSON"),
        ),
        body: FutureBuilder(
          future: getData(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data.length, //10
                  itemBuilder: (context, i) {
                    return Container(
                      child: Text(snapshot.data[i]['name']),
                    );
                  });
            } else
              return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
