
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../app_theme/colors.dart';
import '../../app_theme/text_styles.dart';
import '../../common_widgets/common_button.dart';
import 'gender_screen.dart';
import 'package:numberpicker/numberpicker.dart';

class PreferenceScreen extends StatefulWidget {
  const PreferenceScreen({super.key});

  @override
  State<PreferenceScreen> createState() => _PreferenceScreenState();
}

class _PreferenceScreenState extends State<PreferenceScreen> {

  var pageController = PageController(initialPage: 0);
  int currentShowIndex = 0;
  int selectAge = 10;



  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return  Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0,right: 16),
          child: Column(
            children:<Widget> [
              const SizedBox(
                height: 23,
              ),
             /* LinearProgressIndicator(
                value:double.parse(currentShowIndex.toString()),
              ),*/
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                        decoration: BoxDecoration(
                          border:
                          Border.all(color: Colors.grey, width: 0.1),
                          borderRadius: BorderRadius.circular(20),
                          // color: const Color(0xFFD9D9D9)
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.arrow_back_sharp,
                            size: 20,
                          ),
                        )),
                  ),

                  SizedBox(
                    width:size.width*0.7,
                    child: LinearPercentIndicator(
                      progressColor: ColorsGroup.primaryColor,
                      backgroundColor: Colors.grey,
                      percent: ((currentShowIndex + 1)/ 6),
                      animation: true,
                      lineHeight: 10,
                      linearStrokeCap: LinearStrokeCap.roundAll,
                      barRadius: const Radius.circular(5),
                    ),
                  ),
                  Text("${(currentShowIndex + 1)}/6",style: TextStyles(context).googleRubikFontsForText3(fontSize: 12,fontWeight: FontWeight.w500),)
                ],
              ),
              Expanded(
                  flex: 9,
                  child: PageView(
                controller: pageController,
                onPageChanged: (i){
                  currentShowIndex = i;
                  setState(() {});
                },
                scrollDirection: Axis.horizontal,
                children: <Widget> [
                   GenderScreen(onTap: (index){
                     print(">>>>>>>>>>>>>Index${index}");

                   },),
                  Column(
                    children: [
                      const SizedBox(
                        height: 40,
                      ),
                      Text(
                        "Tell Us About Yourself!",
                        textAlign: TextAlign.center,
                        style: TextStyles(context).googleRubikFontsForHeading(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        "For a Tailored Experience, Please Share Your Gender.",
                        textAlign: TextAlign.center,
                        style: TextStyles(context).googleRubikFontsForText(
                            fontSize: 10, fontWeight: FontWeight.w400),
                      ),
                      const SizedBox(
                        height: 32,
                      ),
                      Expanded(
                        child:  Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: NumberPicker(
                            value: selectAge,
                            minValue: 1,
                            maxValue: 100,
                            // infiniteLoop: true,
                            selectedTextStyle: TextStyles(context).googleRubikFontsForText2(fontSize: 48),
                            /*decoration: const BoxDecoration(
                              border: Border(
                                top: BorderSide(
                                  width: 2,
                                  color: const Color(0xFF2CBFD3)
                                ),
                                bottom: BorderSide(
                                  width: 2,
                                  color:  Color(0xFF2CBFD3)
                                ),
                              )
                            ),*/
                            onChanged: (value) {
                              selectAge = value;
                              debugPrint(">>>>>>>>>>>>>>>selectAge$selectAge");
                              setState(() {});
                            }),

                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: size.width*0.2,
                    child: ListView.builder(
                      itemCount: 100,

                        itemBuilder: (BuildContext context , int index){
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("$index"),
                        ],
                      );
                    }),
                  ),
                  Container(
                    child: Text("3"),
                  ),
                  Container(
                    child: Text("3"),
                  ),
                  Container(
                    child: Text("3"),
                  ),
                ],
              )),
              CommonButton(
                padding: const EdgeInsets.only(left: 0, right: 0),
                buttonText: "Next",
                backgroundColor: const Color(0xFF2CBFD3),
                radius: 30,
                height: 48,
                onTap: () {
                  pageController.nextPage(duration: const Duration(milliseconds: 200), curve: Curves.easeOut);
                  // NavigationServices(context).gotoTabScreen();
                  // Navigator.pushNamed(context, "/preferenceScreen");
                },
              ),
              Expanded(
                  flex: 1,
                  child: Container())
            ],
          ),
        ),
      ),
    );
  }
}
