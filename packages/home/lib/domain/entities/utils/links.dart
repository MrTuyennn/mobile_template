import 'package:flutter/foundation.dart';

@immutable
abstract class ILinks {
  const ILinks({
    this.self = '',
    this.current = '',
    this.next = '',
    this.last = '',
  });

  final String self;
  final String current;
  final String next;
  final String last;
}

class Links extends ILinks {
  const Links({super.self, super.current, super.last, super.next});
}
