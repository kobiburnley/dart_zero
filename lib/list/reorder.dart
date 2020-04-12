List<T> reorder<T>(Iterable<T> list, int oldIndex, int newIndex) {
  if(oldIndex < 0 || oldIndex > list.length - 1) return list;
  if(newIndex < 0 || newIndex > list.length - 1) return list;
  List<T> newList = [];
  newList.addAll(list);
  final item = newList.removeAt(oldIndex);
  newList.insert(newIndex, item);
  return newList;
}
