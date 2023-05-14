String keywordToText(List<String> keyword) {
  String text = '';
  for(String key in keyword) {
    text += "'$key' ";
  }
  return text;
}