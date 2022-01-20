# go_router_test

This Flutter project shows how you can test the [go_router](https://pub.dev/packages/go_router) package.

The only depenedency you need is [mocktail](https://pub.dev/packages/mocktail) or [mockito](https://pub.dev/packages/mockito). Whichever will the job but I prefer [mocktail](https://pub.dev/packages/mocktail) since it does not require any code generation to function properly.

You can see the code in the `test/` directory.

The `GoRouter` mock is inside the `test/mocks.dart` file.

The example test is inside the `test/home/home_screen.dart`.

The gist of the method is to provide the mocked `GoRouter` in the widget tree and expect the same method you called in the screen.

For example, if you widget has this code:

```dart
GoRouter.of(context).pushNamed("my-named-router");
```

You will test it like this:

```dart
verify(() => _mockGoRouter.pushNamed("my-named-router")).called(1);
```
