import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_fadein/flutter_fadein.dart';
import 'package:quotes_app/model/quoteofday.dart';
import 'package:quotes_app/services/quoteServices.dart';
import 'package:velocity_x/velocity_x.dart';
import 'dart:async';

import 'widgets/popular_grid.dart';

class QuotesDisplay extends StatefulWidget {
  String name;

  QuotesDisplay(this.name);

  @override
  _QuotesDisplayState createState() => _QuotesDisplayState();
}

class _QuotesDisplayState extends State<QuotesDisplay> {
  QuotedDisplay quotedisp = QuotedDisplay();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor: Color(0xFFFFE5D9),
       
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 250.0,
                child: DefaultTextStyle(
                  style: const TextStyle(
                    fontSize: 30.0,
                    fontFamily: 'Agne',
                  ),
                  child: AnimatedTextKit(
                    isRepeatingAnimation: false,
                    stopPauseOnTap: false,
                    pause: Duration(seconds: 10),
                    totalRepeatCount: 4,
                    animatedTexts: [
                      TypewriterAnimatedText('How are you today, ${widget.name}?',textStyle: TextStyle(color: Colors.black,fontSize: 18)),
                      // TypewriterAnimatedText('Design first, then code'),
                      // TypewriterAnimatedText('Do not patch bugs out, rewrite them'),
                      // TypewriterAnimatedText('Do not test bugs out, design them out'),
                    ],
                    onTap: () {
                     // print("Tap Event");
                    },
                  ),
                ),
              ).p8(),
              ZStack(
                [

                  VxBox(
                          child: Image.asset(
                    "assets/images/look.png",
                    fit: BoxFit.fill,
                  )).color(Color(0xFFFFE5D9))
                      .height(context.screenHeight * 0.25)
                      .width(context.screenWidth)
                      .make(),
                  VxBox(
                          child: FutureBuilder<QuoteofDay>(
                    future: quotedisp.getQOD(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Quote of the Day",
                              style: GoogleFonts.cormorantGaramond(
                                  fontSize: 25,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            )
                                .shimmer(
                                    duration: Duration(seconds: 2),
                                    primaryColor: Colors.black)
                                .centered()
                                .p8(),
                            snapshot.data!.quote.body.text
                                .size(15)

                                .italic
                                .make()
                                .p4(),
                            8.heightBox,
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                "~".text.purple700.make(),
                                snapshot.data!.quote.author.text
                                    .size(14)

                                    .italic
                                    .make()
                              ],
                            ).p4(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Icon(Icons.copyright,size: 10,color: Colors.blueAccent,),
                                5.widthBox,
                                "https://favqs.com/".text.color(Colors.blueAccent).size(10).make()

                              ],
                            ).py16()

                          ],
                        ).scrollVertical().p8();
                      } else if (snapshot.hasError) {
                        return Text("${snapshot.error}");
                      }
                      // By default, show a loading spinner.
                      return CircularProgressIndicator();
                    },
                  ))
                                            .height(context.screenHeight * 0.22)
                      .width(context.screenWidth * 0.68)
                      .linearGradient([
                        Color(0xFFFFD7BA),
                        Colors.white,
                      ])
                      .make()
                      .card
                      .elevation(4)
                      .shadowColor(Colors.grey)
                      .make()
                      .pOnly(bottom: 40, left: 98),
                ],
                alignment: Alignment.center,
              ).p8(),
              Text("Most Searched Quotes: ", style: GoogleFonts.cormorantGaramond(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.bold)).shimmer(
                  duration: Duration(seconds: 2),
                  primaryColor: Colors.black).p8(),

              VxBox(
                      child: VxSwiper(
                scrollDirection: Axis.horizontal,
                viewportFraction: 0.90,
                enlargeCenterPage: true,
                autoPlay: true,
                items: [
                  Stack(children: [
                    Image.network(
                      "https://image.freepik.com/free-vector/unique-beautiful-self-positive-lettering_52683-34824.jpg",
                      height: 300,
                      width: context.screenWidth,
                      fit: BoxFit.fill,
                    ),
                  ]),
                  Image.network(
                    "https://image.freepik.com/free-vector/never-stop-dreaming-lettering-with-flowers_52683-29342.jpg",
                    fit: BoxFit.fill,
                    width: context.screenWidth,
                    height: 300,
                  ),
                  Image.network(
                    "https://image.freepik.com/free-vector/calligraphic-background-motivational-quote_52683-16294.jpg",
                    fit: BoxFit.fill,
                    width: context.screenWidth,
                    height: 300,
                  ),
                  Image.network(
                    "https://image.freepik.com/free-vector/adventure-lettering-concept_52683-35208.jpg",
                    fit: BoxFit.fill,
                    width: context.screenWidth,
                    height: 300,
                  ),
                ],
              ).p2())
                  .height(context.screenHeight * 0.30)
                  .width(context.screenWidth) .linearGradient([
                Color(0xFFFFD7BA),
            Colors.white,
            ])

                  .make()
                  .card
                  .elevation(4)
                  .shadowColor(Colors.grey)
                  .make().p4(),
              12.heightBox,
              Text("Popular Categories: ", style: GoogleFonts.cormorantGaramond(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.bold)).shimmer(
                  duration: Duration(seconds: 2),
                  primaryColor: Colors.black).p8(),
              PopularCategories(),

            ],
          ).scrollVertical().p8(),
        ));
  }
}
