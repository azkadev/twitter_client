/// Support for doing something awesome.
///
/// More dartdocs go here.
// ignore_for_file: non_constant_identifier_names

library twitter_client;

import 'dart:io';

import 'package:twitter_api_v2/twitter_api_v2.dart' as twtter_api;
export 'package:twitter_api_v2/twitter_api_v2.dart';
export 'src/twitter_client_base.dart';

// ignore: todo
// TODO: Put public facing types in this file.

/// Checks if you are awesome. Spoiler: you are.
class TwitterClient {
  late String bearer_token;
  late String consumer_key;
  late String consumer_secret;
  late String access_token;
  late String access_token_secret;

  /// Checks if you are awesome. Spoiler: you are.
  TwitterClient({
    required String bearerToken,
    required String consumerKey,
    required String consumerSecret,
    required String accessToken,
    required String accessTokenSecret,
  }) {
    bearer_token = bearerToken;
    consumer_secret = consumerSecret;
    consumer_key = consumerKey;
    access_token = accessToken;
    access_token_secret = accessTokenSecret;
  }

  /// Checks if you are awesome. Spoiler: you are.
  twtter_api.TwitterApi client({
    String? bearerToken,
    String? consumerKey,
    String? consumerSecret,
    String? accessToken,
    String? accessTokenSecret,
  }) {
    bearerToken ??= bearer_token;
    consumerKey ??= consumer_key;
    consumerSecret ??= consumer_secret;
    accessToken ??= access_token;
    accessTokenSecret ??= access_token_secret;

    return twtter_api.TwitterApi(
      bearerToken: bearerToken,
      oauthTokens: twtter_api.OAuthTokens(
        consumerKey: consumerKey,
        consumerSecret: consumerSecret,
        accessToken: accessToken,
        accessTokenSecret: accessTokenSecret,
      ),
      retryConfig: twtter_api.RetryConfig.ofExponentialBackOffAndJitter(
        maxAttempts: 5,
        onExecute: (event) => print(
          'Retry after ${event.intervalInSeconds} seconds... '
          '[${event.retryCount} times]',
        ),
      ),
    );
  }

  /// Checks if you are awesome. Spoiler: you are.
  invoke({
    required String method,
    Map? parameters,
    String? bearerToken,
    String? consumerKey,
    String? consumerSecret,
    String? accessToken,
    String? accessTokenSecret,
  }) {}

  /// Checks if you are awesome. Spoiler: you are.
  request({
    required String method,
    Map? parameters,
    String? bearerToken,
    String? consumerKey,
    String? consumerSecret,
    String? accessToken,
    String? accessTokenSecret,
  }) {
    twtter_api.TwitterApi twitter_client = client(
      bearerToken: bearerToken,
      consumerKey: consumerKey,
      consumerSecret: consumerSecret,
      accessToken: accessToken,
      accessTokenSecret: accessTokenSecret,
    );
    twitter_client;
  }

  /// Checks if you are awesome. Spoiler: you are.
  Future<Map> createReportByUsername({
    required String username,
    bool performBlock = true,
    String? bearerToken,
    String? consumerKey,
    String? consumerSecret,
    String? accessToken,
    String? accessTokenSecret,
  }) async {
    twtter_api.TwitterApi twitter_client = client(
      bearerToken: bearerToken,
      consumerKey: consumerKey,
      consumerSecret: consumerSecret,
      accessToken: accessToken,
      accessTokenSecret: accessTokenSecret,
    );
    return (await twitter_client.users
            .createReportByName(username: username, performBlock: performBlock))
        .toJson();
  }

  /// Checks if you are awesome. Spoiler: you are.
  Future<Map> createReportById({
    required String user_id,
    bool performBlock = true,
    String? bearerToken,
    String? consumerKey,
    String? consumerSecret,
    String? accessToken,
    String? accessTokenSecret,
  }) async {
    twtter_api.TwitterApi twitter_client = client(
      bearerToken: bearerToken,
      consumerKey: consumerKey,
      consumerSecret: consumerSecret,
      accessToken: accessToken,
      accessTokenSecret: accessTokenSecret,
    );
    return (await twitter_client.users
            .createReportById(userId: user_id, performBlock: performBlock))
        .toJson();
  }

