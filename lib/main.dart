import 'package:flutter/material.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

import 'my_app.dart';

const apiKey = "nzp6tzckpabk";

const userToken =
    "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoiam9obiJ9.-d5U3zp42d2kiMeHtZILbI_AQ-9msYexRfQEG4rYdi4";

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //StreamChatClient
  final client = StreamChatClient(apiKey, logLevel: Level.INFO);

  // Current user
  await client.connectUser(User(id: "Paul"), userToken);

  // Get channel
  final channel = client.channel("messaging", id: "team");

  await channel.watch();

  runApp(MyApp(client: client, channel: channel));
}
