import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SimpleForm(),
    );
  }
}

class SimpleForm extends StatefulWidget {
  const SimpleForm({super.key});

  @override
  State<SimpleForm> createState() => _SimpleFormState();
}

class _SimpleFormState extends State<SimpleForm> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passController = TextEditingController();
  final confirmPassController = TextEditingController();

  String? nameError;
  String? emailError;
  String? passError;
  String? confirmError;

  // Simple Email Validator using RegEx
  bool isValidEmail(String email) {
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
  }

  void validateFields() {
    setState(() {
      nameError = nameController.text.isEmpty ? "Enter your name" : null;
      emailError = isValidEmail(emailController.text)
          ? null
          : "Enter valid email";
      passError = passController.text.length < 6
          ? "Password too short"
          : null;
      confirmError = confirmPassController.text != passController.text
          ? "Passwords do not match"
          : null;
    });
  }

  void submitForm() {
    validateFields();
    if (nameError == null &&
        emailError == null &&
        passError == null &&
        confirmError == null) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Registration Successful!")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Registration Form")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: "Name",
                errorText: nameError,
              ),
              onChanged: (_) => validateFields(),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: "Email",
                errorText: emailError,
              ),
              onChanged: (_) => validateFields(),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: passController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Password",
                errorText: passError,
              ),
              onChanged: (_) => validateFields(),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: confirmPassController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Confirm Password",
                errorText: confirmError,
              ),
              onChanged: (_) => validateFields(),
            ),
            const SizedBox(height: 25),
            ElevatedButton(
              onPressed: submitForm,
              child: const Text("Register"),
            ),
          ],
        ),
      ),
    );
  }
}
