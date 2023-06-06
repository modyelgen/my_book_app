import 'package:hive_flutter/hive_flutter.dart';
part'book_entites.g.dart';
@HiveType(typeId: 0)
class BookEntity extends HiveObject
{
  @HiveField(0)
  final String? image;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String? author;
  @HiveField(3)
  final num? ratingAvg;
  @HiveField(4)
  final num? ratingCount;
  @HiveField(5)
  final String? description;
  @HiveField(6)
  final int? num0fPages;
  BookEntity({required this.image,required this.title,required this.author,required this.ratingAvg,required this.ratingCount,required this.description,required this.num0fPages});
}