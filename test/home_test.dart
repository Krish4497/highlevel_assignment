import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:highlevel_assignment/models/favorites.dart';
import 'package:highlevel_assignment/screens/home.dart';
import 'package:provider/provider.dart';


Widget createHomeScreen() => ChangeNotifierProvider<Favorites>(
      create: (context) => Favorites(),
      child: const MaterialApp(
        home: HomePage(),
      ),
    );

void main() {
group('Home Page Widget Tests', () {

  // BEGINNING OF NEW CONTENT
testWidgets('Testing IconButtons', (tester) async {
  await tester.pumpWidget(createHomeScreen());
  expect(find.byIcon(Icons.favorite), findsNothing);
  await tester.tap(find.byIcon(Icons.favorite_border).first);
  await tester.pumpAndSettle(const Duration(seconds: 1));
  expect(find.text('Added to favorites.'), findsOneWidget);
  expect(find.byIcon(Icons.favorite), findsWidgets);
  await tester.tap(find.byIcon(Icons.favorite).first);
  await tester.pumpAndSettle(const Duration(seconds: 1));
  expect(find.text('Removed from favorites.'), findsOneWidget);
  expect(find.byIcon(Icons.favorite), findsNothing);
});                                                
  // END OF NEW CONTENT

    testWidgets('Testing Scrolling', (tester) async {
      await tester.pumpWidget(createHomeScreen());
      expect(find.text('Item 0'), findsOneWidget);
      await tester.fling(
        find.byType(ListView),
        const Offset(0, -200),
        3000,
      );
      await tester.pumpAndSettle();
      expect(find.text('Item 0'), findsNothing);
    });
});
}