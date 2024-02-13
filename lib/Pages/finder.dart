import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class Finder extends StatefulWidget {
  const Finder({super.key});

  @override
  State<Finder> createState() => _FinderState();
}

class _FinderState extends State<Finder> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.green,
        title: const Text('Finder', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
                onPressed: () {

                },
                icon: const Icon(
                  Icons.more_vert,
                  color: Colors.white,
                )),
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(22),
        decoration:  BoxDecoration(
          color: Colors.grey[900],
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50.0),
            topRight: Radius.circular(50.0),
          ),
        ),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40,),
              const Text('''Are you in
an emergency?''', style: TextStyle(color: Colors.green, fontSize: 30, fontWeight: FontWeight.bold, ),),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('''Press the button below and the help will reach you soon''', style: TextStyle(color: Colors.white70),),
              ),
              SizedBox(height: 70,),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green.shade300.withOpacity(0.4),
                  shape: CircleBorder()
                ),
                onPressed: (){},
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: ElevatedButton(

                    style: ElevatedButton.styleFrom(
                        shadowColor: Colors.green,
                        elevation:0,
                        shape: CircleBorder(),
                      primary: Colors.green
                    ),
                    onPressed: () async {
                      LocationPermission permission = await Geolocator.requestPermission();
                      if (permission == LocationPermission.denied) {

                        return;
                      }

                      // Get current position
                      Position position = await Geolocator.getCurrentPosition(
                        desiredAccuracy: LocationAccuracy.high,
                      );

                      print('Latitude: ${position.latitude}, Longitude: ${position.longitude}');
                    },
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.all(65.0),
                        child: Icon(Icons.sos, color: Colors.white70, size: 50,)
                      ),
                    ),
                  ),
                ),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                        10),
                    border: Border.all(
                      color: Colors.grey.shade800,
                      width: 1,
                    ),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(14.0),
                    child: Row(
                      children: [
                        Icon(Icons.car_crash, size: 50, color: Colors.green,),
                        SizedBox(width: 20,),
                        Column(
                          children: [
                            Text('Your current location:', style: TextStyle(color: Colors.white70, fontSize: 17, fontWeight: FontWeight.bold),),
                            Text('Saintgits College of Enginnering ....', style: TextStyle(color: Colors.white70),)
                          ],
                        )
                      ],
                    ),
                  )
                ),
              ),
              SizedBox(height: 30,)
            ],
          ),
        ),
      ),
    );
  }
}
