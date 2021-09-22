import 'dart:convert';
import 'dart:ffi';

import 'package:http/http.dart' as http;

class RequestAssistance {
  static Future<dynamic> getRequest(url)async
  {
    http.Response response = await http.get(url);

    try {
      if(response.statusCode == 200){
        String jsonData = response.body;
        var decodeData = jsonDecode(jsonData);
      }else {
        return "failed";
      }
    }catch(e){
      return "failed";
    }


  }
}