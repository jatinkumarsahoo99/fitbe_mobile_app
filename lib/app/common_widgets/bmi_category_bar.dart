import 'package:flutter/material.dart';

class BMICategoryBar extends StatelessWidget {

   BMICategoryBar({super.key});

  List<double> lstData = [10,15,25,50];



  @override
  Widget build(BuildContext context) {

    double totalSum = lstData.fold(0, (prev, element) => prev + element);
    Size size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: [
            Container(
              height: 10,
              width: calculateWidth(totalSum,size.width,lstData[0]),
              // color: Colors.grey,
              decoration: const BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  bottomLeft: Radius.circular(30.0),
                ),
              ),
            ),
            Container(
              height: 10,
              width: calculateWidth(totalSum,size.width,lstData[1]),
              color: Colors.green,
            ),
            Container(
              height: 10,
              width: calculateWidth(totalSum,size.width,lstData[2]),
              color: Colors.yellow,
            ),
            Container(
              height: 10,
              width: calculateWidth(totalSum,size.width,lstData[3]),
              // color: Colors.orange,
              decoration: const BoxDecoration(
                color: Colors.orange,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30.0),
                  bottomRight: Radius.circular(30.0),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 10),
        Row(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children:List.generate(lstData.length, (index) => SizedBox(
              width: calculateWidth(totalSum,size.width,lstData[index]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("${lstData[index]}"),
                ],
              ))),
        ),
      ],
    );
  }

   calculateWidth(double totalSumPer,double screenSize,double perCen) {
     screenSize = screenSize -16;
    return (perCen /totalSumPer) * screenSize;

  }
}