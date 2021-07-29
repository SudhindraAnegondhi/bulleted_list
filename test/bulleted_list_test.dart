import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:bulleted_list/bulleted_list.dart';

void main() {
  testWidgets('Widget has a list item', (WidgetTester tester) async {
    await tester.pumpWidget(const MyWidget());
    final itemFinder = find.text('item');
    expect(itemFinder, findsOneWidget);
  });
}

class MyWidget extends StatelessWidget {
  const MyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: _MyWidget());
  }
}

class _MyWidget extends StatelessWidget {
  const _MyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 100,
        child: BulletedList(listItems: ['item']),
      ),
    );
  }
}
