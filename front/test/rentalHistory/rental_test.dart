import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:front/data/books_repository.dart';
import 'package:front/data/rental_repository.dart';
import 'package:front/data/settings.dart';
import 'package:front/models/rentedbook.dart';
import 'package:front/ui/dashboard/dashboard_screen.dart';
import 'package:front/ui/rental_history/rental_history_item.dart';
import 'package:front/ui/rental_history/rental_history_screen.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';

import '../utils.dart';
import 'rental_test.mocks.dart';

@GenerateMocks([Settings])
void main() async {
  var mockedSettings = MockSettings();
  final (dio, dioAdapter) = testDio();
  when(mockedSettings.provideDio()).thenReturn(dio);
  testWidgets('Dashboard screen has Rental History text',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: DashboardScreen(),
    ));
    await tester.pumpAndSettle();
    expect(find.text("Rental History"), findsOne);
    expect(find.text("See rental history"), findsOne);
    expect(find.byWidgetPredicate((widget) {
      if (widget is Icon) {
        if ((widget).icon == Icons.calendar_month) {
          return true;
        }
      }
      return false;
    }), findsOne);
  });

  testWidgets('Tapping Rental History goes to Rental History Screen',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: DashboardScreen(),
    ));
    await tester.pumpAndSettle();
    await tester.tap(find.text("Rental History"));
    await tester.pumpAndSettle();
    expect(find.byWidgetPredicate((widget) {
      if (widget is RentalHistoryScreen) {
        return true;
      }
      return false;
    }), findsOne);
  });

  Future<void> pumpScreen(WidgetTester tester) async {
    await tester.pumpWidget(Provider<RentalRepository>(
      create: (context) => RentalRepository(mockedSettings),
      child: const MaterialApp(
        home: RentalHistoryScreen(),
      ),
    ));
  }

  testWidgets('Test Rental Screen no results ', (WidgetTester tester) async {
    dioAdapter.onGet("/rentals", (server) {
      server.reply(200, "[]");
    });
    await pumpScreen(tester);
    await tester.pumpAndSettle();
    expect(find.byType(AppBar), findsOne);
    expect(find.text("Rental History"), findsOne);
  });

  testWidgets('Test Rental Screen error ', (WidgetTester tester) async {
    dioAdapter.onGet("/rentals", (server) {
      server.reply(200, "sdgsdgds");
    });
    await pumpScreen(tester);
    await tester.pumpAndSettle();
    expect(find.byWidgetPredicate((widget) {
      if (widget is Text) {
        return widget.data?.toLowerCase().contains("error") == true;
      }
      return false;
    }), findsOne);
  });

  final json = await getMappingData("rentals/getAll.json");

  testWidgets('Test Rental Screen some elements ', (WidgetTester tester) async {
    dioAdapter.onGet("/rentals", (server) {
      server.reply(200, json, headers: {
        "Content-Type": ["application/json"]
      });
    });
    await pumpScreen(tester);
    await tester.pumpAndSettle();
    expect(find.byType(RentalHistoryItem), findsOne);
    expect(find.text("Harry Potter and the Sorcerer's Stone - J.K. Rowling"),
        findsOne);
    expect(find.text("AWAITING_PICK_UP"), findsOne);
    expect(find.byWidgetPredicate((widget) {
      if (widget is Text) {
        if (widget.data != null) {
          return widget.data!.contains("2024");
        }
      }
      return false;
    }), findsOne);
  });
}
