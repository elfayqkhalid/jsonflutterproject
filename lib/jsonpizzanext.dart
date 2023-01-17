import 'package:flutter/material.dart';
import 'jsonproductdatamodel.dart';

class Resto extends StatelessWidget {
  final ProductDataModel produit;

  const Resto({Key? key, required this.produit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios),
            ),
            centerTitle: true,
            title: Text(produit.name.toString())),
        body: Center(
          child: SafeArea(
            child: Column(children: [
              const SizedBox(height: 30),
              Container(
                padding: const EdgeInsets.all(6.0),
                height: MediaQuery.of(context).size.height * 0.5,
                decoration: new BoxDecoration(
                  image: new DecorationImage(
                    image: new AssetImage(produit.imageURL.toString()),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Text(
                "Prix : ${produit.price.toString()} DH",
                style: const TextStyle(
                  fontSize: 25.0,
                  color: Colors.blue,
                ),
              ),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: RichText(
                  text: TextSpan(
                    text: 'Les composants: ',
                    style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                        decorationColor: Colors.redAccent,
                        color: Colors.blue),
                    children: <TextSpan>[
                      TextSpan(
                        text: produit.components.toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.normal,
                            decorationColor: Colors.green,
                            color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
