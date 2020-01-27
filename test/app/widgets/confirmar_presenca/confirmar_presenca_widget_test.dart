import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular_test.dart';

import 'package:site_babycha/app/widgets/confirmar_presenca/confirmar_presenca_widget.dart';

main() {
  testWidgets('ConfirmarPresencaWidget has message',
      (WidgetTester tester) async {
    await tester.pumpWidget(buildTestableWidget(ConfirmarPresencaWidget()));
    final textFinder = find.text('ConfirmarPresenca');
    expect(textFinder, findsOneWidget);
  });
}
