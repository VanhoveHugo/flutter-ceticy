import 'package:ceticy/core/app_asset.dart';
import 'package:ceticy/core/widgets/buttons/primary_button.dart';
import 'package:ceticy/generated/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ceticy/providers/auth_provider.dart';

class RegisterManagerPage extends StatefulWidget {
  const RegisterManagerPage({super.key});

  @override
  RegisterManagerPageState createState() => RegisterManagerPageState();
}

class RegisterManagerPageState extends State<RegisterManagerPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _passwordObscure = true;
  final _confirmPasswordController = TextEditingController();
  bool _confirmPasswordObscure = true;
  final _formKey = GlobalKey<FormState>();

  Future<void> _submit() async {
    AuthProvider authProvider =
        Provider.of<AuthProvider>(context, listen: false);
    authProvider.resetErrorMessage();
    if (!_formKey.currentState!.validate()) {
      return;
    }

    authProvider.register(
        context, _emailController.text, _passwordController.text, 'user');
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
                child: Column(
                  children: [
                    Image(
                      image: AssetImage(AppAsset.logo(context)),
                      height: 100,
                    ),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            controller: _emailController,
                            decoration:
                                InputDecoration(labelText: localizations.email),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return localizations.pleaseEnterEmail;
                              }
                              // regex email
                              if (!RegExp(
                                      r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+')
                                  .hasMatch(value)) {
                                return localizations.invalidEmail;
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
                          TextFormField(
                            controller: _confirmPasswordController,
                            obscureText: _confirmPasswordObscure,
                            decoration: InputDecoration(
                              labelText: localizations.confirmPassword,
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _confirmPasswordObscure
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _confirmPasswordObscure =
                                        !_confirmPasswordObscure;
                                  });
                                },
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return localizations.pleaseConfirmPassword;
                              }
                              if (value != _passwordController.text) {
                                return localizations.passwordsDontMatch;
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
                          Text(localizations.manager),
                          const SizedBox(height: 8),
                          PrimaryButton(
                            onPressed: _submit,
                            label: localizations.register,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextButton(
                      child: Text(localizations.login),
                      onPressed: () {
                        authProvider.resetErrorMessage();
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
