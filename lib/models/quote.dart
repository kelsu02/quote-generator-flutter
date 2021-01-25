import 'package:equatable/equatable.dart';

class Quote extends Equatable {
  final id;
  final String quoteText;
  final String quoteAuthor;
  final String quoteGenre;

  Quote({this.id, this.quoteText, this.quoteAuthor, this.quoteGenre});

  @override
  List<Object> get props => [id, quoteText, quoteAuthor, quoteGenre];

  static Quote fromJson(dynamic json) {
    final allData = json['data'][0];
    return Quote(
      id: allData['_id'],
      quoteText: allData['quoteText'],
      quoteAuthor: allData['quoteAuthor'],
      quoteGenre: allData['quoteGenre'],
    );
  }

  // static Quote fromJson(dynamic json) {
  //   return Quote(
  //     // id: json['_id'],
  //     // quoteText: json['quoteText'],
  //     // quoteAuthor: json['quoteAuthor'],
  //     // data: json['data']
  //     id: json['_id'],
  //     quoteText: json['content'],
  //     quoteAuthor: json['author'],
  //   );
  // }

  @override
  String toString() => 'Quote { id: $id }';
}
