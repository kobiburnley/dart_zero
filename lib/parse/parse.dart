Iterable<T> parseIterable<T>(dynamic list, T fn(dynamic o), {Iterable<T> orElse()}) {
  if (list is Iterable) {
    return list.map(fn);
  }
  return orElse?.call() ?? [];
}

List<T> parseList<T>(dynamic list, T fn(dynamic o), {Iterable<T> orElse()}) {
  if (list is Iterable) {
    return list.map(fn).toList();
  }
  return orElse?.call() ?? [];
}

String parseString(dynamic s, {String orElse = ''}) {
  if (s is String) {
    return s;
  }
  return orElse;
}

int parseInt(dynamic n, {int orElse = 0}) {
  if (n is int) {
    return n;
  }
  return orElse;
}

num parseNum(dynamic n, {num orElse = 0}) {
  if (n is num) {
    return n;
  }
  return orElse;
}
