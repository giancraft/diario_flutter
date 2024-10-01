import 'dart:convert'; // Para utilizar jsonEncode
import 'package:diario/services/http_interceptors.dart';
import 'package:http/http.dart' as http;
import 'package:http_interceptor/http/intercepted_client.dart';

class JournalService {
  static const String url = "http://172.16.0.183:3000/";
  static const String resource = "learnhttp/";

  http.Client client = InterceptedClient.build(interceptors: [LoggerInterceptor()]);

  String getUrl(){
    return "$url$resource";
  }

  Future<void> register(String content) async {
    client.post(
      Uri.parse(getUrl()), 
      headers: {
        "Content-Type": "application/json", // Especifica que o conteúdo está em JSON
      },
      body: jsonEncode({
        "content": content, // Envia o conteúdo como JSON
      }),
    );
  }

  Future<String> get() async{
    http.Response response = await client.get(Uri.parse(getUrl()));
    return response.body;
  }
}
