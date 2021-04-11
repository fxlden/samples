import 'package:isar/isar.dart';

@Collection()
class Quote {
  int? id;

  @Index(caseSensitive: false, indexType: IndexType.words)
  late String text;

  @Index(indexType: IndexType.hash)
  late String author;
}
