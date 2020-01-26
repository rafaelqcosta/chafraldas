import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular_test.dart';

import '../../../../lib/app/modules/obrigado/obrigado_page.dart';

main() {
  testWidgets('ObrigadoPage has title', (WidgetTester tester) async {
    await tester
        .pumpWidget(buildTestableWidget(ObrigadoPage(title: 'Obrigado')));
    final titleFinder = find.text('Obrigado');
    expect(titleFinder, findsOneWidget);
  });
}
