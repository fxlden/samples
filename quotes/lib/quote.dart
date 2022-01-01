import 'package:isar/isar.dart';

part 'quote.g.dart';

@Collection()
class Quote {
  int? id;

  late String text;

  @Index(caseSensitive: false, type: IndexType.value)
  List<String> get textWords => Isar.splitWords(text);

  @Index(type: IndexType.hash)
  late String author;
}
