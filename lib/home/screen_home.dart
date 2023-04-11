import 'package:api_calling/provider/provider.dart';
import 'package:api_calling/wether/weather_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key, required this.data});
  WetharModel data;

  final _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final changingdata = Provider.of<changeState>(context);
    WetharModel weather = changingdata.display;
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 122, 122, 122),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                const Text(
                  "Search for city",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: _textController,
                  decoration: InputDecoration(
                    suffixIcon: GestureDetector(
                      child: const Icon(
                        Icons.settings_system_daydream_rounded,
                      ),
                      onTap: () async {
                        data = await WetharModel.getCitywether(
                            cityName: _textController.text);
                        Provider.of<changeState>(context, listen: false)
                            .searchWeather(data);
                      },
                    ),
                    fillColor: Color.fromARGB(255, 190, 190, 190),
                    border: OutlineInputBorder(
                      // borderSide: const BorderSide(
                      //   color: Color.fromARGB(255, 255, 255, 255),
                      //   width: 100,
                      // ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    // prefixIcon: Icon(Icons.search_rounded),

                    hintText: "Search...",
                    filled: true,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  decoration: BoxDecoration(
                    // color: Color.fromARGB(255, 140, 135, 135),
                    gradient: LinearGradient(
                        begin: Alignment.bottomLeft,
                        end: Alignment.topRight,
                        colors: [
                          Color.fromARGB(0, 255, 255, 255),
                          Color.fromARGB(101, 144, 202, 249),
                        ]),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  height: 150,
                  width: 190,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 15, left: 10, bottom: 15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    weather.cityName,
                                    style: TextStyle(
                                        color: Colors.black45,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    height: 18,
                                  ),
                                  Text(
                                    weather.temp.toString(),
                                    style: TextStyle(
                                        fontSize: 25,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Image.asset(
                                "assets/—Pngtree—gradient glassmorphism element of sunny_8358333.png",
                                height: 90,
                                width: 90,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(Icons.water_rounded),
                            Text(weather.humidity.toString() + "%"),
                            Icon(Icons.air),
                            Text(weather.wind.toString() + " km/h"),
                            SizedBox(
                              width: 5,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        gradient: LinearGradient(
                          begin: Alignment.bottomLeft,
                          end: Alignment.topRight,
                          colors: [
                            Color.fromARGB(0, 255, 255, 255),
                            Color.fromARGB(102, 144, 202, 249),
                          ],
                        ),
                      ),
                      height: 250,
                      width: 350,
                      child: Column(
                        children: [
                          Image.asset(
                            "assets/—Pngtree—gradient glassmorphism element of sunny_8358333.png",
                            height: 90,
                            width: 90,
                            fit: BoxFit.fill,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 50,
                              right: 50,
                              top: 10,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Percipation",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black54),
                                    ),
                                    const SizedBox(
                                      height: 6,
                                    ),
                                    Text(
                                      "35%",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "Humdity",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black54),
                                    ),
                                    const SizedBox(
                                      height: 6,
                                    ),
                                    Text(
                                      weather.humidity.toString() + "%",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                // SizedBox(
                                //   width: 80,
                                // ),
                                Column(
                                  children: [
                                    Text(
                                      "Wind",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black54),
                                    ),
                                    const SizedBox(
                                      height: 6,
                                    ),
                                    Text(
                                      weather.speed.toString(),
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "Presure",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black54),
                                    ),
                                    const SizedBox(
                                      height: 6,
                                    ),
                                    Text(
                                      weather.pressure.toString() + "hpa",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
