import 'package:flutter/material.dart';

class BarIndicator extends StatelessWidget {

  final List<double> lstData;
  final List<Color> lstColor;

  final double? barWidth;
  final double? fontSize;

  const BarIndicator({super.key,this.barWidth,required this.lstData,required this.lstColor,this.fontSize});



  @override
  Widget build(BuildContext context) {
    double totalSum = lstData.fold(0, (prev, element) => prev + element);
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(lstData.length, (index) {
            if (index == 0) {
              return Row(
                children: [
                  Container(
                    height: 10,
                    width: calculateWidth(totalSum, size.width, lstData[index]),
                    // color: Colors.grey,
                    decoration: BoxDecoration(
                      color: lstColor[index],
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(30.0),
                        bottomLeft: Radius.circular(30.0),
                      ),
                    ),
                  ),
                  Container(
                    color: Colors.white,
                    height: 10,
                    width: 1.2,
                  )
                ],
              );
            } else if (index == lstData.length - 1) {
              return Container(
                height: 10,
                width: calculateWidth(totalSum, size.width, lstData[index]),
                // color: Colors.grey,
                decoration: BoxDecoration(
                  color: lstColor[index],
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(30.0),
                    bottomRight: Radius.circular(30.0),
                  ),
                ),
              );
            } else {
              return Row(
                children: [
                  Container(
                    height: 10,
                    width: calculateWidth(totalSum, size.width, lstData[index]),
                    color: lstColor[index],
                  ),
                  Container(
                    color: Colors.white,
                    height: 10,
                    width: 1.2,
                  )
                ],
              );
            }
          }),

          /*  [
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
          ],*/
        ),
        const SizedBox(height: 7),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
              lstData.length,
              (index) => SizedBox(
                  width: calculateWidth(totalSum, size.width, lstData[index]),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("${lstData[index]}",style:  TextStyle(fontSize: fontSize??4,overflow: TextOverflow.ellipsis,),maxLines: 2,),
                    ],
                  ))),
        ),
      ],
    );
  }

  calculateWidth(double totalSumPer, double screenSize, double perCen) {
    screenSize = barWidth??screenSize;
    screenSize = screenSize - 16 -( (lstData.length - 1)* 1.2);
    return (perCen / totalSumPer) * screenSize;
  }
}
