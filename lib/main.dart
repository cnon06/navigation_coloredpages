import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:navigation_coloredpages/red_page.dart';

void main() =>
    runApp(MaterialApp(debugShowCheckedModeBanner: false, home: MyApp()));

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int? _returnedNumber;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        debugPrint("App kapatılmak istendi");
        // false backspace tuşu ile programın kapanmasını engeller
        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Material App Bar'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Gelen Sayı: $_returnedNumber"),
              ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.red[300])),
                  onPressed: () async {
                    _returnedNumber = await Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (context) => RedPage(
                                  number: 55,
                                )));
                    setState(() {});
                    debugPrint("$_returnedNumber");
                  },
                  child: const Text("IOS Page")),
              ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.red)),
                  onPressed: () async {
                    _returnedNumber = await Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RedPage(
                                  number: 55,
                                )));

                    setState(() {});
                    debugPrint("$_returnedNumber");
                  },
                  child: const Text("Android Page")),
              ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.red)),
                  onPressed: () {
                    // pushReplacement kullanılırsa backspace ile bir önceki sayfaya dönülemez login tarzı sayfalarda kullanmakta fayda vardır.
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RedPage(
                                  number: 55,
                                ),
                      ));

                    setState(() {});
                    debugPrint("$_returnedNumber");
                  },
                  child: const Text("pushReplacement Android Page")),
              ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.red)),
                  onPressed: () {
                    //Navigator.pop(context); // material page e gönderir.
                    Navigator.maybePop(context); // Willopscope a gönderir.
                  },
                  child: const Text("MaybePop Page")),
              ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.red)),
                onPressed: () {
                  Navigator.canPop(context)
                      ? debugPrint("geriye gidebilir")
                      : debugPrint("geriye gidemez");
                },
                child: const Text("canPop kullanımı"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
