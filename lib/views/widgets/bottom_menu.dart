import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class BottomMenu extends StatefulWidget {
  const BottomMenu({Key? key}) : super(key: key);

  @override
  _BottomMenuState createState() => _BottomMenuState();
}

class _BottomMenuState extends State<BottomMenu> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        InkWell(
            onTap: () {

                final snackBar = SnackBar(
                  padding: EdgeInsets.all(2),
                 // width: 50,
                  elevation: 2,
                  content:
                    'Saved'.text.black.make(),


                  behavior: SnackBarBehavior.floating,
                  backgroundColor: Vx.purple200,

                  duration: Duration(seconds: 3),
                );
               // Scaffold.of(context).showSnackBar(snackBar);
              ScaffoldMessenger.of(context).showSnackBar(snackBar);

            },
            child: Icon(Icons.bookmark_border)),
        Icon(Icons.share)
      ],
    );
  }
}
