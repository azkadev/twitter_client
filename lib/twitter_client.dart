/// Support for doing something awesome.
///
/// More dartdocs go here.
// ignore_for_file: non_constant_identifier_names

library twitter_client;

import 'package:twitter_api_v2/twitter_api_v2.dart' as twtter_api;
export 'package:twitter_api_v2/twitter_api_v2.dart';
export 'src/twitter_client_base.dart';

// TODO: Export any libraries intended for clients of this package.

class TwitterClient {
  late String bearer_token;
  late String consumer_key;
  late String consumer_secret;
  late String access_token;
  late String access_token_secret;
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

  invoke({
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
  }

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

  Future<Map> sendMessage({ 
    int chat_id = 0,
    required String text,
    String? bearerToken,
    String? consumerKey,
    String? consumerSecret,
    String? accessToken,
    String? accessTokenSecret,
  }) async{
    twtter_api.TwitterApi twitter_client = client(
      bearerToken: bearerToken,
      consumerKey: consumerKey,
      consumerSecret: consumerSecret,
      accessToken: accessToken,
      accessTokenSecret: accessTokenSecret,
    );
    return (await twitter_client.tweets.createTweet(text: text)).toJson();
  }

}
