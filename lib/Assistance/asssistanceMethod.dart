import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';
import 'package:ride/Assistance/requestAssistance.dart';
import 'package:ride/DataHandler/appData.dart';
import 'package:ride/configMaps.dart';
import 'package:ride/models/address.dart';

class AssistanceMethod{
  static Future<String> searchAddress(Position position, context ) async{
    String placeAddress= "";
    String url = "https://maps.googleapis.com/maps/api/geocode/json?${position.latitude},${position.longitude}&key=AIzaSyCYbElmj6DwibfHIUtTb5Yf9DnVuCp_74M";
 

    var response = await RequestAssistance.getRequest(url);

    if(response != "failed"){
      placeAddress = response["results"][0]["formatted_address"];

      Address userPickupAddress = new Address(
        placeFormattedAddress: "",
         placeName: placeAddress,
          placeId: "",
           latitude: position.latitude,
            longitude: position.longitude);

            Provider.of<AppData>(context).updatePickupLocationAddress(userPickupAddress);


    }
    return placeAddress;

  }

}