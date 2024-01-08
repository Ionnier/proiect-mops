import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:front/data/desk_repository.dart';
import 'package:front/data/settings.dart';
import 'package:front/ui/dashboard/dashboard_screen.dart';
import 'package:front/ui/desk_screen/desk_screen.dart';
import 'package:front/ui/desk_screen/desk_screen_item.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';

import '../utils.dart';
import 'desk_screen_test.mocks.dart';

@GenerateMocks([Settings, BaseCacheManager])
void main() async {
  var mockedSettings = MockSettings();
  final (dio, dioAdapter) = testDio();
  when(mockedSettings.provideDio()).thenReturn(dio);
  when(mockedSettings.getFavoritedIds()).thenReturn([]);
  final json = await getMappingData("desks/getAll.json");
  dioAdapter.onGet("/desks", (request) async {
    request.reply(200, json, headers: {
      "Content-Type": ["application/json"]
    });
  });
  var deskRepository = DeskRepository(mockedSettings);

  Future<void> pumpScreen(WidgetTester tester) async {
    await tester.pumpWidget(MultiProvider(
      providers: [
        Provider<Settings>(create: (context) => mockedSettings),
        Provider<DeskRepository>(create: (context) => deskRepository),
        Provider<BaseCacheManager>(
          create: (context) => (MockBaseCacheManager()),
        )
      ],
      child: const MaterialApp(
        home: DeskScreen(),
      ),
    ));
    await tester.pumpAndSettle();
  }

  testWidgets('Dashboard screen has texts', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: DashboardScreen(),
    ));
    expect(find.text("Desks"), findsOne);
    expect(find.text("See desks"), findsOne);
  });

  testWidgets('Desks text moves to DeskScreen', (WidgetTester tester) async {
    await tester.pumpWidget(MultiProvider(
        providers: [
          Provider<Settings>(create: (context) => mockedSettings),
          Provider<DeskRepository>(create: (context) => deskRepository),
          Provider<BaseCacheManager>(
            create: (context) => (MockBaseCacheManager()),
          )
        ],
        child: const MaterialApp(
          home: DashboardScreen(),
        )));
    await tester.pumpAndSettle();
    await tester.tap(find.text("Desks"));
    await tester.pumpAndSettle();
    expect(find.byType(DeskScreen), findsOne);
  });

  testWidgets('Desks screen has required elements',
      (WidgetTester tester) async {
    await pumpScreen(tester);
    expect(find.byType(AppBar), findsOne);
    expect(find.byType(DeskListItem), findsAtLeast(3));
    expect(find.byType(CachedNetworkImage), findsAtLeast(3));
  });
}
