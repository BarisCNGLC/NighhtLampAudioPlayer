// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:flutter/material.dart';
import 'package:slide_digital_clock/slide_digital_clock.dart';

class SaatCurrent extends StatefulWidget {

   var height;
   var width;
   


  SaatCurrent({
    Key? key,
    required this.height,
    required this.width,
  }) : super(key: key);

  @override
  State<SaatCurrent> createState() => _SaatCurrentState();
}

class _SaatCurrentState extends State<SaatCurrent> {
  @override
  Widget build(BuildContext context) {
    
    return Container(
    width:widget.width*0.62 ,
    height: widget.height*0.20,
    decoration: BoxDecoration(
      border: Border.all(
        color: Colors.white,
      ),
      borderRadius: BorderRadius.all(Radius.circular(24))
    ),
    child: DigitalClock(
                  
                  areaDecoration: BoxDecoration(
                    color: Colors.transparent.withOpacity(0.5),
                    border: Border.all(
                      color: Colors.white,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(24))),
                  areaAligment: AlignmentDirectional.center,
                  hourMinuteDigitDecoration:
                      BoxDecoration(
                        color: Colors.transparent,
                      ),
                  
                  hourMinuteDigitTextStyle: TextStyle(
                  fontSize: 60,
                  
                  fontWeight: FontWeight.bold,
                  foreground: Paint()
                  ..style = PaintingStyle.fill
                  ..strokeWidth = 5
                  ..color = Colors.white,
                  
                  
              ),
                
                  secondDigitTextStyle: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    foreground: Paint()
                    ..style = PaintingStyle.fill
                    ..strokeWidth = 1
                    ..color = Colors.white,
                    
                    ),
                
                  //red*0.299+green*0.587+blue*0.114 >186 ? #0000000 :#ffff 
                ),

  );
 
}
  }
