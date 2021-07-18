import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_fadein/flutter_fadein.dart';
import 'package:velocity_x/velocity_x.dart';

import 'main_display.dart';


class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  String name = "";
  TextEditingController passwordctrl = TextEditingController();
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFFFE5D9),
        appBar: AppBar(
          title: Text("Account Login"),
          //backgroundColor: Colors.pinkAccent.shade100.withOpacity(0.6),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                height: context.screenHeight*0.50,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/login.png'),
                        fit: BoxFit.contain)),

              ).p8(),
              Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        //  color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.white,
                               blurRadius: 20.0,
                                offset: Offset(2, 2))
                          ]),
                      child: Column(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 8.0,horizontal: 8),
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom:
                                    BorderSide(
                                        //color: Colors.grey[100]
                                    ))),
                            child: TextField(
                              onChanged: (value) {
                                name = value;
                                setState(() {});
                              },
                              decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.person,
                                    size: 20,
                                  ),
                                  border: InputBorder.none,
                                  hintText: "Username",
                                  hintStyle:
                                  TextStyle(color: Colors.grey[700])),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 8.0,horizontal: 8),

                            child: TextFormField(
                            //  obscureText: true,
                              autovalidateMode: AutovalidateMode.onUserInteraction ,
                           //   cursorColor: Colors.orange[400],
                              controller: passwordctrl,
                              obscureText: _obscureText,

                              validator:
                              MultiValidator([
                                RequiredValidator(errorText: '* Enter password'),
                                MinLengthValidator(6, errorText: 'Password cannot be less than 6 chars'),
                                MaxLengthValidator(15, errorText: 'Password cannot be more than 15 chars'),
                              ]),
                              decoration: InputDecoration(
                                hintText: 'Password',
                                hintStyle:
                                TextStyle(color: Colors.grey[700]),
                                prefixIcon: Icon(Icons.lock, color: Colors.grey,),
                               // fillColor: Colors.white,
                              //  filled: true,
                                suffixIcon: new GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _obscureText = !_obscureText;
                                    });
                                  },
                                  child:
                                  new Icon(_obscureText ? Icons.visibility : Icons.visibility_off,color: Colors.grey,),
                                ),
                              // decoration: InputDecoration(
                              //     prefixIcon: Icon(
                              //       Icons.lock,
                              //       size: 20,
                              //     ),
                              //     border: InputBorder.none,
                              //     hintText: "Password",
                              //     hintStyle:
                              //     TextStyle(color: Colors.grey[700])),
                            ),
                          )
                          )],
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      height: 40,
                      width: 150,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18),
                          gradient: LinearGradient(colors: [
                            Color(0xFFFFAC70),
                            Colors.white,

                          ])),
                      child: Center(
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => QuotesDisplay(name)));
                          },
                          child: Text(
                            "Login",
                            style: TextStyle(
                                color: Colors.black,
                                ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 70,
                    ),
                    Text(
                      "Forgot Password?",
                      style:
                      TextStyle(color: Color.fromRGBO(143, 148, 251, 1)),
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
