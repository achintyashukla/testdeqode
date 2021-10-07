import 'package:testdeqode/Models/data_model.dart';
import 'package:http/http.dart' as http;

const host = "http://www.omdbapi.com/?s=Movies&apikey=5661d041";



Future<DataModel> getData() async {
  final response = await http.get(Uri.parse(host));

  if (response.statusCode == 200) {
    return DataModel.fromRawJson(response.body);
  } else {
    throw Exception('Failed to load album');
  }
}