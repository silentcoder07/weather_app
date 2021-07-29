import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkData {
  NetworkData({required this.url});
  final String url;

  Future getData() async {
    var uri =Uri.parse(url);
    http.Response response = await http.get(uri);

    if (response.statusCode == 200) {
      String data = response.body;

      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }
}