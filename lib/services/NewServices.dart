import 'dart:convert';
import 'package:project2/models/NewsModel.dart';
import 'package:http/http.dart' as http;

class NewServices {
  static Future<List<Articles>?> fetchType(String type)async{
    List <Articles> article = [];
    try{
      String apiKey= "https://newsapi.org/v2/top-headlines?country=eg&category=$type&apiKey=983f6ba957924d20b1e5b17a61f6d5b6";
     // String apiKey="https://newsapi.org/v2/top-headlines?country=eg&category=$type&apiKey=ff07382cc1f84dc4870f8ed0d3def8b7";
      final response = await http.get(Uri.parse(apiKey));
      if (response.statusCode == 200) {
        final jsonRes = jsonDecode(response.body); //json to map
        print(jsonRes);
        final newsRes = NewsModel.fromJson(jsonRes); // ba5od mn map a7wlo l list w a7oto f list 3ndi
        return newsRes.articles;
        // if (newsRes.articles!.isNotEmpty) {
        //   source = newsRes.articles![0].source;
        //   return source;
        //   // altlt stor dol zado 3shan ana 3ndi 3 classes f ana msh harg3 data mn no3 cart akid
        //   // harg3ha mn no3 product f hat check an al data ali rag3a mn product.cart msh empty
        //   // 3shan arg3ha f harg3 list of products ali f carts[0]
        // } else {
        //   return [];
        // }
      }
      else{
        throw Exception('Failed to load data from the API');
      }
    }
    catch(e){
      throw Exception(e.toString());
    }
  }
}
