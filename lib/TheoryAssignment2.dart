import 'package:flutter/material.dart';

void main() {
  runApp(const RegistrationApp());
}

class RegistrationApp extends StatelessWidget {
  const RegistrationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Responsive Registration Form',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: const RegistrationForm(),
    );
  }
}

class RegistrationForm extends StatefulWidget {
  const RegistrationForm({super.key});

  @override
  State<RegistrationForm> createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  final _formKey = GlobalKey<FormState>();

  // Controllers
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  // Real-time validation variables
  String? _nameError;
  String? _emailError;
  String? _passwordError;
  String? _confirmPasswordError;

  // Validation logic
  void _validateName(String value) {
    setState(() {
      _nameError = value.trim().isEmpty ? 'Name cannot be empty' : null;
    });
  }

  void _validateEmail(String value) {
    setState(() {
      final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
      _emailError = emailRegex.hasMatch(value.trim())
          ? null
          : 'Enter a valid email address';
    });
  }

  void _validatePassword(String value) {
    setState(() {
      if (value.length < 6) {
        _passwordError = 'Password must be at least 6 characters';
      } else {
        _passwordError = null;
      }
    });
  }

  void _validateConfirmPassword(String value) {
    setState(() {
      _confirmPasswordError =
      value != _passwordController.text ? 'Passwords do not match' : null;
    });
  }

  void _submitForm() {
    if (_nameError == null &&
        _emailError == null &&
        _passwordError == null &&
        _confirmPasswordError == null &&
        _nameController.text.isNotEmpty &&
        _emailController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty &&
        _confirmPasswordController.text.isNotEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Registration Successful!')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please correct the errors before submitting')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.of(context).size.width > 600;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Registration Form'),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 500),
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                const SizedBox(height: 10),
                Text(
                  'Create Your Account',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: isWide ? 28 : 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 30),

                // Name
                TextField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    labelText: 'Name',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: _nameError == null ? Colors.grey : Colors.red,
                      ),
                    ),
                    errorText: _nameError,
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: _nameError == null ? Colors.teal : Colors.red,
                      ),
                    ),
                  ),
                  onChanged: _validateName,
                ),
                const SizedBox(height: 20),

                // Email
                TextField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: _emailError == null ? Colors.grey : Colors.red,
                      ),
                    ),
                    errorText: _emailError,
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: _emailError == null ? Colors.teal : Colors.red,
                      ),
                    ),
                  ),
                  onChanged: _validateEmail,
                ),
                const SizedBox(height: 20),

                // Password
                TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: _passwordError == null ? Colors.grey : Colors.red,
                      ),
                    ),
                    errorText: _passwordError,
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: _passwordError == null ? Colors.teal : Colors.red,
                      ),
                    ),
                  ),
                  onChanged: _validatePassword,
                ),
                const SizedBox(height: 20),

                // Confirm Password
                TextField(
                  controller: _confirmPasswordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Confirm Password',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: _confirmPasswordError == null ? Colors.grey : Colors.red,
                      ),
                    ),
                    errorText: _confirmPasswordError,
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: _confirmPasswordError == null ? Colors.teal : Colors.red,
                      ),
                    ),
                  ),
                  onChanged: _validateConfirmPassword,
                ),
                const SizedBox(height: 30),

                // Submit Button
                ElevatedButton(
                  onPressed: _submitForm,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    backgroundColor: Colors.teal,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    'Register',
                    style: TextStyle(fontSize: 18, color: Colors.white),
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
