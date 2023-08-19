import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_app/main.dart';

void main() {
  testWidgets('Test Localization', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp(supportedLocales: [Locale('en', 'US'), Locale('fr', 'FR')]));

    // Ensure the default language is English
    expect(find.text('Sign In'), findsOneWidget);

    // Tap the language change button to switch to French
    await tester.tap(find.byIcon(Icons.language));
    await tester.pumpAndSettle(); // Wait for animation to complete

    // Ensure the language has switched to French
    expect(find.text("Se connecter"), findsOneWidget);

    // Tap the language change button to switch back to English
    await tester.tap(find.byIcon(Icons.language));
    await tester.pumpAndSettle(); // Wait for animation to complete

    // Ensure the language has switched back to English
    expect(find.text('Sign In'), findsOneWidget);
  });
}
