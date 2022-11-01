import 'package:flutter/material.dart';

class RedPage extends StatelessWidget {
  final number;
  RedPage({required this.number});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.red,
          title: const Text("Red Page"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Gönderilen Sayı: $number"),
              ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.red)),
                onPressed: () {
                  Navigator.pop(context, number * 2);
                },
                child: const Text("Main Page"),
              ),
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
