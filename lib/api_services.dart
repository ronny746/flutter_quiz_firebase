import 'dart:convert';

import 'package:http/http.dart' as http;

getQuiz({required String cate}) async {
  var res = await http.get(Uri.parse(
      "https://opentdb.com/api.php?amount=10&category=$cate&difficulty=easy"));
  if (res.statusCode == 200) {
    var data = jsonDecode(res.body.toString());
    print("data is loaded");
    return data;
  }
}
