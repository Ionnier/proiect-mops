import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:front/data/desk_repository.dart';
import 'package:front/data/settings.dart';
import 'package:front/models/desk.dart';
import 'package:front/ui/desk_screen/desk_book_screen.dart';
import 'package:front/ui/desk_screen/desk_screen_item.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';

import '../utils.dart';
import 'rent_desk_test.mocks.dart';

@GenerateMocks([Settings, DefaultCacheManager])
void main() async {
  var mockedSettings = MockSettings();
  final (dio, dioAdapter) = testDio();
  when(mockedSettings.provideDio()).thenReturn(dio);
  when(mockedSettings.getFavoritedIds()).thenReturn([]);
  final json = await getMappingData("desks/getAll.json");
  final jsonOne = await getMappingData("desks/getOne.json");
  dioAdapter.onGet("/desks", (request) async {
    request.reply(200, json, headers: {
      "Content-Type": ["application/json"]
    });
  });
  dioAdapter.onGet("/desks/1", (request) async {
    request.reply(200, jsonOne, headers: {
      "Content-Type": ["application/json"]
    });
  });
  var deskRepository = DeskRepository(mockedSettings);
  var mockedDesk = const Desk(id: 1, location: "asd");
  var mockedCacheManager = MockDefaultCacheManager();
  when(mockedCacheManager.getImageFile('http://localhost:8080asd',
          key: null,
          headers: null,
          withProgress: true,
          maxHeight: null,
          maxWidth: null))
      .thenThrow(Exception("asd"));
  testWidgets('Desk item opens rent screen', (WidgetTester tester) async {
    await tester.pumpWidget(MultiProvider(
      providers: [
        Provider<DeskRepository>(create: (context) => deskRepository),
        Provider<Settings>(create: (context) => mockedSettings),
        Provider<BaseCacheManager>(
          create: (context) => (MockDefaultCacheManager()),
        )
      ],
      child: MaterialApp(
        home: Scaffold(
          body: DeskListItem(
            desk: mockedDesk,
            showImage: false,
          ),
        ),
      ),
    ));
    await tester.tap(find.text("Desk ${mockedDesk.id}"));
    await tester.pumpAndSettle();
    expect(
        find.byWidgetPredicate((widget) => widget is DeskBookScreen), findsOne);
  });

  testWidgets('Desk screen has items', (WidgetTester tester) async {
    await tester.pumpWidget(MultiProvider(
      providers: [
        Provider<DeskRepository>(create: (context) => deskRepository),
        Provider<Settings>(create: (context) => mockedSettings),
        Provider<BaseCacheManager>(
          create: (context) => (MockDefaultCacheManager()),
        )
      ],
      child: MaterialApp(
        home: Scaffold(
          body: DeskBookScreen(
            desk: mockedDesk,
            showImage: false,
          ),
        ),
      ),
    ));
    await tester.pumpAndSettle();
    expect(find.byType(FilterChip), findsExactly(12));
    expect(find.text(DateTime.now().toIso8601String().split("T")[0]),
        findsExactly(1));
    expect(find.byWidgetPredicate((widget) {
      if (widget is Icon) {
        if (widget.icon == Icons.arrow_back) {
          return true;
        }
        if (widget.icon == Icons.arrow_forward) {
          return true;
        }
      }
      return false;
    }), findsExactly(3));
  });

  testWidgets('Tapping forward moves day', (WidgetTester tester) async {
    await tester.pumpWidget(MultiProvider(
      providers: [
        Provider<DeskRepository>(create: (context) => deskRepository),
        Provider<Settings>(create: (context) => mockedSettings),
        Provider<BaseCacheManager>(
          create: (context) => (MockDefaultCacheManager()),
        )
      ],
      child: MaterialApp(
        home: Scaffold(
          body: DeskBookScreen(
            desk: mockedDesk,
            showImage: false,
          ),
        ),
      ),
    ));
    await tester.pumpAndSettle();
    await tester.tap(find.byWidgetPredicate((widget) {
      if (widget is Icon) {
        if (widget.icon == Icons.arrow_forward) {
          return true;
        }
      }
      return false;
    }));
    await tester.pumpAndSettle();
    expect(
        find.text(DateTime.now()
            .add(const Duration(days: 1))
            .toIso8601String()
            .split("T")[0]),
        findsExactly(1));
    await tester.tap(find.byWidgetPredicate((widget) {
      if (widget is Icon) {
        return widget.semanticLabel == "asd";
      }
      return false;
    }));
    await tester.pumpAndSettle();
    expect(find.text(DateTime.now().toIso8601String().split("T")[0]),
        findsExactly(1));
  });

  testWidgets('Tapping filter chip becomes red', (WidgetTester tester) async {
    await tester.pumpWidget(MultiProvider(
      providers: [
        Provider<DeskRepository>(create: (context) => deskRepository),
        Provider<Settings>(create: (context) => mockedSettings),
        Provider<BaseCacheManager>(
          create: (context) => (MockDefaultCacheManager()),
        )
      ],
      child: MaterialApp(
        home: Scaffold(
          body: DeskBookScreen(
            desk: mockedDesk,
            showImage: false,
          ),
        ),
      ),
    ));
    await tester.pumpAndSettle();
    await tester.tap(find.byWidgetPredicate((widget) {
      if (widget is Icon) {
        if (widget.icon == Icons.arrow_forward) {
          return true;
        }
      }
      return false;
    }));
    await tester.pumpAndSettle();
    await tester.tap(find.text("9 - 10"));
    await tester.pumpAndSettle();
    expect(find.byWidgetPredicate((widget) {
      if (widget is FilterChip) {
        return widget.selected;
      }
      return false;
    }), findsOne);
    expect(find.text("Book"), findsOne);
  });
}
