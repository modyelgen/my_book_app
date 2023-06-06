import 'package:app_1/my_book_app/features/home/data/models/access_info.dart';
import 'package:app_1/my_book_app/features/home/data/models/sale_info.dart';
import 'package:app_1/my_book_app/features/home/data/models/search_info.dart';
import 'package:app_1/my_book_app/features/home/data/models/volume_info.dart';
import 'package:app_1/my_book_app/features/home/domain/entites/book_entites.dart';
class BookModel extends BookEntity {
  final String? kind;
  final String? id;
  final String? etag;
  final String? selfLink;
  final VolumeInfo? volumeInfo;
  final SaleInfo? saleInfo;
  final AccessInfo? accessInfo;
  final SearchInfo? searchInfo;

   BookModel({
    this.kind,
    this.id,
    this.etag,
    this.selfLink,
    required this.volumeInfo,
    this.saleInfo,
    this.accessInfo,
    this.searchInfo,
  }):super(image:volumeInfo?.imageLinks?.smallThumbnail??'',
      title:volumeInfo?.title??'Un Known' ,author:volumeInfo?.authors?[0]??'Un Known'
       ,ratingAvg: volumeInfo?.averageRating,ratingCount:volumeInfo?.ratingsCount,
     num0fPages: volumeInfo?.pageCount??0,description: volumeInfo?.description??'no idea',
   );

  factory BookModel.fromJson(Map<String, dynamic> json) => BookModel(
    kind: json['kind'] as String?,
    id: json['id'] as String?,
    etag: json['etag'] as String?,
    selfLink: json['selfLink'] as String?,
    volumeInfo:
    VolumeInfo.fromJson(json['volumeInfo'] as Map<String, dynamic>),
    saleInfo: json['saleInfo'] == null
        ? null
        : SaleInfo.fromJson(json['saleInfo'] as Map<String, dynamic>),
    accessInfo: json['accessInfo'] == null
        ? null
        : AccessInfo.fromJson(json['accessInfo'] as Map<String, dynamic>),
    searchInfo: json['searchInfo'] == null
        ? null
        : SearchInfo.fromJson(json['searchInfo'] as Map<String, dynamic>),
  );

  Map<String, dynamic> toJson() => {
    'kind': kind,
    'id': id,
    'etag': etag,
    'selfLink': selfLink,
    'volumeInfo': volumeInfo?.toJson(),
    'saleInfo': saleInfo?.toJson(),
    'accessInfo': accessInfo?.toJson(),
    'searchInfo': searchInfo?.toJson(),
  };

}


















