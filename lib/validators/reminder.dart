String? validateTitle(String? title) {
  if (title == null || title.isEmpty) {
    return 'Please enter a title';
  }
  return null;
}

String? validateDescription(String? description) {
  if (description == null || description.isEmpty) {
    return 'Please enter a description';
  }
  return null;
}
