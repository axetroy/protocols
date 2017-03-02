library protocols;

/**
 * 获取url地址的协议proto
 * 返回一个字符串/数组
 */
List<String> protocols(String url) {
  String match = new RegExp(r'^\s?[\w\+]+(?=\:\/\/)|[\w\+]+(?=\@)').stringMatch(url);

  if (match == null) return [''];

  List<String> splits = match.trim().split("+").map((String v) => v.trim()).toSet().toList();

  return splits;
}