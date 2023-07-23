import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const FunnyQuotesApp());
}

class FunnyQuotesApp extends StatelessWidget {
  const FunnyQuotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const List<String> quoteList = [
    'ไม่ชอบคนอ่อนไหว ชอบแต่คนโอนไวเท่านั้น',
    'โตขึ้นจะรู้ว่าโลกความจริงไม่ได้สวย แต่เราสวยนั้นคือเรื่องจริง',
    'ถึงไม่ใช่โซเดียม แต่คอลไลน์ได้นะ',
    'วันที่เหมาะกับการออกกำลังกายมากที่สุด คือ "วันหลัง"',
    'พยายามหาเลขเด็ด แต่ลืมไป เราเด็ดกว่าเลข',
    'ไม่มีหรอกหัวหอมให้เธอหั่น มีแต่หัวฉันนี่แหละให้เธอหอม',
    'ทำไมเธอถึงเลือกเขา ขนาดพระยังเลือก...ฉันเลย',
    'ชีวิตไม่คุมโทนอะไรทั้งนั้น แค่ทุกวันนี้คุมสติตัวเองยังไม่ได้เลยค่ะ',
    'ชีวิตนี้ไม่ต้องการอะไรที่ตื่นเต้น แต่ต้องการตื่นสาย',
    'โตแล้ว ไม่คิดเรื่องหยุมหยิมหรอก หยุมหัวกันไปเลย',
  ];

  static const List<Color> colorList = [
    Colors.black,
    Colors.blue,
    Colors.deepOrange,
    Colors.deepPurple,
    Colors.green,
    Colors.lightGreen,
    Colors.orange,
    Colors.pink,
    Colors.purple,
    Colors.teal,
    Colors.yellowAccent,
  ];

  var quote = quoteList[0];
  int randQuoteBefore = 0;

  var color = colorList[0];
  int randColorBefore = 0;

  int randomNum(int length) {
    return Random().nextInt(length);
  }

  int equalIndex(int randNumBefore, int randNumAfter, int length) {
    while (true) {
      if (randNumAfter == randNumBefore) {
        randNumAfter = randomNum(length);
        continue;
      } else {
        break;
      }
    }

    return randNumAfter;
  }

  void handleClickGo() {
    setState(() {
      int randQuoteAfter = randomNum(quoteList.length);
      randQuoteBefore =
          equalIndex(randQuoteBefore, randQuoteAfter, quoteList.length);
      quote = quoteList[randQuoteBefore];

      int randColorAfter = randomNum(colorList.length);
      randColorBefore =
          equalIndex(randColorBefore, randColorAfter, colorList.length);
      color = colorList[randColorBefore];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('คำคมกวนๆ')),
      floatingActionButton: FloatingActionButton(
        onPressed: handleClickGo,
        child: const Text('GO'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Text(
            quote,
            style: TextStyle(
              color: color,
              fontSize: 40,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
