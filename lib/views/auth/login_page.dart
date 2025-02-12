import 'package:ceticy/core/app_asset.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ceticy/providers/auth_provider.dart';
import 'package:ceticy/core/widgets/buttons/primary_button.dart';
import 'package:ceticy/core/widgets/buttons/secondary_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;
  String? _errorMessage;

  void _submit(String selectedScope) async {
    if (_isLoading) return;

    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    final authProvider = Provider.of<AuthProvider>(context, listen: false);

    try {
      await authProvider.login(
          _emailController.text, _passwordController.text, selectedScope);

      if (authProvider.isAuthenticated && mounted) {
        Navigator.pushNamedAndRemoveUntil(
            context, '/', (Route<dynamic> route) => false);
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _errorMessage = 'Login failed, please try again.';
        });
      }
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
                          children: [
                            const SizedBox(height: 20),
                            TextFormField(
                              controller: _emailController,
                              decoration:
                                  const InputDecoration(labelText: 'Email'),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Veuillez entrer un email';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 20),
                            TextFormField(
                              controller: _passwordController,
                              obscureText: true,
                              decoration:
                                  const InputDecoration(labelText: 'Password'),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Veuillez entrer un mot de passe';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 100),
                            PrimaryButton(
                              label: 'Je me connecte',
                              onPressed: () => _submit('user'),
                            ),
                            const SizedBox(height: 20),
                            SecondaryButton(
                              label: 'Je suis restaurateur',
                              onPressed: () => _submit('manager'),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, '/register');
                        },
                        child: const Text('Je n\'ai pas de compte'),
                      ),
                    ],
                  ),
          ),
        )));
      },
    );
  }
}
