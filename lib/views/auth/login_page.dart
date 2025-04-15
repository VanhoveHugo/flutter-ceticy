import 'package:ceticy/core/app_asset.dart';
import 'package:ceticy/generated/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ceticy/providers/auth_provider.dart';
import 'package:ceticy/core/widgets/buttons/primary_button.dart';
import 'package:ceticy/core/widgets/buttons/secondary_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _passwordObscure = true;
  bool _isLoading = false;
  String? _errorMessage;

  void _submit(String selectedScope) async {
    if (_isLoading) return;

    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    if (!_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = false;
      });
      return;
    }

    try {
      final authProvider = Provider.of<AuthProvider>(context, listen: false);
      authProvider.login(context, _emailController.text,
          _passwordController.text, selectedScope);
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    return Consumer<AuthProvider>(
      builder: (context, authProvider, _) {
        return Scaffold(
            body: SafeArea(
                child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: _isLoading
                ? const Center(child: CircularProgressIndicator())
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(
                        image: AssetImage(AppAsset.logo(context)),
                        height: 100,
                      ),
                      if (_errorMessage != null)
                        Text(
                          _errorMessage!,
                          style: const TextStyle(color: Colors.red),
                        ),
                      Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 20),
                            TextFormField(
                              controller: _emailController,
                              keyboardType: TextInputType.emailAddress,
                              decoration:
                                  InputDecoration(labelText: localizations.email),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return localizations.pleaseEnterEmail;
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 20),
                            TextFormField(
                              controller: _passwordController,
                              obscureText: _passwordObscure,
                              decoration: InputDecoration(
                                labelText: localizations.password,
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    _passwordObscure
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _passwordObscure = !_passwordObscure;
                                    });
                                  },
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return localizations.pleaseEnterPassword;
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 20),
                            Text(
                              authProvider.errorMessage,
                              style: const TextStyle(color: Colors.red),
                            ),
                            const SizedBox(height: 40),
                            PrimaryButton(
                              label: localizations.login,
                              onPressed: () => _submit('user'),
                            ),
                            const SizedBox(height: 20),
                            SecondaryButton(
                              label: localizations.iAmRestaurant,
                              onPressed: () {
                                Navigator.pushNamed(
                                    context, '/onboarding/manager');
                              },
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextButton(
                        onPressed: () {
                          authProvider.resetErrorMessage();
                          Navigator.pushNamed(context, '/register');
                        },
                        child: Text(localizations.noAccount),
                      ),
                    ],
                  ),
          ),
        )));
      },
    );
  }
}
