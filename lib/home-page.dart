import 'package:flutter/material.dart';
import 'package:weather_app/getlocation.dart';
import 'package:weather_app/weatherData.dart';

class MyHomePage extends StatelessWidget {
   MyHomePage({Key? key}) : super(key: key);
  var client = WeatherData();
  var data;
  info() async {
    var position = await getPosition();
    data = await client.getData(position.latitude, position.longitude);
    return data;
  }


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: FutureBuilder(
          future: info(),
          builder: ((context,snapshot) {
            return Container(
              child: Column(
                children: [
                  Container(
                    height: size.height * 0.75,
                    width: size.width,
                    padding: EdgeInsets.only(top: 20),
                    margin: EdgeInsets.only(right: 0, left: 0),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(15),
                      gradient: const LinearGradient(
                          colors: [Color(0xff955cd1), Color(0xff3fa2fa)],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          stops: [0.2,0.4]
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:  [
                        Text('${data?.cityName   }',
                          style: TextStyle(color: Colors.white.withOpacity(0.7),fontSize: 35),),
                        // Text('Monday 03 March',
                        //   style: TextStyle(color: Colors.white.withOpacity(0.9),fontSize: 15),),
                        // Image.asset('Assets/sunny.png',width: size.width *0.4,),
                        Image.network('https:${data?.icon}',
                        width: size.width *0.36,
                        fit: BoxFit.fill,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text('${data?.condition}',style: TextStyle(
                            color: Colors.white,
                            fontSize: 45,
                            fontWeight: FontWeight.bold
                        ),),
                        SizedBox(height: 5,),
                        Text("${data?.temp}\u00B0",style: TextStyle(
                            color: Colors.white,
                            fontSize: 45,
                            fontWeight: FontWeight.bold
                        ),),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Expanded(child: Column(
                              children: [
                                Image.asset('Assets/windy.png',width: size.width*0.2,),
                                Text('${data?.wind} km/h',style: TextStyle(color: Colors.white,fontSize: 20,
                                    fontWeight: FontWeight.bold)),
                                SizedBox(height: 10,),
                                Text('wind',style: TextStyle(color: Colors.white.withOpacity(0.6),fontSize: 17,
                                    fontWeight: FontWeight.bold))

                              ],
                            )),
                            Expanded(child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image.asset('Assets/humidity.png',width: size.width*0.25,),
                                ),
                                Text('${data?.humidity}',style: TextStyle(color: Colors.white,fontSize: 20,
                                    fontWeight: FontWeight.bold)),
                                SizedBox(height: 10,),
                                Text('Humidity',style: TextStyle(color: Colors.white.withOpacity(0.6),fontSize: 17,
                                    fontWeight: FontWeight.bold))

                              ],
                            )),
                            Expanded(child: Column(
                              children: [
                                Image.asset('Assets/direction.png',width: size.width*0.18,),
                                Text('${data?.wind_dir}',style: TextStyle(color: Colors.white,fontSize: 20,
                                    fontWeight: FontWeight.bold)),
                                SizedBox(height: 10,),
                                Text('Wind Direction',style: TextStyle(color: Colors.white.withOpacity(0.6),fontSize: 17,
                                    fontWeight: FontWeight.bold))

                              ],
                            ))
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Expanded(child: Column(
                          children: [
                            Text('Gust',style: TextStyle(
                                color: Colors.white.withOpacity(0.7),
                                fontSize: 15
                            ),),
                            SizedBox(height: 5),
                            Text('${data?.gust}kp/h',style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.bold
                            ),)

                          ],
                        )),
                        // Expanded(child: Column(
                        //   children: [
                        //     Text('UV',style: TextStyle(
                        //         color: Colors.white.withOpacity(0.7),
                        //         fontSize: 15
                        //     ),),
                        //     SizedBox(height: 5),
                        //     Text('${data?.uv}',style: TextStyle(
                        //         color: Colors.white,
                        //         fontSize: 22,
                        //         fontWeight: FontWeight.bold
                        //     ),)
                        //
                        //   ],
                        // )),
                        Expanded(child: Column(
                          children: [
                            Text('Wind',style: TextStyle(
                                color: Colors.white.withOpacity(0.7),
                                fontSize: 15
                            ),),
                            SizedBox(height: 5),
                            Text('${data?.wind} km/h',style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.bold
                            ),)

                          ],
                        ))
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Expanded(child: Column(
                          children: [
                            Text('Pressure',style: TextStyle(
                                color: Colors.white.withOpacity(0.7),
                                fontSize: 15
                            ),),
                            SizedBox(height: 5),
                            Text('${data?.pressure}hpa',style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.bold
                            ),)

                          ],
                        )),
                        // Expanded(child: Column(
                        //   children: [
                        //     Text('Precipitation',style: TextStyle(
                        //         color: Colors.white.withOpacity(0.7),
                        //         fontSize: 15
                        //     ),),
                        //     SizedBox(height: 5),
                        //     Text('${data?.precipe} mm',style: TextStyle(
                        //         color: Colors.white,
                        //         fontSize: 22,
                        //         fontWeight: FontWeight.bold
                        //     ),)
                        //
                        //   ],
                        // )),
                        Expanded(child: Column(
                          children: [
                            Text('Last Update',style: TextStyle(
                                color: Colors.white.withOpacity(0.7),
                                fontSize: 15
                            ),),
                            SizedBox(height: 5),
                            Text('${data?.last_update}',style: TextStyle(
                                color: Colors.green,
                                fontSize: 22,
                                fontWeight: FontWeight.bold
                            ),)

                          ],
                        ))
                      ],
                    ),
                  ),
                ],
              ),
            );
          }))
    );
  }
}
