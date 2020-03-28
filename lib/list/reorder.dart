List<T> reorder<T>(Iterable<T> list, int oldIndex, int newIndex) {
  if (newIndex > oldIndex) {
    newIndex -= 1;
  }
  List<T> newList = [];
  newList.addAll(list);
  final item = newList.removeAt(oldIndex);
  newList.insert(newIndex, item);
  return newList;
}
