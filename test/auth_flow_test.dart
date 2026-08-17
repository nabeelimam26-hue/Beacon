import 'package:beacon/main.dart';
import 'package:beacon/src/auth/auth_models.dart';
import 'package:beacon/src/auth/auth_providers.dart';
import 'package:beacon/src/auth/auth_repository.dart';
import 'package:beacon/src/routing/beacon_routes.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Future<void> pumpApp(
    WidgetTester tester,
    FakeAuthRepository repository,
  ) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [authRepositoryProvider.overrideWithValue(repository)],
        child: const BeaconApp(),
      ),
    );
    await tester.pumpAndSettle();
  }

  testWidgets('restores a valid session to Home', (tester) async {
    final fake = FakeAuthRepository(
      initialSession: AuthSession(
        user: const AuthUser(id: 'a', email: 'a@beacon.test'),
        expiresAt: DateTime.now().add(const Duration(hours: 1)),
      ),
    );
    await pumpApp(tester, fake);
    expect(find.text('Conversations'), findsOneWidget);
    expect(find.text('Welcome to Beacon'), findsNothing);
    await fake.dispose();
  });

  testWidgets('routes an absent session to Login', (tester) async {
    final fake = FakeAuthRepository();
    await pumpApp(tester, fake);
    expect(find.text('Welcome to Beacon'), findsOneWidget);
    await fake.dispose();
  });

  testWidgets('signs in successfully', (tester) async {
    final fake = FakeAuthRepository();
    await pumpApp(tester, fake);
    await tester.enterText(
      find.byType(TextFormField).at(0),
      'student@beacon.test',
    );
    await tester.enterText(find.byType(TextFormField).at(1), 'password1');
    await tester.tap(find.text('Sign in'));
    await tester.pumpAndSettle();
    expect(find.text('Welcome to Beacon'), findsNothing);
    await fake.dispose();
  });

  testWidgets('shows invalid-credentials inline', (tester) async {
    final fake = FakeAuthRepository(invalidCredentials: true);
    await pumpApp(tester, fake);
    await tester.enterText(
      find.byType(TextFormField).at(0),
      'student@beacon.test',
    );
    await tester.enterText(find.byType(TextFormField).at(1), 'password1');
    await tester.tap(find.text('Sign in'));
    await tester.pumpAndSettle();
    expect(find.text('That email or password is incorrect.'), findsOneWidget);
    await fake.dispose();
  });

  testWidgets('signs up successfully and shows duplicate-email inline', (
    tester,
  ) async {
    final fake = FakeAuthRepository(emailAlreadyRegistered: true);
    await pumpApp(tester, fake);
    await tester.tap(find.text('Create an account'));
    await tester.enterText(find.byType(TextFormField).at(0), 'Student');
    await tester.enterText(
      find.byType(TextFormField).at(1),
      'student@beacon.test',
    );
    await tester.enterText(find.byType(TextFormField).at(2), 'password1');
    await tester.tap(find.text('Create account'));
    await tester.pumpAndSettle();
    expect(
      find.text('An account already exists for that email.'),
      findsOneWidget,
    );
    await fake.dispose();
  });

  testWidgets('logout clears the session and returns to Login', (tester) async {
    final fake = FakeAuthRepository(
      initialSession: AuthSession(
        user: const AuthUser(id: 'a', email: 'a@beacon.test'),
        expiresAt: DateTime.now().add(const Duration(hours: 1)),
      ),
    );
    await pumpApp(tester, fake);
    await fake.signOut();
    await tester.pumpAndSettle();
    expect(fake.sessionCleared, isTrue);
    expect(find.text('Welcome to Beacon'), findsOneWidget);
    await fake.dispose();
  });

  test('router maps authenticated and unauthenticated states', () {
    expect(
      BeaconRouter.destinationFor(
        const Authenticated(AuthUser(id: 'a', email: 'a@beacon.test')),
      ),
      BeaconRoutes.home,
    );
    expect(
      BeaconRouter.destinationFor(const Unauthenticated()),
      BeaconRoutes.auth,
    );
  });
  testWidgets('signs up successfully', (tester) async {
    final fake = FakeAuthRepository();
    await pumpApp(tester, fake);
    await tester.tap(find.text('Create an account'));
    await tester.enterText(find.byType(TextFormField).at(0), 'Student');
    await tester.enterText(
      find.byType(TextFormField).at(1),
      'student@beacon.test',
    );
    await tester.enterText(find.byType(TextFormField).at(2), 'password1');
    await tester.tap(find.text('Create account'));
    await tester.pumpAndSettle();
    expect(find.text('Create your account'), findsNothing);
    await fake.dispose();
  });
}
