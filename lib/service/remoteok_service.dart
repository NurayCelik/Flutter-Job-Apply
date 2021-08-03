import 'dart:convert';
import 'package:http/http.dart' as http;

class RemoteokService {


  Future<List<dynamic>> getAllRemote() async {
    final url =
        "https://remoteok.io/api";
        
    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {"X-CMC_PRO_API_KEY": "cab79c7b-52e9-4e4b-94fc-b0f32da14799"},
      );
      print('Remoteok Response: ${response.body.toString()}');
       print('Remoteok Response: ${response.statusCode.toString()}');
      if (response.statusCode == 200) {
        return json.decode(response.body);
      }
    } catch (error) {
      print(error);
      throw error;
    }
  }
  

  noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
