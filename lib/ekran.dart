// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, deprecated_member_use, avoid_print, unused_element, unrelated_type_equality_checks, unnecessary_null_comparison, curly_braces_in_flow_control_structures, sized_box_for_whitespace, avoid_unnecessary_containers, division_optimization, prefer_final_fields, sort_child_properties_last


import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:proje_lamp_2/muzikListesi.dart';
import 'package:proje_lamp_2/saat_widget.dart';

class Ekran extends StatefulWidget {
  Ekran({Key? key}) : super(key: key);

  @override
  State<Ekran> createState() => _EkranState();
}

class _EkranState extends State<Ekran> {
  int girilenSaat=0;
  int girilenDakika=0;
  int farkSaat=0;
  int farkSaniye=0;
  int farkDakika=0;
  int anlikSaniye=0;
  int mod=0;
  int sayi=0;
  double bolunen=0;
  String string="";
  Timer? _timer;
  int _start = 10;
  int dakika=0;
  int saniye=0;
  DateTime _selectedDate=DateTime(2022,0,10,0,0);
  DateTime _dateTime = DateTime.now();
  final berlinWallFell = DateTime.utc(1989, 11, 9);
  final moonLanding = DateTime.parse('1969-07-20 20:18:04Z');
  bool hide=true;
  late AudioPlayer player;
  late AudioCache cache;
  bool currentMusic=false;
  bool isPlaying = false;
  Color pickerColor = Color(0xff443a49);
  Color currentColor =Colors.limeAccent;
  List<Color> currentColors = [Colors.limeAccent, Colors.green];
  int? anlikSaat;
  int? anlikDakika;
  String? path;
  IconData anlikIcon=Icons.visibility;
  IconData musicIcons=Icons.play_arrow;
  IconData musicIconss=Icons.play_arrow;
  IconData musicIconsss=Icons.play_arrow;


  var formKey =GlobalKey<FormState>();
  void changeColor(Color color) => setState(() => currentColor = color);
  void changeColors(List<Color> colors) =>
      setState(() => currentColors = colors);

  @override
  void initState() {
    super.initState();
    player=AudioPlayer();
    cache=AudioCache(fixedPlayer: player);
  
  }



 
  
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    var height=MediaQuery.of(context).size.height;
    var width=MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
              backgroundColor: currentColor,

