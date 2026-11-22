import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:bottom_navigator_bar_lab/main.dart';

void main() {
  testWidgets('Bottom navigation displays Home initially', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      ChangeNotifierProvider(create: (_) => TabModel(), child: const MainApp()),
    );

    expect(find.text('Home'), findsNWidgets(2));
    expect(find.text('Alarm'), findsOneWidget);
    expect(find.text('Business'), findsOneWidget);
    expect(find.text('School'), findsOneWidget);
  });
}
