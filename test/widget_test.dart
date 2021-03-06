import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:redpanda/main.dart';
import 'package:redpanda_light_client/export.dart';

void main() {


  setUpAll(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    // expose path_provider
    const MethodChannel channel = MethodChannel('plugins.flutter.io/path_provider');
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return ".";
    });
  });

  testWidgets('Test Channels from DB present', (WidgetTester tester) async {
    //path framework not available on linux or windows, use default test folder
    // this is ./test/ db file will be created there from the lib
    Directory current = Directory.current;
    print(current.path);
    String dataFolderPath = "";
//    await RedPandaLightClient.init(dataFolderPath, 5002);
    //todo we need to generate mock data for the tests...

    await tester.pumpWidget(MyApp());

//    await tester.pumpAndSettle(const Duration(seconds: 1));
    //frame trigger necessary for db to display data
    await tester.pump();

//    expect(find.byIcon(Icons.account_circle), findsWidgets);

//    await RedPandaLightClient.shutdown();
  });
}