        elevation: 0,
        bottomOpacity: 0,
         actions: <Widget>[
       
                 
          IconButton(
          icon: Icon(
            anlikIcon,
             size: 40,
             color: Colors.black,
          ),
          onPressed: () {
            
            setState(() {
              if(hide){
                anlikIcon=Icons.visibility_off;
                hide=false;
              }else{
                anlikIcon=Icons.visibility;
                hide=true;
              }
            }); 

          },
          
           ),
        ],
      ),
            backgroundColor: currentColor,

     // resizeToAvoidBottomInset: false,
      resizeToAvoidBottomInset: true,
      
       body: Column(
        
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
           
           Expanded(  
                
                          flex:0,
                          child: Container(
                            color: currentColor,
                            child: Row(
                              
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Expanded(
                                   flex: 1,
                          
                                  child: Container(
                                  ),),
                                Expanded(
                                  flex: 2,
                                  child: Container(
                                    child:Center(
                                      child:Text(""), 
                                      //AdWidget(ad: inlineAd)
                                    ),
                                  decoration: BoxDecoration(color: currentColor),
                                                        ),
                                ),
                          
                                
                              ],
                            ),
                          )),    
           Expanded(
            flex:0,
            child: Container(
              decoration: BoxDecoration(
                color: currentColor,
              ),
            ),
          ),   
          /* Expanded(
            flex: (height*0.05).toInt(),
            child: AdWidget(ad: staticAd), */
            
          
          Expanded(
                  // Flex Ekranda yer tutacagı oran bilgisi.
                  flex: 12,
                  child: Column(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color:currentColor,
                              width: 0,
                            ),
                            color: currentColor,
                          ),
                          child: Center(
                            child:Text(""),
                            /* AdWidget(ad: staticAd), */
                          ),
                        ),
                      ),
                      Expanded(
                        flex: (height*0.015).toInt(),
                        child: Container(
                          decoration: BoxDecoration(
                            color: currentColor,
                          ),
                          child: Center(
                            child: 

                          SaatCurrent(height: height, width: width),
                          //_saat(height,width),
                          
                          ),
                          
                        ),
                      ),
                     
                    ],
                  ),
                ),
                Expanded(
                  
                  // Flex Ekranda yer tutacagı oran bilgisi.
                  flex:3,
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: currentColor,
                        width: 0,
                      ),
                      color: currentColor,
                                          ),
                    child: Visibility(
                      visible: hide,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          //Text(_start.toString()),
                          
                          Expanded(
                            
                            flex: (width*0.035).toInt(),
                            child:
                            IconButton(
                              
                            onPressed: (){
                              timerBaslangic();
                            },
                          
                            icon: Icon(
                              Icons.color_lens,
                            ),
                            iconSize: 44,
                            color: Colors.black,),),
                           Expanded(
                            flex: (width*0.035).toInt(),child:IconButton(
                            onPressed: (){
                              // Burası Kullan  v1.0.3 _buton(height,width);
                              muzik();
                    
                            },
                            icon: Icon(
                              Icons.queue_music_sharp,
                            ),
                            iconSize: 44 ,
                            color: Colors.black,),),
                            Expanded(
                            flex: (width*0.035).toInt(),child:IconButton(
                            onPressed: (){
                              // Burası Kullan  v1.0.3 _buton(height,width);
                              dakikaGir();
                            },
                            icon: Icon(
                              Icons.timer_rounded
                            ),
                            iconSize: 44 ,
                            color: Colors.black,),),
                           
                          
                            
                          
                        ],
                      ),
                    ),
                  )
                  
                ),
                
              ],
              
            ),
            
    );
}

