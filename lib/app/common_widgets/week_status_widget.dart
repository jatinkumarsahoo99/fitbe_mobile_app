import 'package:flutter/material.dart';

import '../app_theme/text_styles.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class WeekStatusWidget extends StatelessWidget {
  final List<WeekDataModel> lstData = [
    WeekDataModel(day: "M", isOk: false),
    WeekDataModel(day: "T", isOk: true),
    WeekDataModel(day: "W", isOk: true),
    WeekDataModel(day: "T", isOk: false),
    WeekDataModel(day: "F", isOk: false),
    WeekDataModel(day: "S", isOk: true),
    WeekDataModel(day: "S", isOk: true, isCross: true),
  ];

  WeekStatusWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.all(4.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 20,
                width: 20,
                decoration: BoxDecoration(
                  // color: ColorsGroup.primaryColor,
                  color: (lstData[index].isCross == true)
                      ? Colors.red
                      : (lstData[index].isOk == true)
                          ? const Color(0xFF2088B4)
                          : Colors.orange,
                  borderRadius: const BorderRadius.all(Radius.circular(50)),
                  border: Border.all(width: 0.8, color: Colors.white),
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: (lstData[index].isCross == true)
                        ? const FaIcon(
                            FontAwesomeIcons.multiply,
                            size: 10.0, // Set the size you need
                            color: Colors.white, // Set the color  you need
                          )
                        : (lstData[index].isOk == true)
                            ? const Icon(
                                Icons.done,
                                size: 10,
                                color: Colors.white,
                              )
                            : const FaIcon(
                                FontAwesomeIcons.exclamation,
                                size: 10.0, // Set the size you need
                                color: Colors.white, // Set the color  you need
                              ),
                  ),
                ),
              ),
              Text(
                lstData[index].day ?? "",
                style: TextStyles(context).googleRubikFontsForButtonText(fontWeight: FontWeight.w500, fontSize: 10),
              )
            ],
          ),
        );
      },
      itemCount: lstData.length,
      scrollDirection: Axis.horizontal,
    );
  }
}

class WeekDataModel {
  String? day;
  bool? isOk;
  bool? isCross;

  WeekDataModel({this.day, this.isOk, this.isCross = false});
}
