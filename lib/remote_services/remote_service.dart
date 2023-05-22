import 'package:fluttertoast/fluttertoast.dart';

import '../models/user.dart';
import 'package:http/http.dart' as http;
const baseUrl = 'jsonplaceholder.typicode.com';
class RemoteService{
  Future<List<User?>?> getUsersList()async{



    var response = await http.get(Uri.https(baseUrl, "users"));
    try {
      if (response.statusCode == 200) {
        var json = response.body;
        return userFromJson(json);
      }
    }
    catch(error){
      Fluttertoast.showToast(
          msg: error.toString());
    }
    return null;
  }

}