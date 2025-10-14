// lib/main.dart
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(const EmployeeApp());
}

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
  String department;
  String gender;
  String email;
  File? profilePic;

  Employee({
    required this.name,
    required this.id,
    required this.department,
    required this.gender,
    required this.email,
    this.profilePic,
  });
}

/// In-memory data
Employee? registeredEmployee;

/// ---------------- Home Screen ----------------
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Employee Management')),
      body: LayoutBuilder(
        builder: (context, constraints) => Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(18),
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 600),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          Image.asset('assets/logo.png', width: 100, height: 100),
                          const SizedBox(height: 12),
                          const Text(
                            'BlueOrbit Solutions',
                            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                          ),
                          const Text(
                            'Smart Employee Management',
                            style: TextStyle(color: Colors.black54),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 25),
                  ElevatedButton.icon(
                    icon: const Icon(Icons.person_add),
                    label: const Text("Register Employee"),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => const RegisterEmployeeScreen()));
                    },
                  ),
                  const SizedBox(height: 12),
                  ElevatedButton.icon(
                    icon: const Icon(Icons.person),
                    label: const Text("Employee Profile"),
                    onPressed: () {
                      if (registeredEmployee == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("No employee registered yet.")));
                      } else {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => const EmployeeProfileScreen()));
                      }
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// ---------------- Register Employee Screen ----------------
class RegisterEmployeeScreen extends StatefulWidget {
  final Employee? existing;
  const RegisterEmployeeScreen({super.key, this.existing});

  @override
  State<RegisterEmployeeScreen> createState() => _RegisterEmployeeScreenState();
}

class _RegisterEmployeeScreenState extends State<RegisterEmployeeScreen> {
  final _formKey = GlobalKey<FormState>();
  final _picker = ImagePicker();

  late final TextEditingController _nameController;
  late final TextEditingController _idController;
  late final TextEditingController _emailController;

  String? _dept;
  String? _gender;
  bool _terms = false;
  File? _profilePic;

  final _departments = ['HR', 'IT', 'Finance', 'Sales'];

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.existing?.name ?? "");
    _idController = TextEditingController(text: widget.existing?.id ?? "");
    _emailController = TextEditingController(text: widget.existing?.email ?? "");
    _dept = widget.existing?.department;
    _gender = widget.existing?.gender;
    _profilePic = widget.existing?.profilePic;
    _terms = widget.existing != null;
  }

  Future<void> _pickImage() async {
    final XFile? img = await _picker.pickImage(source: ImageSource.gallery);
    if (img != null) setState(() => _profilePic = File(img.path));
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) return;
    if (_dept == null || _gender == null || !_terms) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Please complete all required fields.")));
      return;
    }

    registeredEmployee = Employee(
      name: _nameController.text.trim(),
      id: _idController.text.trim(),
      department: _dept!,
      gender: _gender!,
      email: _emailController.text.trim(),
      profilePic: _profilePic,
    );

    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (_) => const EmployeeProfileScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Register Employee")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(children: [
            Row(children: [
              GestureDetector(
                onTap: _pickImage,
                child: CircleAvatar(
                  radius: 40,
                  backgroundImage: _profilePic != null ? FileImage(_profilePic!) : null,
                  child: _profilePic == null ? const Icon(Icons.camera_alt) : null,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(children: [
                  TextFormField(
                    controller: _nameController,
                    decoration: const InputDecoration(labelText: "Full Name *"),
                    validator: (v) => v == null || v.isEmpty ? "Required" : null,
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: _idController,
                    decoration: const InputDecoration(labelText: "Employee ID *"),
                    validator: (v) => v == null || v.isEmpty ? "Required" : null,
                  )
                ]),
              )
            ]),
            const SizedBox(height: 12),
            DropdownButtonFormField<String>(
              initialValue: _dept,
              decoration: const InputDecoration(labelText: "Department *"),
              items: _departments
                  .map((d) => DropdownMenuItem(value: d, child: Text(d)))
                  .toList(),
              onChanged: (v) => setState(() => _dept = v),
              validator: (v) => v == null ? "Required" : null,
            ),
            const SizedBox(height: 12),
            Card(
              child: Row(children: [
                Radio<String>(
                    value: "Male",
                    groupValue: _gender,
                    onChanged: (v) => setState(() => _gender = v)),
                const Text("Male"),
                Radio<String>(
                    value: "Female",
                    groupValue: _gender,
                    onChanged: (v) => setState(() => _gender = v)),
                const Text("Female"),
              ]),
            ),
            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: "Email Address *"),
              validator: (v) {
                if (v == null || v.isEmpty) return "Required";
                final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+$');
                return emailRegex.hasMatch(v) ? null : "Invalid email";
              },
            ),
            Row(children: [
              Checkbox(value: _terms, onChanged: (v) => setState(() => _terms = v!)),
              const Text("Accept Terms & Conditions *"),
            ]),
            const SizedBox(height: 12),
            ElevatedButton(onPressed: _submit, child: const Text("Submit"))
          ]),
        ),
      ),
    );
  }
}

/// ---------------- Employee Profile Screen ----------------
class EmployeeProfileScreen extends StatelessWidget {
  const EmployeeProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final emp = registeredEmployee;
    if (emp == null) {
      return const Scaffold(body: Center(child: Text("No employee data")));
    }
    return Scaffold(
      appBar: AppBar(title: const Text("Employee Profile")),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: Card(
          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.all(18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(children: [
                  emp.profilePic != null
                      ? CircleAvatar(radius: 40, backgroundImage: FileImage(emp.profilePic!))
                      : const CircleAvatar(radius: 40, child: Icon(Icons.person)),
                  const SizedBox(width: 12),
                  Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Text(emp.name, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    Text("ID: ${emp.id}"),
                    Text(emp.email),
                  ]),
                ]),
                const Divider(),
                Text("Department: ${emp.department}"),
                Text("Gender: ${emp.gender}"),
                const SizedBox(height: 12),
                Row(children: [
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (_) => RegisterEmployeeScreen(existing: emp)),
                        );
                      },
                      child: const Text("Edit")),
                  const SizedBox(width: 12),
                  OutlinedButton(
                      onPressed: () {
                        registeredEmployee = null;
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (_) => const HomeScreen()),
                                (r) => false);
                      },
                      child: const Text("Delete"))
                ])
              ],
            ),
          ),
        ),
      ),
    );
  }
}
