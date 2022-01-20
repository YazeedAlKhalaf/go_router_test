import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/src/inherited_go_router.dart';
import 'package:go_router_test/cart/cart_screen.dart';
import 'package:go_router_test/home/home_screen.dart';
import 'package:mocktail/mocktail.dart';

import '../mocks.dart';

void main() {
  late MockGoRouter _mockGoRouter;

  setUp(() {
    _mockGoRouter = MockGoRouter();
  });

  tearDown(() {
    verifyNoMoreInteractions(_mockGoRouter);
  });

  Widget _buildTestWidget() {
    return MaterialApp(
      home: const HomeScreen(),
      builder: (BuildContext context, Widget? child) {
        return InheritedGoRouter(
          goRouter: _mockGoRouter,
          child: child!,
        );
      },
    );
  }

  group(
    "HomeScreen |",
    () {
      testWidgets(
        "should render correctly.",
        (WidgetTester tester) async {
          await tester.pumpWidget(_buildTestWidget());
          await tester.pumpAndSettle();

          expect(find.byType(HomeScreen), findsOneWidget);
        },
      );

      testWidgets(
        "should navigate to CartScreen "
        "when go to cart screen button is clicked.",
        (WidgetTester tester) async {
          await tester.pumpWidget(_buildTestWidget());
          await tester.pumpAndSettle();

          final Finder goToCardScreenButtonFinder = find.byKey(
            HomeScreen.goToCartScreenButtonKey,
          );
          expect(goToCardScreenButtonFinder, findsOneWidget);

          await tester.tap(goToCardScreenButtonFinder);
          await tester.pump();

          verify(() => _mockGoRouter.pushNamed(CartScreen.name)).called(1);
        },
      );
    },
  );
}
