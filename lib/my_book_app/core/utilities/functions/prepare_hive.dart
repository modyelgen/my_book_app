import 'package:hive_flutter/hive_flutter.dart';

import '../../../features/home/domain/entites/book_entites.dart';
import '../constants.dart';

Future<void> prepareHive() async {
  await Hive.initFlutter();
  Hive.registerAdapter(BookEntityAdapter());
  await Hive.openBox<BookEntity>(kFeaturedBox);
  await Hive.openBox<BookEntity>(kNewestBox);
}