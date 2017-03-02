# protocols

[![Build Status](https://travis-ci.org/axetroy/protocols.svg?branch=master)](https://travis-ci.org/axetroy/protocols)
![License](https://img.shields.io/badge/license-MIT-green.svg)
![Dart](https://img.shields.io/badge/dart-%3E=1.2.0-blue.svg?style=flat-square)

Get the protocols of an input url.

## Usage

```dart
import 'package:protocols/protocols.dart' show protocols;

void main(){
  List<String> protos = protocols("https://www.google.com");
  print(protos);    // [https]
  
  List<String> protos = protocols("git+https@github.com:axetroy/protocols.git");
  print(protos);    // [git, https]
  
  List<String> protos = protocols("wss://example.com/api/v1");
  print(protos);    // [wss]
}
```

## Test

```bash
./TEST
```

## Contribute

```bash
git clone https://github.com/axetroy/protocols.git
cd ./url-parse
pub get
./TEST
```

## LICENSE

The [MIT License](https://github.com/axetroy/protocols/blob/master/LICENSE)