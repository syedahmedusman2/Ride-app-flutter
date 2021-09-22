import 'package:flutter/cupertino.dart';
import 'package:ride/models/address.dart';

class AppData extends ChangeNotifier{
  late Address pickupLocation;

  void updatePickupLocationAddress(Address pickupAddress){
   pickupLocation = pickupAddress;
    notifyListeners();

    
  }

}