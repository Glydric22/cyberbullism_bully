// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:cyberbullism_bully/Model/connect_db/web_socket/user.dart';
import 'package:cyberbullism_bully/Model/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:cyberbullism_bully/main.dart';

void main() {
  // testWidgets('Test Widget Example (Not Working)', (WidgetTester tester) async {
  //   // Build our app and trigger a frame.
  //   await tester.pumpWidget(const MainApp());

  //   // Verify that our counter starts at 0.
  //   expect(find.text('0'), findsOneWidget);
  //   expect(find.text('1'), findsNothing);

  //   // Tap the '+' icon and trigger a frame.
  //   await tester.tap(find.byIcon(Icons.add));
  //   await tester.pump();

  //   // Verify that our counter has incremented.
  //   expect(find.text('0'), findsNothing);
  //   expect(find.text('1'), findsOneWidget);
  // });
  // testWidgets('Stream', (WidgetTester tester) async {
  //   final ws = UserWS(
  //     User("l", "1", "l@1.it", "it"),
  //     "p@1.it",
  //   );
  //   // Build our app and trigger a frame.
  //   await tester.pumpWidget(StreamBuilder(
  //     stream: ws.channel.stream,
  //     builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) =>
  //         Text(snapshot.hasData ? '${snapshot.data}' : ''),
  //   ));
  // });
}
