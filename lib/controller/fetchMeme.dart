import 'dart:convert';
import 'package:http/http.dart';

class Fetchmeme {
static fetchNewMeme() async {
    Response response = await get(Uri.parse('https://meme-api.com/gimme'));
    if (response.statusCode == 200) {
  Map bodyData = jsonDecode(response.body);
  print(bodyData['url']);
   return bodyData['url'];

    } else {
      return 'Failed to load meme';
    }
  }
}