import 'dart:math';

import 'package:flutter/material.dart';

class MyCustomScrollView extends StatelessWidget {
  const MyCustomScrollView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          //title: Text("Sliver App Bar", style: TextStyle(color: Colors.red)),
          backgroundColor: Colors.red,
          expandedHeight: 150,
          floating: true,
          snap: false,
          pinned: true,
          flexibleSpace: FlexibleSpaceBar(
            centerTitle: true,
            title: const Text(
              "Sinem ALAGÖZ",
              style: TextStyle(color: Colors.amber),
            ),
            background: Image.asset(
              "assets/images/honda.jpg",
              fit: BoxFit.cover,
            ),
          ),
        ),

        SliverList(delegate: SliverChildListDelegate(sabitListeElemanlari)),

        SliverPadding(
          padding: EdgeInsets.all(10),
          sliver: SliverList(
              delegate: SliverChildBuilderDelegate(_dinamikListeElemanlari,
                  childCount: sabitListeElemanlari.length)),
        ),

        SliverGrid(
            delegate: SliverChildListDelegate(sabitListeElemanlari),
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3)),

        SliverGrid(
            delegate: SliverChildBuilderDelegate(_dinamikListeElemanlari,
                childCount: sabitListeElemanlari.length),
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2)),

        SliverGrid(
            delegate: SliverChildBuilderDelegate(_dinamikListeElemanlari,
                childCount: sabitListeElemanlari.length),
            gridDelegate:
                SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 100)
                ),
        SliverGrid.count(crossAxisCount: 3, children: sabitListeElemanlari,),

        SliverGrid.extent(maxCrossAxisExtent: 300, children: sabitListeElemanlari,),

      
        //  SliverGrid.count(crossAxisCount: 2),
        //SliverGrid.extent(maxCrossAxisExtent: 100)
        //  SliverGrid(delegate: delegate, gridDelegate: gridDelegate)

        // SliverList(delegate: null,),
        // SliverFixedExtentList(delegate: delegate, itemExtent: itemExtent),
        // SliverGrid(delegate: delegate, gridDelegate: gridDelegate),
      ],
    );
  }

  List<Widget> get sabitListeElemanlari {
    return [
      MyContainer(color: Colors.blue),
      MyContainer(color: Colors.green),
      MyContainer(color: Colors.pink),
      MyContainer(color: Colors.yellow),
      MyContainer(color: Colors.brown),
      MyContainer(color: Colors.orange),

      //Image.asset("assets/images/honda.jpg")
    ];
  }

  Container MyContainer({required Color color}) {
    return Container(
      height: 150,
      color: color,
      alignment: Alignment.center,
      child: Text(
        "Sabit Liste Elemanı",
        style: TextStyle(fontSize: 30),
      ),
    );
  }

  Widget _dinamikListeElemanlari(BuildContext context, int index) {
    // return sabitListeElemanlari[index];

    return Container(
      height: 150,
      color: colorUret(),
      alignment: Alignment.center,
      child: Text(
        "Sabit Liste Elemanı ${index}",
        style: TextStyle(fontSize: 30),
      ),
    );
  }

  Color colorUret() {
    var renk = Random();

    return Color.fromARGB(renk.nextInt(255), renk.nextInt(255),
        renk.nextInt(255), renk.nextInt(255));
  }
}
