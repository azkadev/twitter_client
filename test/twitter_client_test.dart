import 'package:twitter_client/twitter_client.dart';
import 'package:test/test.dart';

void main() {
  group('A group of tests', () {
    final awesome = Awesome();

    setUp(() {
      // Additional setup goes here.
    });

    test('First Test', () {
      expect(awesome.isAwesome, isTrue);
    });
  });
}

class TwitterClientData {
  late String bearerToken;
  late String consumerKey;
  late String consumerSecret;
  late String accessToken;
  late String accessTokenSecret;

  TwitterClientData({
    required this.bearerToken,
    required this.consumerKey,
    required this.consumerSecret,
    required this.accessToken,
    required this.accessTokenSecret,
  });
}
