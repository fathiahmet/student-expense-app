import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){
  testWidgets(
    "login screen renders correctly",
    (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home:LoginPage(),
        ),
      );

      expect(find.text('login'), findsoneWidget);

      expect(find.byType(TextFormField), findsoneWidgets);

      expect(find.byType(ElevatedButton), findsoneWidgets);
    },
  );
}
