import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:ride/Assistance/asssistanceMethod.dart';
import 'package:ride/DataHandler/appData.dart';

class HomePage extends StatefulWidget {

  const HomePage({ Key? key }) : super(key: key);
    static const String idscreen = "mainScreen";

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double bottompad= 0;
  static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

      static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  late Position currentPosition;
  var geolocator = Geolocator();

  void locatePosition()async{
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    currentPosition = position;
    LatLng latlanPosition = LatLng(position.latitude, position.longitude);
    CameraPosition cameraPosition = new CameraPosition(target: latlanPosition, zoom: 14);

    newGoogleMapController.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
    String address = await AssistanceMethod.searchAddress(position, context);
    print("This is your address :: " + address);


  }

      Completer<GoogleMapController> _controllerGoogleMap = Completer();
     late GoogleMapController newGoogleMapController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Main Screen", style: TextStyle(fontSize: 20, fontFamily: 'Semi bold', color: Colors.black),)),
        backgroundColor:Colors.yellowAccent[700],
      ),
      body: Stack(
          children: [
            GoogleMap(
              padding: EdgeInsets.only(bottom: bottompad),
              mapType: MapType.normal,
              myLocationButtonEnabled: true,
              myLocationEnabled: true,
              zoomGesturesEnabled: true,
              zoomControlsEnabled: true,
              initialCameraPosition: _kGooglePlex,
              onMapCreated: (GoogleMapController controller){
                _controllerGoogleMap.complete(controller);
                newGoogleMapController = controller;
                locatePosition();
                
                
              },
            ),
            Positioned(
              left:0,
              right:0,
              bottom:0,
              child: Container(
                height: 300.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(18.0), topRight: Radius.circular(18),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      blurRadius: 16,
                      spreadRadius: 0.5,
                      offset: Offset(0.7,0.7)
                    )
                  ], 


                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 8,),
                      Text("Hi There, " ,style: TextStyle(fontSize: 12,fontFamily: "Semi bold"),),
                      SizedBox(height:3),
                      Text("Where to? " ,style: TextStyle(fontSize: 20, fontFamily: "Semi bold"),),
                      SizedBox(height: 20,),
                      Container(
                        height: 25,
                         decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.0), topRight: Radius.circular(10),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      blurRadius: 6,
                      spreadRadius: 0.5,
                      offset: Offset(0.7,0.7)
                    )
                  ],
                ),
                child: Row(
                  children: [
                    Icon(Icons.search, color: Colors.yellowAccent[700],),
                    SizedBox(width: 10,),
                    Text("Search Drop of location")
                  ],
                ),
                


                      ),
                      SizedBox(height: 24,),
                      Row(
                        children: [
                          Icon(Icons.home),
                          SizedBox(width: 12,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                Provider.of<AppData>(context).pickupLocation != null ?
                                Provider.of<AppData>(context).pickupLocation.placeName : "Add Home"
                                ,style: TextStyle(fontFamily: "Regular" )),
                              SizedBox(height:4),
                              Text("Your home address", style:  TextStyle(color: Colors.grey[300], fontSize: 12),)
                            ],
                          )
                        ],
                      ),

                      SizedBox(height: 10,),
                      Divider(
                        height: 1,
                        thickness: 1,
                      ),
                      SizedBox(height: 15,),
                      Row(
                        children: [
                          Icon(Icons.work),
                          SizedBox(width: 12,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Add work", style: TextStyle(fontFamily: "Regular" )),
                              SizedBox(height:4),
                              Text("Your office address", style:  TextStyle(color: Colors.grey[300], fontSize: 12),)
                            ],
                          )
                        ],
                      )


                      
                    ],
                  ),
                )

              ),
            )
       
          ],
        ),
        drawer: Drawer(
          child: Container(
            height: MediaQuery.of(context).size.height * 1,
        width: 130,
        child: Column(
          children: [
            DrawerHeader(child:
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage('assests/images/user_icon.png'),
                  radius: 30,
                ),
                SizedBox(width: 35,),
                Padding(
                  padding: const EdgeInsets.only(top: 46),
                  child: Column(
                    children: [
                      Text("User Name", style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Regular',)),
                      SizedBox(height: 3,),
                      Text("View Profile", style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Regular',))

                    ],
                  ),
                )

              ],
            )
            ),
            SizedBox(height: 5,),
           
            SizedBox(height: 5,),
            Padding(
              padding: const EdgeInsets.fromLTRB(6, 10, 0, 5),
              child: Row(
                children: [
                  Icon(Icons.history, color: Colors.yellowAccent[700]),
                  SizedBox(width:10,),
                  Text("History", style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Regular',color: Colors.yellowAccent[700]))
                ],
              ),
            ),

             Padding(
              padding: const EdgeInsets.fromLTRB(6, 10, 0, 5),
              child: Row(
                children: [
                  Icon(Icons.verified_user, color: Colors.yellowAccent[700],),
                  SizedBox(width: 10,),
                  Text("Visit Profile", style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Regular',color: Colors.yellowAccent[700]))
                ],
              ),
            ),

             Padding(
                padding: const EdgeInsets.fromLTRB(6, 10, 0, 5),
              child: Row(
                children: [
                  Icon(Icons.add_box_outlined, color: Colors.yellowAccent[700]),
                  SizedBox(width: 10,),
                  Text("About", style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Regular',color: Colors.yellowAccent[700] ))
                ],
              ),
            )
          ],
          
        ),
          ),
        ),
      
    );

  
  }
}