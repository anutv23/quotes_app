import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quotes_app/views/main_display.dart';
import 'package:velocity_x/velocity_x.dart';

import 'login_page.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFE5D9),
     // backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              VxBox(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  "i"
                      .text
                      .xl5
                      .bold
                      .color(Color(0xFFFFAA00))
                      .makeCentered()
                      .pOnly(top: 30),
                  "Quote"
                      .text
                      .xl6
                      .bold
                      .color(Color(0xFF560BAD))
                      .letterSpacing(0.7)
                      .makeCentered()
                      .pOnly(top: 25),
                ],
              )).make(),
              ZStack([
                Container(
                    height: context.screenHeight * 0.70,
                    decoration: BoxDecoration(
                        gradient: RadialGradient(colors: [
                          Vx.purple200,

                     Vx.purple300,
                          Colors.white,


                    ])),
                    width: double.infinity,
                    child: Image.network(
                      "https://image.flaticon.com/icons/png/512/3400/3400793.png",
                      fit: BoxFit.contain,
                    )),
                DefaultTextStyle(
                  style: const TextStyle(
                      fontSize: 15.0,
                      color: Colors.black,
                      fontWeight: FontWeight.w800),
                  child: AnimatedTextKit(
                    totalRepeatCount: 3,
                    repeatForever: true,
                    animatedTexts: [
                      // WavyAnimatedText('iQuote'),

                      WavyAnimatedText('Start your day with WORDS'),
                    ],
                    isRepeatingAnimation: true,
                    onTap: () {
                      print("Tap Event");
                    },
                  ),
                ).centered().positioned(bottom: 60,left: 120),
              ]),
              24.heightBox,
              Container(
                  alignment: Alignment.bottomCenter,
                  height: 40,
                  width: 220,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(colors: [

                        Color(0xFFFFAC70),
                        Colors.white,

                      ])),
                  child: TextButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (_)=>LoginPage()));
                      },
                      child: Text(
                        "Getting Started",
                        style: GoogleFonts.lato(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      )))
            ],
          ).scrollVertical(),
        ),
      ),
    );
  }
}
