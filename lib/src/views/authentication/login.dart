import 'package:flutter/material.dart';
import 'package:ceticy/core/style.dart';
import 'package:ceticy/src/views/widgets/input.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  double screenWidth = 100;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _loading = false;

  Future<void> _handleButtonPress(BuildContext context) async {
    FocusScope.of(context).unfocus();
    setState(() {
      _loading = true;
    });
    if (_formKey.currentState!.validate()) {
      if (_emailController.text.isNotEmpty &&
          _passwordController.text.isNotEmpty) {
        Navigator.pushReplacementNamed(context, '/home');
      }
    }
    setState(() {
      _loading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      screenWidth = MediaQuery.of(context).size.width;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(
                  height: 40,
                ),
                const Center(
                  child: Image(
                    image: AssetImage('assets/images/logo.png'),
                    width: 150,
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                const Text(
                  'Crée ton compte',
                  style: appTextPrimaryColor,
                ),
                const Text(
                  'dès maintenant !',
                  style: appTextPrimary,
                ),
                const SizedBox(
                  height: 24,
                ),
                AppInput(
                  controller: _emailController,
                  icon: Icons.email,
                  hint: 'Email',
                ),
                const SizedBox(
                  height: 24,
                ),
                AppInput(
                  controller: _passwordController,
                  icon: Icons.lock,
                  hint: 'Mot de passe',
                  obscureText: true,
                ),
                const SizedBox(
                  height: 24,
                ),
                const Spacer(),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: elevatedButtonPrimary,
                    onPressed: () {
                      _handleButtonPress(context);
                    },
                    child: _loading
                        ? const CircularProgressIndicator()
                        : const Text('Je suis un client'),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                    style: elevatedButtonSecondary,
                    onPressed: () {
                      _handleButtonPress(context);
                    },
                    child: _loading
                        ? const CircularProgressIndicator()
                        : const Text('Je suis un restaurateur'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
