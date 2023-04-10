
import 'dart:math';
import 'dart:async';

import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:circular_countdown_timer/countdown_text_format.dart';
import 'package:finalexam/AppUtils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class Home_Page extends StatefulWidget {
  const Home_Page({Key? key}) : super(key: key);

  @override
  State<Home_Page> createState() => _Home_PageState();
}

class _Home_PageState extends State<Home_Page> {
  final CountDownController _controller = CountDownController();
  @override

  int _start = 0;




  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Timer.periodic(Duration(seconds: 10), (timer) {
      setState(() {
        _start++;
        AppUtil.finalDataList.add(AppUtil.quoteList[_start]['quotes']);
      });
      if(_start > 30){
        setState(() {
          _start = 0;

        });
      }
    });
  }
  Widget build(BuildContext context) {
      Random r = Random();
      int n = r.nextInt(10);
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(

          backgroundColor: Colors.orange,
          title: Text("Quotes",style: GoogleFonts.lora(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: CupertinoColors.black
          ),),
          actions: [
            InkWell(
              onTap: (){

                setState(() {
                  Timer.periodic(Duration(seconds: 10), (timer) {
                    setState(() {
                      _start++;
                      AppUtil.finalDataList.add(AppUtil.quoteList[_start]['quotes']);
                    });
                    if(_start > 30){
                      setState(() {
                        _start = 0;

                      });
                    }
                  });
                });

              },
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: CircleAvatar(
                    backgroundColor: Colors.black,
                      child: Text("${_start}",style: GoogleFonts.poppins(
                        color: CupertinoColors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w600
                      ),)),
                ))
          ],
        ),
      body: Container(
        margin: EdgeInsets.all(20),
        height: h,
        width: w,
        color: Colors.black12,
        child: Container(
          margin: EdgeInsets.only(top: 100,bottom: 100,right: 10,left: 10),
         decoration: BoxDecoration(
           borderRadius: BorderRadius.circular(20),
           gradient: LinearGradient(colors: [
                 Color(0xff1D4350),
                 Color(0xffA43931),
           ],
             begin: Alignment.topCenter,
             end: Alignment.bottomCenter
           )
         ),
          child: Center(
            child: Text("\"${AppUtil.quoteList[_start]['quotes']}\"",style: GoogleFonts.lora(
                color: CupertinoColors.white,
                fontWeight: FontWeight.w500,
                fontSize: 20
            ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView.builder(
          itemCount: AppUtil.finalDataList.length,
          itemBuilder: (context, index) => GestureDetector(
            onTap: () {},
            child: Column(
              children: [
                Container(
                  alignment: Alignment.center,
                  height: h/10,
                  margin: EdgeInsets.only(bottom: 10),
                  decoration: BoxDecoration(
                    color: Colors.orange.shade50,

                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      AppUtil.finalDataList[index],
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                          color: Colors.black, fontSize: 15),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

