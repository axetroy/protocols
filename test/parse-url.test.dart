import 'package:test/test.dart';

import '../lib/protocols.dart' show protocols;

@TestOn('linux || mac-os || posix || content-shell || window')
void main() {
  test("Parse the normal http url.", () {
    List<Map> testCases = [
      {
        "url": "http://www.google.com",
        "expect": ["http"]
      },
      {
        "url": "https://translate.google.com/#en/zh-CN/actually",
        "expect": ["https"]
      },
      {
        "url": "https://github.com/dart-lang/test",
        "expect": ["https"]
      },
      {
        "url": "https://github.com/gpmer/gpm.dart.git",
        "expect": ["https"]
      },
      {
        "url": "git@github.com:gpmer/gpm.dart.git",
        "expect": ['git']
      },
      {
        "url": "https+git@github.com:gpmer/gpm.dart.git",
        "expect": ['https', 'git']
      }
    ];

    testCases.forEach((testCase) {
      final List<String> actuallyResult = protocols(testCase["url"]);
      final List<String> expectResult = testCase["expect"];
      expect(actuallyResult.length, equals(expectResult.length));
      int index = 0;
      actuallyResult.forEach((ele) {
        expect(ele, equals(expectResult[index]));
        index++;
      });
    });
  });

  test("Parse the multiple url.", () {
    List<Map> testCases = [
      {
        "url": "http://www.google.com",
        "expect": ["http"]
      }
    ];

    testCases.forEach((testCase) {
      final List<String> actuallyResult = protocols(testCase["url"]);
      final List<String> expectResult = testCase["expect"];
      expect(actuallyResult.length, equals(expectResult.length));
      int index = 0;
      actuallyResult.forEach((ele) {
        expect(ele, equals(expectResult[index]));
        index++;
      });
    });
  });

  test("Parse the wrong http url.", () {
    List<Map> testCases = [
      // invalid url, missing http:\\
      {
        "url": "http:www.google.com",
        "expect": [""]
      },
      // invalid proto
      {
        "url": "httpabc://www.google.com",
        "expect": ["httpabc"]
      }
    ];

    testCases.forEach((testCase) {
      final List<String> actuallyResult = protocols(testCase["url"]);
      final List<String> expectResult = testCase["expect"];
      expect(actuallyResult.length, equals(expectResult.length));
      int index = 0;
      actuallyResult.forEach((ele) {
        expect(ele, equals(expectResult[index]));
        index++;
      });
    });
  });
}