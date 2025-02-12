import 'package:ceticy/core/app_asset.dart';
import 'package:ceticy/core/widgets/form/register_form.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ceticy/providers/auth_provider.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  RegisterPageState createState() => RegisterPageState();
}

class RegisterPageState extends State<RegisterPage> {
  bool _isLoading = false;
  String? _errorMessage;

  @override
  Widget build(BuildContext context) {
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
                          RegisterForm(
                            onSubmit: (email, password) async {
                              setState(() {
                                _isLoading = true;
                                _errorMessage = null;
                              });
                              try {
                                // await authProvider.register(
                                //     email, password, 'user');
                                // if (authProvider.isAuthenticated) {
                                //   Navigator.pushReplacementNamed(context, '/');
                                // }
                              } catch (e) {
                                setState(() {
                                  _errorMessage =
                                      'Registration failed, please try again.';
                                });
                              } finally {
                                setState(() {
                                  _isLoading = false;
                                });
                              }
                            },
                          ),
                          const SizedBox(height: 20),
                          TextButton(
                            child: const Text('Se connecter'),
                            onPressed: () {
                              Navigator.pushReplacementNamed(context, '/login');
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
