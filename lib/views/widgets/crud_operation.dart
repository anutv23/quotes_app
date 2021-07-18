import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quotes_app/model/category.dart';
import 'package:quotes_app/model/quotecategory.dart';
import 'package:quotes_app/services/quoteServices.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CrudOperation extends StatefulWidget {
  const CrudOperation({Key? key}) : super(key: key);

  @override
  _CrudOperationState createState() => _CrudOperationState();
}

class _CrudOperationState extends State<CrudOperation> {
  final sref = FirebaseFirestore.instance.collection("Quotes");
  final _formKey = GlobalKey<FormState>();
  TextEditingController authorController = TextEditingController();
  TextEditingController quoteController = TextEditingController();
  TextEditingController quoteNameController = TextEditingController();


  late Map<String, dynamic> addToBlog;

  addData() {
    addToBlog = {
      'author': authorController.text,
      'quote': quoteController.text,
      'quoteName': quoteNameController.text,

    };

    sref.add(addToBlog).whenComplete(() => Navigator.pop(context));
  }
  @override
  Widget build(BuildContext context) {
    return   Container(

      padding: EdgeInsets.symmetric(vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            backgroundColor: Color(0xFFFFB999),
            foregroundColor: Colors.black,
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) => Dialog(
                    child: Container(
                      height: 420,
                      width: 400,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Colors.white,Color(0xFFFFB999), ]
                        ),

                       // borderRadius: BorderRadius.circular(15),
                      ),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10.0, vertical: 5),
                              child: TextFormField(
                                validator: (val) => val!.isEmpty
                                    ? "Quote Category cant be empty"
                                    : null,
                                controller: quoteNameController,
                                decoration: InputDecoration(

                                  // focusColor: Colors.black,
                                  labelText: 'Quote Category',
                                  hintText: 'Choose from - Love,Life,Inspire,Happy,Movie,Funny',
                                  hintStyle: TextStyle(fontSize: 12)
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10.0,
                              ),
                              child: TextFormField(
                                controller: quoteController,
                                maxLines: 2,
                                validator: (val) => val!.isEmpty
                                    ? "Quote cant be empty"
                                    : null,
                                decoration: InputDecoration(
                                  // focusColor: Colors.black,
                                  labelText: 'Quote',
                                  // hintText: 'What would you like to pen?',
                                  // hintMaxLines: 3
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10.0, vertical: 5),
                              child: TextFormField(
                                validator: (val) => val!.isEmpty
                                    ? "Author Name cant be empty"
                                    : null,
                                controller: authorController,
                                decoration: InputDecoration(
                                  // focusColor: Colors.black,
                                  labelText: 'Author',
                                  // hintText: 'Enter the title',
                                ),
                              ),
                            ),
                            14.heightBox,



                            Container(
                              height: 35,
                              width: 75,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                  BorderRadius.circular(19)),
                              child: TextButton(
                                onPressed: () {
                                  if (_formKey.currentState!
                                      .validate()) {
                                    addData();
                                  }
                                },
                                child: Text(
                                  "Add",
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ));
            },
            child: Icon(Icons.add),
          )
        ],
      ),
    );
  }
}
