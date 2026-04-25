import 'dart:convert';
import 'package:http/http.dart' show Client, Response;
import 'package:minggu_10_moviedb/model/popular_movies.dart';

class ApiProvider {
  String apiKey = '42e171cc588fdbcdc9078268f4310cce';
  String baseUrl = 'https://api.themoviedb.org/3';

  Client client = Client();

  Future<PopularMovies> getPopularMovies() async {
    Response response = await client.get(
      Uri.parse('$baseUrl/movie/popular?api_key=$apiKey'),
    );
    if (response.statusCode == 200) {
      return PopularMovies.fromJson(jsonDecode(response.body));
    } else {
      throw Exception(response.statusCode);
    }
  }
}
