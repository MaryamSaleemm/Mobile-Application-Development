// lib/main.dart
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() => runApp(const EmployeeApp());

class EmployeeApp extends StatelessWidget {
  const EmployeeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Employee Management',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: const HomeScreen(),
    );
  }
}

/// Employee model
class Employee {
  String name;
  String id;
  String email;
  String department;
  String gender;
  Uint8List? profilePic; // <-- works on web & mobile

  Employee({
    required this.name,
    required this.id,
    required this.email,
    required this.department,
    required this.gender,
    this.profilePic,
  });
}

Employee? employee; // global variable

/// ---------------- HOME SCREEN ----------------
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Employee Management')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // App Logo (safe loading)
              Image.asset(
                'assets/logo.png',
                width: 100,
                height: 100,
                errorBuilder: (context, error, stackTrace) =>
                const Icon(Icons.business, size: 80, color: Colors.indigo),
              ),
              const SizedBox(height: 10),
              const Text(
                'BlueOrbit Solutions',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 30),
              ElevatedButton.icon(
                icon: const Icon(Icons.person_add),
                label: const Text('Register Employee'),
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const RegisterScreen()),
                ),
              ),
              const SizedBox(height: 12),
              ElevatedButton.icon(
                icon: const Icon(Icons.person),
                label: const Text('View Profile'),
                onPressed: () {
                  if (employee == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("No employee registered yet.")),
                    );
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const ProfileScreen()),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// ---------------- REGISTER SCREEN ----------------
class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final picker = ImagePicker();

  final name = TextEditingController();
  final id = TextEditingController();
  final email = TextEditingController();
  String? dept;
  String? gender;
  Uint8List? imageBytes; // <-- store bytes

  final departments = ['HR', 'IT', 'Finance', 'Sales'];

  Future<void> pickImage() async {
    final XFile? picked = await picker.pickImage(source: ImageSource.gallery);
    if (picked != null) {
      final bytes = await picked.readAsBytes();
      setState(() => imageBytes = bytes);
    }
  }

  void submit() {
    if (!_formKey.currentState!.validate() || dept == null || gender == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please complete all required fields.")),
      );
      return;
    }

    employee = Employee(
      name: name.text.trim(),
      id: id.text.trim(),
      email: email.text.trim(),
      department: dept!,
      gender: gender!,
      profilePic: imageBytes,
    );

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const ProfileScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Register Employee')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(18),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              GestureDetector(
                onTap: pickImage,
                child: CircleAvatar(
                  radius: 40,
                  backgroundImage: imageBytes != null
                      ? MemoryImage(imageBytes!)
                      : null,
                  child: imageBytes == null
                      ? const Icon(Icons.camera_alt, size: 30)
                      : null,
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: name,
                decoration: const InputDecoration(labelText: 'Full Name *'),
                validator: (v) => v!.isEmpty ? 'Required' : null,
              ),
              TextFormField(
                controller: id,
                decoration: const InputDecoration(labelText: 'Employee ID *'),
                validator: (v) => v!.isEmpty ? 'Required' : null,
              ),
              TextFormField(
                controller: email,
                decoration: const InputDecoration(labelText: 'Email *'),
                validator: (v) => RegExp(r'^[^@]+@[^@]+\.[^@]+$').hasMatch(v!)
                    ? null
                    : 'Invalid Email',
              ),
              const SizedBox(height: 10),
              DropdownButtonFormField<String>(
                initialValue: dept,
                decoration: const InputDecoration(labelText: 'Department *'),
                items: departments
                    .map((d) => DropdownMenuItem(value: d, child: Text(d)))
                    .toList(),
                onChanged: (v) => setState(() => dept = v),
                validator: (v) => v == null ? 'Required' : null,
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Radio<String>(
                      value: 'Male',
                      groupValue: gender,
                      onChanged: (v) => setState(() => gender = v)),
                  const Text('Male'),
                  Radio<String>(
                      value: 'Female',
                      groupValue: gender,
                      onChanged: (v) => setState(() => gender = v)),
                  const Text('Female'),
                ],
              ),
              const SizedBox(height: 20),
              ElevatedButton(onPressed: submit, child: const Text('Submit')),
            ],
          ),
        ),
      ),
    );
  }
}

/// ---------------- PROFILE SCREEN ----------------
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final emp = employee!;
    return Scaffold(
      appBar: AppBar(title: const Text('Employee Profile')),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          children: [
            CircleAvatar(
              radius: 40,
              backgroundImage:
              emp.profilePic != null ? MemoryImage(emp.profilePic!) : null,
              child: emp.profilePic == null
                  ? const Icon(Icons.person, size: 40)
                  : null,
            ),
            const SizedBox(height: 10),
            Text(emp.name,
                style:
                const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Text("ID: ${emp.id}"),
            Text("Email: ${emp.email}"),
            Text("Department: ${emp.department}"),
            Text("Gender: ${emp.gender}"),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const RegisterScreen()),
              ),
              child: const Text('Edit'),
            ),
            const SizedBox(height: 10),
            OutlinedButton(
              onPressed: () {
                employee = null;
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (_) => const HomeScreen()),
                      (route) => false,
                );
              },
              child: const Text('Delete'),
            ),
          ],
        ),
      ),
    );
  }
}
