// ignore_for_file: public_member_api_docs, sort_constructors_first, prefer_const_constructors, file_names

import 'package:flutter/material.dart';

class MuzikListesi extends StatelessWidget {

  String muzikAd;
  final VoidCallback onPressed;
  IconData musicIcon;


  MuzikListesi({
    Key? key,
    required this.muzikAd,
    required this.onPressed,
    this.musicIcon=Icons.play_arrow,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      
      child: Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
          height:55,
          width:300,
          color: Colors.green.shade100,
          child:Center(
            child: Row(
              children: [
                Expanded(
                  flex: 5,
                  child: Text(
                    muzikAd,
                       style:
                              TextStyle(
                                fontSize: 20,
                                color: Colors.black, 
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.none),),
                ),
                Expanded(
                  flex: 2,
                  child: GestureDetector(
                    onTap: onPressed,
                    child: Container(
                      width: 100,
                      height: 200,
                      decoration: BoxDecoration(
                      border: Border.all(color: Colors.red),
                      color: Colors.amber,
                      
                      ),
                      child: Icon(musicIcon)),
                  )),
              ],
            ),
            ),
          ),
    );
  }
}
