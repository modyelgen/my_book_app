
class SearchInfo  {
  final String? textSnippet;

  const SearchInfo({this.textSnippet});

  factory SearchInfo.fromJson(Map<String, dynamic> json) => SearchInfo(
    textSnippet: json['textSnippet'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'textSnippet': textSnippet,
  };


}