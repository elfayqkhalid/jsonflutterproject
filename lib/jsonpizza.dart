import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as rootBundle;
import 'jsonproductdatamodel.dart';
import 'jsonpizzanext.dart';

/*void main() {
  runApp(JsonPizza());
}*/

class JsonPizza extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pizza JSON',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Buvette Universiapolis Laayoune")),
        body: SafeArea(
          child: FutureBuilder(
            future: ReadJsonData(),
            builder: (context, data) {
              if (data.hasError) {
                return Center(child: Text("${data.error}"));
              } else if (data.hasData) {
                var items = data.data as List<ProductDataModel>;
                return ListView.builder(
                    itemCount: items == null ? 0 : items.length,
                    itemBuilder: (context, index) {
                      final produit = items[index];
                      return Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        margin: const EdgeInsets.all(10.0),
                        color: Colors.deepOrangeAccent,
                        child: ListTile(
                          leading: Image(
                            image: AssetImage(produit.imageURL.toString()),
                            fit: BoxFit.fill,
                            width: 100.0,
                            height: 100.0,
                          ),
                          title: Text(
                            produit.name.toString(),
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 20.0),
                          ),
                          trailing: const Icon(Icons.navigate_next),
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => Resto(produit: produit),
                            ));
                          },
                        ),
                      );
                    });
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ));
  }

  Future<List<ProductDataModel>> ReadJsonData() async {
    final jsondata =
        await rootBundle.rootBundle.loadString('jsonfile/pizzalist.json');
    final list = json.decode(jsondata) as List<dynamic>;
    return list.map((e) => ProductDataModel.fromJson(e)).toList();
  }
}
