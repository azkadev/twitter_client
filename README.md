# Twitter Client

Twitter client library yang mudah di gunakan

## Feature

1. [x] cross platform support
2. [x] Multi client
3. [ ] Api Mudah di baca / di gunakan

## Install Library

```bash
dart pub add twitter_client
```

### Add Library
```bash
import 'package:twitter_client/twitter_client.dart';
```

## Quickstart

```dart
import 'dart:async';
import 'dart:io';

import 'package:twitter_client/twitter_client.dart';

Future<void> main() async {
  TwitterClient twitterClient = TwitterClient(
    bearerToken: '',
    consumerKey: '',
    consumerSecret: '',
    accessToken: "",
    accessTokenSecret: '',
  );

  var message = """
Auto Post From Azkadev
""";
  message += "\n${DateTime.now().millisecondsSinceEpoch}";
  print(await twitterClient.sendMessage(text: message));
}
```

### docs