timerBaslangic(){
 return showDialog(
                              context: context,
                              builder:(BuildContext context){
                                return AlertDialog(
                                  content: SingleChildScrollView(
                                    
                                    child: ColorPicker(
                                      pickerColor: pickerColor,
                                      onColorChanged: changeColor,
                                      
                                      colorPickerWidth: 300.0,
                                      pickerAreaHeightPercent: 0.7,
                                      enableAlpha: true,
                                      displayThumbColor: true,
                                      showLabel: true,
                                      paletteType: PaletteType.hsv,
                                      pickerAreaBorderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(2.0),
                                      topRight: Radius.circular(2.0),

                                ),
                                      )
                                  ),
                                );
                              }
                            );
}
_buton(height,width){
  return showDialog(
                              context: context,
                              builder:(BuildContext context){
                                // ignore: unnecessary_new
                                return Center(
                                  
                                  child: Container(
                                    margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                    height:height*0.45,
                                    width: width*0.45,
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.black87,width: 6),
                                      borderRadius: BorderRadius.circular(24),
                                      
                                      color: Color.fromARGB(0, 255, 255, 255).withOpacity(1),

                                    ),
                                    
                                    
                                    child: Scaffold(
                                      
                    
                                      body:Container(
                                       padding: EdgeInsets.fromLTRB(0, 0, 0, height*0.02),

                                        child: Column(
                                                                            
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                        Text('End Time',style:
                                        TextStyle(color: Colors.red,fontSize: 26),
                                        
                                        ),
                                        Text('   '),
                                        // ignore: unnecessary_new
                                        new TimePickerSpinner(
                                          is24HourMode: true,
                                                onTimeChange: (time) {
                                                  setState(() {
                                                    _dateTime = time;
                                                  }
                                                  );
                                                
                                                },
                                            highlightedTextStyle: TextStyle(
                                              fontSize: 30,
                                              color: Colors.orange,
                                              
                                            ),
                                            spacing: 40,
                                            itemHeight: 40,
                                              ),
                                          Text('   '),
                                          TextButton(
                                            
                                            onPressed: (){
                                              //saatHesapla();
                                              butonEkrani();
                                            },
                                            style:TextButton.styleFrom(
                                              primary:Colors.blue
                                              
                                            ),
                                            
                                            child: Text('Apply',
                                            
                                            style: TextStyle(
                                              
                                              fontSize: 30,
                                            ),
                                            ),)
                                          ],
                                        ),
                                      ),
                                     
                                    ),
                                      )    //),
                                );
                              
                                  
                                
                              });
}
saatHesapla(){
  Navigator.pop(context);
 
  DateTime now=DateTime.now();
 
  girilenSaat=_dateTime.hour.toInt();
  girilenDakika=_dateTime.minute.toInt();
  anlikSaat=now.hour.toInt();
  anlikDakika=now.minute.toInt();
  anlikSaniye=now.second.toInt();
  //farkSaniye=60-anlikSaniye;
  farkSaniye=60-anlikSaniye;

  _start=0;

  if(_dateTime.hour.toInt()== now.hour.toInt()){
    debugPrint("Saat eşit");
    if (girilenDakika > now.minute.toInt()) {
      farkSaat=0;
      farkDakika=(girilenDakika-anlikDakika!)-1;
      debugPrint("Fark : $farkDakika");
    } 
    if(girilenDakika==now.minute.toInt()){
      farkSaat=0;
      farkDakika=0;
    }
    else {
      debugPrint("saat eşit başarısız");

    }
 
  }
  if (girilenSaat > anlikSaat!){
      if(girilenDakika>=anlikDakika!){
      farkSaat=girilenSaat-anlikSaat!;
      farkDakika=(girilenDakika-anlikDakika!)-1;
      bolunen=farkDakika/60;
      mod=farkDakika%60;
      if(bolunen != 0){
        
        print(" **Saat "+ farkSaat.toString() +":"+farkDakika.toString() );

      }
      else{      
        farkDakika=farkDakika+mod;
        print(" **Saat "+ farkSaat.toString() +":"+farkDakika.toString() );
      }
      }
      if(girilenDakika<anlikDakika!){
        farkSaat=(girilenSaat-anlikSaat!)-1;
        farkDakika=girilenDakika+(60-anlikDakika!);
        bolunen=farkDakika/60;
        mod=farkDakika%60;
        if(bolunen != 0){
        
        print(" **Saat "+ farkSaat.toString() +":"+farkDakika.toString() );

      }
      else{      
        farkDakika=farkDakika+mod;
        print(" **Saat "+ farkSaat.toString() +":"+farkDakika.toString() );
      }
      }
      debugPrint("MOD $mod");
      debugPrint("Fark :$farkSaat : $farkDakika"); 
      }
  
  else{
    debugPrint("İşlem Süresi Çok Uzun");
  }
  print("Sonuç olarak aradaki fark : $farkSaat : $farkDakika ");
  print("Toplam dakika ${(farkSaat*60*60)+(farkDakika*60)} ");

 
}
void startTimer(){

  debugPrint("buraya ulaştıkkk");
  setState(() {
    _timer?.cancel();
  });
  sayi=sayi+1;
 
  debugPrint("Timer Değeri"+_start.toString());
  // ignore: unnecessary_const
  const oneSec = const Duration(seconds: 1);
  //_start=(farkDakika*60)+(farkSaniye)+(farkSaat*60*60);
  _start=saniye;

    // ignore: unnecessary_new
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) {
        
        if (_start == 0)  {
          setState(() async {
            
            setState(() => timer.cancel());
            await player.pause(); 
            SystemNavigator.pop();
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
        
    );

    
}
void dispose() {
  _timer?.cancel();
  super.dispose();

}
butonEkrani(){
  debugPrint("statement");
}
muzik(){
  return showDialog(context: context,
  builder: (BuildContext context){
    return Container(
      height:MediaQuery.of(context).size.height*0.1,
      width:MediaQuery.of(context).size.width,
      color: Colors.black.withOpacity(0.5),
    // ignore: prefer_const_literals_to_create_immutables
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [

      MuzikListesi(
        muzikAd: "Nature Sound",
        musicIcon: musicIcons,
        onPressed: (){
        path="dogasesleri.wav";
        if(musicIcons == Icons.play_arrow){
          setState(() {
            musicIconss= Icons.play_arrow;
            musicIconsss= Icons.play_arrow;
            musicIcons=Icons.pause;
            Navigator.pop(context);
          });
          }else{
            setState(() async {
              await player.pause();
              musicIcons = Icons.play_arrow;
              
              Navigator.pop(context);

            });
          
            
          }

        cal();
        print("Bastı");
      },),
      MuzikListesi(
        muzikAd: "Classic Sound",
        musicIcon: musicIconss,
        onPressed: ()async{
        path="klasikmuzik.wav";
         if(musicIconss == Icons.play_arrow){
          setState(() {
            musicIcons= Icons.play_arrow;
            musicIconsss= Icons.play_arrow;
            musicIconss=Icons.pause;
            Navigator.pop(context);
          });
          }else{
            setState(() async {
              await player.pause();
              musicIconss = Icons.play_arrow;
              Navigator.pop(context);

            });
          
            
          }
        cal();
       print("Bastı");
      },),
      MuzikListesi(
        muzikAd: "Rain Sound",
        musicIcon: musicIconsss,
        onPressed: ()async{
        path="rain.wav";
         if(musicIconsss == Icons.play_arrow){
          setState(() {
            musicIcons= Icons.play_arrow;
            musicIconss= Icons.play_arrow;
            musicIconsss=Icons.pause;
            Navigator.pop(context);
          });
          }else{
            setState(() async {
              await player.pause();
              musicIconsss = Icons.play_arrow;
              Navigator.pop(context);

            });
          
            
          }
        cal();
        print("Bastı");
      },),
   
      Container(
        width:100,
        height: 50,
        color: Colors.amber,
        child: TextButton(onPressed: (){
          Navigator.of(context).pop();
        }, child: Text("CLOSE")))
      


      ]
    ),
    );
  }
  );
  }

        

dakikaGir(){
  return showDialog(context: context,
  builder: (BuildContext context){
    return Container(
        
          width: 1000,
          
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              
              CupertinoTimerPicker(
                      
                      alignment: FractionalOffset.bottomCenter,
                      backgroundColor: Color.fromARGB(0, 239, 241, 244).withOpacity(0.9),
                      
                      mode: CupertinoTimerPickerMode.ms,
                      
                      onTimerDurationChanged: (value) {
                      if (value != null && value != _selectedDate)

                      setState(() {
                          saniye=value.inSeconds.toInt();

                          debugPrint("Dakika"+dakika.toString()+"Saniye"+saniye.toString());

                      });
                      },

                    ),
                Container(
                  child: TextButton(onPressed: (){}, 
                  child: IconButton(
                    onPressed: (){
                          startTimer();
                          Navigator.pop(context);
                            showDialog(
                              
                              context: context,
                              builder: (context) {
                                Future.delayed(Duration(seconds: 5), () {
                                  Navigator.of(context).pop(true);
                                });
                                return AlertDialog(
                                  alignment: Alignment.bottomCenter,

                                  title: Text('${(saniye/60).toInt()} min.${((saniye%60))} sec.the screen will turn off.',
                                  style:TextStyle(color: Colors.white,fontSize: 16),),
                                  backgroundColor:Colors.transparent.withOpacity(0.5),
                                );
                      });


                    }, 
                  
                  icon: Icon(
                    Icons.check_box
                    ),
                    
                    iconSize: 40,
                    ), 
                   
                  
                        
                  
                ))
            ],
            
          ),
        

    );
  }
  
  
  );
}
void cal()async{
  
  await cache.loop(path!);
  

}
_launchURL() async {
  const url = 'https://flutter.io';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}}
