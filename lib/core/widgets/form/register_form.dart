import 'package:ceticy/core/widgets/buttons/primary_button.dart';
import 'package:ceticy/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterForm extends StatefulWidget {
  final Function(String, String) onSubmit;

  const RegisterForm({Key? key, required this.onSubmit}) : super(key: key);

  @override
  RegisterFormState createState() => RegisterFormState();
}

class RegisterFormState extends State<RegisterForm> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void _submit() {
    if (_formKey.currentState?.validate() ?? false) {
      widget.onSubmit(
        _emailController.text,
        _passwordController.text,
      );
    }

    AuthProvider authProvider =
        Provider.of<AuthProvider>(context, listen: false);
    authProvider.register(_emailController.text, _passwordController.text, 'user');
    Navigator.pushReplacementNamed(context, '/login');
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: _nameController,
            decoration: const InputDecoration(labelText: 'Pseudo'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Veuillez entrer un pseudo';
              }
              return null;
            },
          ),
          const SizedBox(height: 20),
          TextFormField(
            controller: _emailController,
            decoration: const InputDecoration(labelText: 'Email'),
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
            decoration: const InputDecoration(labelText: 'Mot de passe'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Veuillez entrer un mot de passe';
              }
              return null;
            },
          ),
          const SizedBox(height: 20),
          TextFormField(
            controller: _confirmPasswordController,
            obscureText: true,
            decoration:
                const InputDecoration(labelText: 'Confirmer le mot de passe'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Veuillez confirmer le mot de passe';
              }
              if (value != _passwordController.text) {
                return 'Veuillez confirmer le mot de passe';
              }
              return null;
            },
          ),
          const SizedBox(height: 60),
          PrimaryButton(
            onPressed: _submit,
            label: 'Je m\'inscris',
          ),
        ],
      ),
    );
  }
}
