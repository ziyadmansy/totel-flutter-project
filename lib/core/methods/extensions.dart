extension ListExtension on List? {
  bool get isListNotEmptyOrNull => this != null && (this?.isNotEmpty ?? false);
}
