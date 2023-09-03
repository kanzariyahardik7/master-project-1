import 'package:flutter/material.dart';
import 'package:photos/ui_helper/utils.dart';

class GridViewPage extends StatefulWidget {
  const GridViewPage({Key? key}) : super(key: key);

  @override
  State<GridViewPage> createState() => _GridViewPageState();
}

class _GridViewPageState extends State<GridViewPage> {
  @override
  Widget build(BuildContext context) {
    var ColorsList = [
      Colors.red,
      Colors.yellow,
      Colors.blue,
      Colors.green,
      Colors.purple,
      Colors.orange,
      Colors.pink,
      Colors.brown,
      Colors.blue,
      Colors.grey,
      Colors.greenAccent,
      Colors.yellowAccent,
      Colors.pink
    ];
    return Scaffold(
      appBar: Custom_Appbar("Gried View"),
       body: Container(
         decoration: BoxDecoration(gradient: Orange_Gradiant()),
         child: GridView.builder(
           gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 150,crossAxisSpacing: 11,mainAxisSpacing: 11),
           itemCount: ColorsList.length,
             itemBuilder: (context,index){
               return Container(
                   color: ColorsList[index]
               );
             }

         ),
       )
      // Padding(
      //   padding: const EdgeInsets.all(8.0),
      //   child: Column(
      //     children: [
      //       Container(
      //         height: 300,
      //         child: GridView.count(
      //           crossAxisCount: 3,
      //           children: [
      //             Padding(
      //               padding: const EdgeInsets.all(8.0),
      //               child: Container(color: ColorsList[0],),
      //             ),
      //             Padding(
      //               padding: const EdgeInsets.all(8.0),
      //               child: Container(color: ColorsList[1],),
      //             ),
      //             Padding(
      //               padding: const EdgeInsets.all(8.0),
      //               child: Container(color: ColorsList[2],),
      //             ),
      //             Padding(
      //               padding: const EdgeInsets.all(8.0),
      //               child: Container(color: ColorsList[3],),
      //             ),
      //             Padding(
      //               padding: const EdgeInsets.all(8.0),
      //               child: Container(color: ColorsList[4],),
      //             ),
      //             Padding(
      //               padding: const EdgeInsets.all(8.0),
      //               child: Container(color: ColorsList[5],),
      //             ),
      //             Padding(
      //               padding: const EdgeInsets.all(8.0),
      //               child: Container(color: ColorsList[6],),
      //             ),
      //             Padding(
      //               padding: const EdgeInsets.all(8.0),
      //               child: Container(color: ColorsList[7],),
      //             ),
      //             Padding(
      //               padding: const EdgeInsets.all(8.0),
      //               child: Container(color: ColorsList[8],),
      //             ),
      //             Padding(
      //               padding: const EdgeInsets.all(8.0),
      //               child: Container(color: ColorsList[9],),
      //             ),
      //             Padding(
      //               padding: const EdgeInsets.all(8.0),
      //               child: Container(color: ColorsList[10],),
      //             ),
      //             Padding(
      //               padding: const EdgeInsets.all(8.0),
      //               child: Container(color: ColorsList[11],),
      //             ),
      //             Padding(
      //               padding: const EdgeInsets.all(8.0),
      //               child: Container(color: ColorsList[12],),
      //             ),
      //           ],
      //         ),
      //       ),
      //       Divider(height: 75,color: Colors.black,thickness: 3,),
      //       Container(
      //         height: 270,
      //         width: 200,
      //         child: GridView.extent(
      //           maxCrossAxisExtent: 150,
      //           children: [
      //             Padding(
      //               padding: const EdgeInsets.all(8.0),
      //               child: Container(color: ColorsList[0],),
      //             ),
      //             Padding(
      //               padding: const EdgeInsets.all(8.0),
      //               child: Container(color: ColorsList[1],),
      //             ),
      //             Padding(
      //               padding: const EdgeInsets.all(8.0),
      //               child: Container(color: ColorsList[2],),
      //             ),
      //             Padding(
      //               padding: const EdgeInsets.all(8.0),
      //               child: Container(color: ColorsList[3],),
      //             ),
      //             Padding(
      //               padding: const EdgeInsets.all(8.0),
      //               child: Container(color: ColorsList[4],),
      //             ),
      //             Padding(
      //               padding: const EdgeInsets.all(8.0),
      //               child: Container(color: ColorsList[5],),
      //             ),
      //             Padding(
      //               padding: const EdgeInsets.all(8.0),
      //               child: Container(color: ColorsList[6],),
      //             ),
      //             Padding(
      //               padding: const EdgeInsets.all(8.0),
      //               child: Container(color: ColorsList[7],),
      //             ),
      //             Padding(
      //               padding: const EdgeInsets.all(8.0),
      //               child: Container(color: ColorsList[8],),
      //             ),
      //             Padding(
      //               padding: const EdgeInsets.all(8.0),
      //               child: Container(color: ColorsList[9],),
      //             ),
      //             Padding(
      //               padding: const EdgeInsets.all(8.0),
      //               child: Container(color: ColorsList[10],),
      //             ),
      //             Padding(
      //               padding: const EdgeInsets.all(8.0),
      //               child: Container(color: ColorsList[11],),
      //             ),
      //             Padding(
      //               padding: const EdgeInsets.all(8.0),
      //               child: Container(color: ColorsList[12],),
      //             ),
      //           ],
      //         ),
      //       )
      //     ],
      //   ),
      // )
    );
    ;
  }
}
