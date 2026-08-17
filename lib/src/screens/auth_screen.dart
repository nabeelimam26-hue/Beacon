import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../auth/auth_providers.dart';
import '../design/beacon_tokens.dart';
import '../widgets/beacon_logo.dart';

class AuthScreen extends ConsumerStatefulWidget {
  const AuthScreen({super.key});
  @override
  ConsumerState<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends ConsumerState<AuthScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _displayNameController = TextEditingController();
  bool _signingUp = false, _submitting = false;
  String? _error;
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _displayNameController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!(_formKey.currentState?.validate() ?? false)) return;
    setState(() {
      _submitting = true;
      _error = null;
    });
    try {
      final repository = ref.read(authRepositoryProvider);
      if (_signingUp) {
        await repository.signUp(
          email: _emailController.text.trim(),
          password: _passwordController.text,
          displayName: _displayNameController.text.trim(),
        );
      } else {
        await repository.signIn(
          email: _emailController.text.trim(),
          password: _passwordController.text,
        );
      }
    } catch (error) {
      if (mounted) setState(() => _error = friendlyAuthError(error));
    } finally {
      if (mounted) setState(() => _submitting = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) => SingleChildScrollView(
            padding: const EdgeInsets.all(BeaconSpacing.x4),
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 420),
                  child: Card(
                    elevation: 0,
                    color: palette.bgSurface,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(BeaconRadii.lg),
                      side: BorderSide(color: palette.borderHairline),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(BeaconSpacing.x8),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const BeaconLogo(),
                          const SizedBox(height: BeaconSpacing.x8),
                          Text(
                            _signingUp
                                ? 'Create your account'
                                : 'Welcome to Beacon',
                            style: Theme.of(context).textTheme.displaySmall,
                          ),
                          const SizedBox(height: BeaconSpacing.x2),
                          Text(
                            _signingUp
                                ? 'Join a calmer place for study conversations.'
                                : 'Sign in to continue your study conversations.',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                          const SizedBox(height: BeaconSpacing.x6),
                          Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                if (_signingUp) ...[
                                  TextFormField(
                                    controller: _displayNameController,
                                    textInputAction: TextInputAction.next,
                                    decoration: const InputDecoration(
                                      labelText: 'Display name',
                                    ),
                                    validator: (value) =>
                                        value == null || value.trim().isEmpty
                                        ? 'Enter a display name.'
                                        : null,
                                  ),
                                  const SizedBox(height: BeaconSpacing.x3),
                                ],
                                TextFormField(
                                  controller: _emailController,
                                  keyboardType: TextInputType.emailAddress,
                                  autofillHints: const [AutofillHints.email],
                                  textInputAction: TextInputAction.next,
                                  decoration: const InputDecoration(
                                    labelText: 'Email address',
                                  ),
                                  validator: (value) =>
                                      value == null ||
                                          !RegExp(
                                            r'^[^@\s]+@[^@\s]+\.[^@\s]+$',
                                          ).hasMatch(value.trim())
                                      ? 'Enter a valid email address.'
                                      : null,
                                ),
                                const SizedBox(height: BeaconSpacing.x3),
                                TextFormField(
                                  controller: _passwordController,
                                  obscureText: true,
                                  autofillHints: [
                                    _signingUp
                                        ? AutofillHints.newPassword
                                        : AutofillHints.password,
                                  ],
                                  onFieldSubmitted: (_) => _submit(),
                                  decoration: const InputDecoration(
                                    labelText: 'Password',
                                  ),
                                  validator: (value) =>
                                      value == null || value.length < 8
                                      ? 'Use at least 8 characters.'
                                      : null,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: BeaconSpacing.x5),
                          if (_error != null) ...[
                            Text(
                              _error!,
                              style: Theme.of(context).textTheme.bodySmall
                                  ?.copyWith(color: palette.error),
                            ),
                            const SizedBox(height: BeaconSpacing.x3),
                          ],
                          FilledButton(
                            onPressed: _submitting ? null : _submit,
                            child: _submitting
                                ? const SizedBox(
                                    width: 18,
                                    height: 18,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                    ),
                                  )
                                : Text(
                                    _signingUp ? 'Create account' : 'Sign in',
                                  ),
                          ),
                          const SizedBox(height: BeaconSpacing.x3),
                          TextButton(
                            onPressed: _submitting
                                ? null
                                : () => setState(() {
                                    _signingUp = !_signingUp;
                                    _error = null;
                                  }),
                            child: Text(
                              _signingUp
                                  ? 'Already have an account? Sign in'
                                  : 'Create an account',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
