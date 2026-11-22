import 'package:flutter_test/flutter_test.dart';
import 'package:data_table_lab/main.dart';

void main() {
  testWidgets('DataTable displays car records', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Car Inventory'), findsOneWidget);

    expect(find.text('Car Make'), findsOneWidget);
    expect(find.text('Model'), findsOneWidget);
    expect(find.text('Price'), findsOneWidget);

    expect(find.text('Honda'), findsOneWidget);
    expect(find.text('Toyota'), findsOneWidget);
    expect(find.text('BMW'), findsOneWidget);

    expect(find.text('2021'), findsOneWidget);
    expect(find.text('2011'), findsOneWidget);
    expect(find.text('2010'), findsOneWidget);

    expect(find.text('35000'), findsOneWidget);
    expect(find.text('6000'), findsOneWidget);
    expect(find.text('9000'), findsOneWidget);
  });
}