library protocols;

/**
 * parse a input url and return a protocols List
 */
List<String> protocols(String url) {
  String match = new RegExp(r'^\s?[\w\+]+(?=\:\/\/)|[\w\+]+(?=\@)').stringMatch(url);

  if (match == null) return [''];

  List<String> splits = match.trim().split("+").map((String v) => v.trim()).toSet().toList();

  return splits;
}