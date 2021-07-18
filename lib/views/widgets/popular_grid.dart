


import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quotes_app/model/category.dart';
import 'package:quotes_app/model/quotecategory.dart';
import 'package:quotes_app/services/quoteServices.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../quote_details.dart';

class PopularCategories extends StatefulWidget {
  const PopularCategories({Key? key}) : super(key: key);

  @override
  _PopularCategoriesState createState() => _PopularCategoriesState();
}

class _PopularCategoriesState extends State<PopularCategories> {
  QuotedDisplay quotecat = QuotedDisplay();
  final ref = FirebaseFirestore.instance.collection("Category");

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: ref.snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasData) {
            List<Category> dataList = snapshot.data!.docs
                .map((e) => Category.fromJson(e.data()))
                .toList();

            return
                VxBox(
                  child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 0.6,

                          crossAxisCount: 3),
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: dataList.length,
                    physics: ClampingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return VxBox(
                        child: InkWell(
                          onTap:(){
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) =>
                                        QuoteDetails(
                                         typeName:dataList[index].categoryName
                                        )));
                         //   print(dataList[index].categoryName);
                          },
                          child: Text(dataList[index].categoryName,
                            style: GoogleFonts.cormorantGaramond(
                          fontSize: 20,fontWeight: FontWeight.bold
                              ),
                            ).centered(),
                        ),
                      ).height(250).
                      linearGradient([Color(0xFFFFD7BA), Colors.white])
                          .roundedLg.shadowLg
                          .make().p8();
                    }).centered(),
                ).height(context.screenHeight*0.35).make();
          } else {
            return CircularProgressIndicator();
          }
        }).scrollVertical().p4();
  }
}
