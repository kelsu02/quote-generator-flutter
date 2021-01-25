import 'dart:convert';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'package:random_quote/models/models.dart';

class QuoteApiClient {
  final _baseUrl = 'https://quote-garden.herokuapp.com';
  // final _baseUrl = 'https://api.quotable.io';
  final http.Client httpClient;

  QuoteApiClient({
    @required this.httpClient,
  }) : assert(httpClient != null);

  Future<Quote> fetchQuote() async {
    final url = '$_baseUrl/api/v3/quotes/random';
    // final url = '$_baseUrl/random';
    final response = await this.httpClient.get(url);

    if (response.statusCode != 200) {
      throw new Exception('error getting quotes');
    }

    final json = jsonDecode(response.body);
    return Quote.fromJson(json);
  }
}
