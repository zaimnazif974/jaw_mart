import 'package:flutter/material.dart';
import 'package:jaw_mart/widgets/left_drawer.dart';
import 'package:jaw_mart/widgets/jaw_items_card.dart';

class JawItems{
  final String name;
  final int price;
  final String category;
  final int amount;
  final String effect;
  final String description;
  final DateTime dateAdded;
  final Color color;

  JawItems(this.name,this.price,this.category,this.amount,
      this.effect,this.description,this.dateAdded,this.color);
}

List<JawItems> jawItems =[];

class JawItemsList extends StatefulWidget {
  const JawItemsList({super.key});

  @override
  State<JawItemsList> createState() => _JawItemsListState();
}

class _JawItemsListState extends State<JawItemsList>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black54 ,
        foregroundColor: Colors.white,
        title: const Text(
          'Jaw Mart',
          style: TextStyle(color: Colors.white),
        ),
      ),
      drawer : const LeftDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                child: Text(
                  'Welcome to Jaw Mart',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              // Grid layout
              GridView.count(
                primary: true,
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 3,
                shrinkWrap: true,
                children: jawItems.map((JawItems item) {
                  return JawItemsCard(item);
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


