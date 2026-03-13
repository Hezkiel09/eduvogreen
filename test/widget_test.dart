import 'package:flutter_test/flutter_test.dart';
import 'package:eduvogreen/main.dart';

void main() {
  testWidgets('App loads successfully', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp(initialRoute: '/login'));

    expect(find.byType(MyApp), findsOneWidget);
  });
}