  /// Checks if you are awesome. Spoiler: you are.
  Future<Map> updateProfile({
    String? name,
    String? description,
    String? url,
    String? location,
    String? bearerToken,
    String? consumerKey,
    String? consumerSecret,
    String? accessToken,
    String? accessTokenSecret,
  }) async {
    twtter_api.TwitterApi twitter_client = client(
      bearerToken: bearerToken,
      consumerKey: consumerKey,
      consumerSecret: consumerSecret,
      accessToken: accessToken,
      accessTokenSecret: accessTokenSecret,
    );
    return (await twitter_client.users.updateProfile(
      name: name,
      description: description,
      url: url,
      location: location,
    ))
        .toJson();
  }

  /// Checks if you are awesome. Spoiler: you are.
  Future<Map> updateProfileBanner({
    required File file,
    String? bearerToken,
    String? consumerKey,
    String? consumerSecret,
    String? accessToken,
    String? accessTokenSecret,
  }) async {
    twtter_api.TwitterApi twitter_client = client(
      bearerToken: bearerToken,
      consumerKey: consumerKey,
      consumerSecret: consumerSecret,
      accessToken: accessToken,
      accessTokenSecret: accessTokenSecret,
    );
    return (await twitter_client.users.updateProfileBanner(file: file))
        .toJson();
  }

  /// Checks if you are awesome. Spoiler: you are.
  Future<Map> updateProfileImage({
    required File file,
    String? bearerToken,
    String? consumerKey,
    String? consumerSecret,
    String? accessToken,
    String? accessTokenSecret,
  }) async {
    twtter_api.TwitterApi twitter_client = client(
      bearerToken: bearerToken,
      consumerKey: consumerKey,
      consumerSecret: consumerSecret,
      accessToken: accessToken,
      accessTokenSecret: accessTokenSecret,
    );
    return (await twitter_client.users.updateProfileImage(file: file)).toJson();
  }

  /// Checks if you are awesome. Spoiler: you are.
  Future<Map> sendMessage({
    int chat_id = 0,
    required String text,
    String? bearerToken,
    String? consumerKey,
    String? consumerSecret,
    String? accessToken,
    String? accessTokenSecret,
  }) async {
    twtter_api.TwitterApi twitter_client = client(
      bearerToken: bearerToken,
      consumerKey: consumerKey,
      consumerSecret: consumerSecret,
      accessToken: accessToken,
      accessTokenSecret: accessTokenSecret,
    );
    return (await twitter_client.tweets.createTweet(text: text)).toJson();
  }

  /// Checks if you are awesome. Spoiler: you are.
  Future<Map> sendMessageAuto({
    int chat_id = 0,
    required String text,
    String? bearerToken,
    String? consumerKey,
    String? consumerSecret,
    String? accessToken,
    String? accessTokenSecret,
    required void Function(
            twtter_api.TwitterResponse<twtter_api.TweetData, void> tweet,
            int index,
            int total_count)
        onData,
  }) async {
    twtter_api.TwitterApi twitter_client = client(
      bearerToken: bearerToken,
      consumerKey: consumerKey,
      consumerSecret: consumerSecret,
      accessToken: accessToken,
      accessTokenSecret: accessTokenSecret,
    );

    if (text.length < 280) {
      return sendMessage(
        chat_id: chat_id,
        text: text,
        bearerToken: bearerToken,
        consumerKey: consumerKey,
        consumerSecret: consumerSecret,
        accessToken: accessToken,
        accessTokenSecret: accessTokenSecret,
      );
    }
    await Future.delayed(Duration(seconds: 2));
    List<String> texts = TwitterUtils.splitByLength(text, 250);
    var res = await twitter_client.tweets.createTweet(text: texts.first);
    List<Map> results = [
      res.toJson(),
    ];
    await Future.delayed(Duration(seconds: 2));
    for (var index = 1; index < texts.length; index++) {
      print(texts[index].length);
      await Future.delayed(Duration(seconds: 2));
      // exit(0);
      var re = await twitter_client.tweets.createTweet(
        text: texts[index],
        reply: twtter_api.TweetReplyParam(
          inReplyToTweetId: res.data.id,
        ),
      );
      onData.call(re, index, texts.length);
      results.add(re.toJson());
    }
    return {"ok": true, "result": results};
  }
}

class TwitterUtils {
  TwitterUtils();

  static List<String> splitByLength(String text, int length,
      {bool ignoreEmpty = false}) {
    List<String> pieces = [];

    for (int i = 0; i < text.length; i += length) {
      int offset = i + length;
      String piece =
          text.substring(i, offset >= text.length ? text.length : offset);

      if (ignoreEmpty) {
        piece = piece.replaceAll(RegExp(r'\s+'), '');
      }

      pieces.add(piece);
    }
    return pieces;
  }
}
