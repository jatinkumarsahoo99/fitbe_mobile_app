import 'package:flutter/material.dart';

class AnimatedNumberPicker extends StatefulWidget {
  final int? minNum;
  final int? maxNum;
  final int? selectedItemScrollPosition;
  final String? suffix;
  final Function(int selectedItem) onChange;
  const AnimatedNumberPicker({super.key,this.maxNum,this.minNum,required this.onChange,this.suffix,this.selectedItemScrollPosition = 20});

  @override
  State<AnimatedNumberPicker> createState() => _AnimatedNumberPickerState();
}

class _AnimatedNumberPickerState extends State<AnimatedNumberPicker> {
  int ? selectedItem;

  late FixedExtentScrollController fixedExtentScrollController;
  int selectItemForScroll = 20;

  @override
  void initState() {
    selectItemForScroll = (widget.selectedItemScrollPosition??20) + 3;
    selectedItem = widget.selectedItemScrollPosition;
    fixedExtentScrollController = FixedExtentScrollController(initialItem: selectItemForScroll);

    super.initState();
  }


  @override
  void dispose() {
    fixedExtentScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListWheelScrollView.useDelegate(
      itemExtent: 50, // Height of each item
      diameterRatio:
      2.5, // Adjust the curvature of the wheel
      physics:
      const FixedExtentScrollPhysics(), // Locks the scroll to one item at a time
      controller: fixedExtentScrollController,
      /*onSelectedItemChanged: (index) {
        debugPrint(">>>>>>>>>>>>onSelectedItem$index");
        setState(() {
          selectedItem = index;
          widget.onChange(index);
        });
      },*/
      childDelegate: ListWheelChildBuilderDelegate(
        builder: (context, index) {
          return GestureDetector(
            onTap: () {
              selectedItem = index;
              widget.onChange(index);
              setState(() {});
            },
            child: Row(
              mainAxisAlignment:
              MainAxisAlignment.center,
              children: [
                (selectedItem == index)
                    ? Container(
                  decoration: const BoxDecoration(
                      border: Border(
                        top: BorderSide(
                            width: 1,
                            color: Color(0xFF2CBFD3)),
                        bottom: BorderSide(
                            width: 1,
                            color: Color(0xFF2CBFD3)),
                      )),
                  child: Row(
                    crossAxisAlignment:
                    CrossAxisAlignment.end,
                    children: [
                      Text(
                        "${index + 1}",
                        style: const TextStyle(
                            color:
                            Color(0xFF2CBFD3),
                            fontSize: 40,
                            fontWeight:
                            FontWeight.w500),
                      ),
                       Text(
                        widget.suffix??" cm",
                        style: const TextStyle(
                          fontSize: 16,
                          color:
                          Color(0xFF2CBFD3),
                        ),
                      )
                    ],
                  ),
                )
                    : Padding(
                  padding:
                  const EdgeInsets.all(4.0),
                  child: Text(
                    "${index + 1}",
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
        childCount: widget.maxNum??200, // Number of items in the list
      ),
    );
  }
}
