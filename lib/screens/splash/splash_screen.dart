import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  static const nav = "/splash";
  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    final _dSize = MediaQuery.of(context).size;
    return Container(
      width: _dSize.width,
      height: _dSize.height,
      color: Theme.of(context).backgroundColor,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("RZQ",style: Theme.of(context).textTheme.headline3,),
            Container(
              padding: const EdgeInsets.all(3),
              width: 130,
              child: LinearProgressIndicator(
                minHeight: 7,
                color: Theme.of(context).colorScheme.secondary,
                backgroundColor: Colors.grey,
              ),
            )
          ],
        ),
      ),
    );
  }
}
