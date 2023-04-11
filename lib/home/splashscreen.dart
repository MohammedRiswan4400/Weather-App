import 'package:api_calling/provider/provider.dart';
import 'package:api_calling/wether/weather_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screen_home.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    gotoHome(context: context);
    return Scaffold(
      backgroundColor: Colors.blue.shade300,
      body: Center(
        child: Image.asset(
          "assets/—Pngtree—gradient glassmorphism element of sunny_8358333.png",
          height: 90,
          width: 90,
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  Future<void> gotoHome({required BuildContext context}) async {
    Future.delayed(Duration(seconds: 3));

    final WetharModel data =
        await WetharModel.getcurrentwether(lat: 9.939093, lon: 76.270523);
    Provider.of<changeState>(context, listen: false).initState(data);
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (ctx) => HomeScreen(
          data: data,
        ),
      ),
    );
  }
}
