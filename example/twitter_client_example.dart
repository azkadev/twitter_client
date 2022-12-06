// Copyright 2022 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

import 'dart:async';
import 'dart:io';

import 'package:twitter_client/twitter_client.dart';

Future<void> main() async {
  TwitterClient twitterClient = TwitterClient( 
  );

  try {
    var message = """
Hallow Dengan Lpm RolePlayer | LPM RP Disini

Test Auto Post

#lpmroleplayer #lpm #lpmrp #roleplayer #roleplayerindonesia #Roleplayerent #lpmpromote #bts #blackpink #RedVelvet #NCT127
""";
    message += "\n${DateTime.now().millisecondsSinceEpoch}";
    var res = await twitterClient.client().tweets.createTweet(
          text: message,
        );
    print(res);
  } catch (e, stack) {
    print(e);
  }
}
