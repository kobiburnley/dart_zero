Iterable<T> parseIterable<T>(dynamic list, T fn(dynamic o),
    {Iterable<T> orElse()}) {
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

Map<K, V> parseMap<K, V>(
  dynamic raw, {
  K Function(V value, dynamic key) parseKey,
  V parseValue(dynamic v),
  Map<K, V> orElse(),
}) {
  if (raw is Map) {
    return Map.fromEntries(
      raw.entries.map(
        (entry) => parseMapEntry(
          entry,
          parseKey: parseKey,
          parseValue: parseValue,
        ),
      ),
    );
  }

  if (raw is List) {
    final values = raw.map(parseValue);
    return Map.fromIterables(
      values.map((value) => parseKey(value, null)),
      values,
    );
  }
  return orElse?.call() ?? {};
}

MapEntry<K, V> parseMapEntry<K, V>(
  dynamic entry, {
      K Function(V value, dynamic key) parseKey,
  V parseValue(dynamic v),
  MapEntry<K, V> orElse(),
}) {
  if (entry is MapEntry) {
    final value = parseValue(entry.value);
    return MapEntry(
      parseKey(value, entry.key),
      value,
    );
  }
  final value = parseValue(null);

  return orElse?.call() ?? MapEntry(parseKey(value, null), value);
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

bool parseBool(dynamic b, {bool orElse = false}) {
  if (b is bool) {
    return b;
  }
  return orElse;
}

num parseNum(dynamic n, {num orElse = 0}) {
  if (n is num) {
    return n;
  }
  return orElse;
}
