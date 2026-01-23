import 'package:flutter/cupertino.dart';

@immutable
abstract class IPagination {
  const IPagination({this.current = 0, this.records = 0});

  final int current;
  final int records;
}

class Pagination extends IPagination {
  const Pagination({super.current, super.records});
}
