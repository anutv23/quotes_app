import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quotes_app/model/quote.dart';
import 'package:quotes_app/model/quoteofday.dart';
import 'package:quotes_app/views/widgets/bottom_menu.dart';
import 'package:quotes_app/views/widgets/crud_operation.dart';
import 'package:random_color/random_color.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class QuoteDetails extends StatefulWidget {
  String typeName;

  QuoteDetails({required this.typeName});

  @override
  _QuoteDetailsState createState() => _QuoteDetailsState();
}

class _QuoteDetailsState extends State<QuoteDetails> with SingleTickerProviderStateMixin {
  final sref = FirebaseFirestore.instance.collection("Quotes");
  late Animation<double> animation;
  late AnimationController controller;
  RandomColor _randomColor = RandomColor();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = new AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    animation = CurvedAnimation(parent: controller, curve: Curves.easeIn);
    controller.forward();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFE5D9),
      appBar: AppBar(
        title: widget.typeName.text.make() ,
      ),
body: Column(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [

        VxBox(

      child:
          StreamBuilder(
          stream: sref
              .where("quoteName", isEqualTo: widget.typeName)
              .snapshots(),
          builder: (_, AsyncSnapshot<QuerySnapshot> snapShot) {
                     if (snapShot.hasData) {
              List<Quotes> quoteList = snapShot.data!.docs
                  .map((e) => Quotes.fromJson(e.data()))
                  .toList();


              return
                StaggeredGridView.countBuilder(
                  scrollDirection: Axis.vertical,
                  primary: false,
                 crossAxisCount: 4,

                  staggeredTileBuilder: (int index) =>
                  new StaggeredTile.count(2, index.isEven ? 3 : 2),
                   itemCount: quoteList.length,

                  itemBuilder: (context, index) => FadeTransition(
                    opacity: animation,
                    child: Column(

                     mainAxisAlignment: MainAxisAlignment.start,
                 crossAxisAlignment: CrossAxisAlignment.start,
                      children: [


                        Text(quoteList[index].quotebody,style: GoogleFonts.cormorantGaramond(
                            fontSize: 21,fontWeight: FontWeight.bold,
                        ),).p12(),
                        5.heightBox,
                        Text(quoteList[index].authorname,style: GoogleFonts.cormorantGaramond(
                            fontSize: 17,fontWeight: FontWeight.bold,fontStyle: FontStyle.italic
                        ),).px12(),
                        15.heightBox,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            InkWell(
                                onTap: () {
                                  snapShot
                                      .data!
                                      .docs[index]
                                      .reference
                                      .delete();
                                },

                                child: Icon(Icons.delete_forever_outlined,size: 20,)
                            ),
                          ],
                        ),
                      ],
                    ).backgroundColor(_randomColor.randomMaterialColor().withOpacity(0.4)).card.elevation(5).shadowColor(_randomColor.randomColor()).make().p4().scrollVertical(),

                   // .height(context.screenHeight).width(context.screenWidth).make(),
                  ),
            // staggeredTileBuilder: (index) => StaggeredTile.fit(2),

                 mainAxisSpacing: 0.0,
                  crossAxisSpacing: 0.0,
                ).p4();
            } else {
              return Text("Loading......");
            }
          }),
    ).height(context.screenHeight).width(context.screenWidth).color(Color(0xFFFFE5D9)).make().centered().p12(),
  // 20.heightBox,
  //   BottomMenu()
  ],
).scrollVertical(),
      floatingActionButton:  CrudOperation(),



    );
  }
}
