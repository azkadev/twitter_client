/// Support for doing something awesome.
///
/// More dartdocs go here.
// ignore_for_file: non_constant_identifier_names

library twitter_client;

import "package:universal_io/io.dart";

import 'package:twitter_api_v2/twitter_api_v2.dart' as twtter_api;
export 'package:twitter_api_v2/twitter_api_v2.dart';


// ignore: todo
// TODO: Put public facing types in this file.

class TwitterClientData {
  String bearer_token;
  String consumer_key;
  String consumer_secret;
  String access_token;
  String access_token_secret;

  /// Checks if you are awesome. Spoiler: you are.
  TwitterClientData({
    required this.bearer_token,
    required this.consumer_key,
    required this.consumer_secret,
    required this.access_token_secret,
    required this.access_token,
  });
}

/// Checks if you are awesome. Spoiler: you are.
class TwitterClient {
  TwitterClientData twitter_client_data;

  /// Checks if you are awesome. Spoiler: you are.
  TwitterClient({
    required this.twitter_client_data,
  });

  /// Checks if you are awesome. Spoiler: you are.
  twtter_api.TwitterApi client({
    TwitterClientData? twitterClientData,
  }) {
    twitterClientData ??= twitter_client_data;
    return twtter_api.TwitterApi(
      bearerToken: twitterClientData.bearer_token,
      oauthTokens: twtter_api.OAuthTokens(
        consumerKey: twitterClientData.consumer_key,
        consumerSecret: twitterClientData.consumer_secret,
        accessToken: twitterClientData.access_token,
        accessTokenSecret: twitterClientData.access_token_secret,
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
    TwitterClientData? twitterClientData,
  }) {}

  /// Checks if you are awesome. Spoiler: you are.
  request({
    required String method,
    Map? parameters,
    TwitterClientData? twitterClientData,
  }) {
    twtter_api.TwitterApi twitter_client = client(
      twitterClientData: twitterClientData,
    );
    twitter_client;
  }

  /// Checks if you are awesome. Spoiler: you are.
  Future<Map> createReportByUsername({
    required String username,
    bool performBlock = true,
    TwitterClientData? twitterClientData,
  }) async {
    twtter_api.TwitterApi twitter_client = client(
      twitterClientData: twitterClientData,
    );
    return (await twitter_client.users
            .createReportByName(username: username, performBlock: performBlock))
        .toJson();
  }

  /// Checks if you are awesome. Spoiler: you are.
  Future<Map> createReportById({
    required String user_id,
    bool performBlock = true,
    TwitterClientData? twitterClientData,
  }) async {
    twtter_api.TwitterApi twitter_client = client(
      twitterClientData: twitterClientData,
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
    TwitterClientData? twitterClientData,
  }) async {
    twtter_api.TwitterApi twitter_client = client(
      twitterClientData: twitterClientData,
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
    TwitterClientData? twitterClientData,
  }) async {
    twtter_api.TwitterApi twitter_client = client(
      twitterClientData: twitterClientData,
    );
    return (await twitter_client.users.updateProfileBanner(file: file))
        .toJson();
  }

  /// Checks if you are awesome. Spoiler: you are.
  Future<Map> updateProfileImage({
    required File file,
    TwitterClientData? twitterClientData,
  }) async {
    twtter_api.TwitterApi twitter_client = client(
      twitterClientData: twitterClientData,
    );
    return (await twitter_client.users.updateProfileImage(file: file)).toJson();
  }

  /// Checks if you are awesome. Spoiler: you are.
  Future<Map> sendMessage({
    int chat_id = 0,
    required String text,
    TwitterClientData? twitterClientData,
  }) async {
    twtter_api.TwitterApi twitter_client = client(
      twitterClientData: twitterClientData,
    );
    return (await twitter_client.tweets.createTweet(text: text)).toJson();
  }

  /// Checks if you are awesome. Spoiler: you are.
  Future<Map> sendMessageAuto({
    int chat_id = 0,
    required String text,
    TwitterClientData? twitterClientData,
    required void Function(
            twtter_api.TwitterResponse<twtter_api.TweetData, void> tweet,
            int index,
            int total_count)
        onData,
  }) async {
    twtter_api.TwitterApi twitter_client = client(
      twitterClientData: twitterClientData,
    );

    if (text.length < 280) {
      return sendMessage(
        chat_id: chat_id,
        text: text,
        twitterClientData: twitterClientData,
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
