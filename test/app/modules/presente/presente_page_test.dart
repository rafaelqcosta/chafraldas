import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular_test.dart';

import '../../../../lib/app/modules/presente/presente_page.dart';

main() {
  testWidgets('PresentePage has title', (WidgetTester tester) async {
    await tester
        .pumpWidget(buildTestableWidget(PresentePage(title: 'Presente')));
    final titleFinder = find.text('Presente');
    expect(titleFinder, findsOneWidget);
  });
}
