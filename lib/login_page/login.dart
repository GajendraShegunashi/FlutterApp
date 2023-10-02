// Importing necessary packages
import 'package:flutter/material.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({Key? key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final _formfield = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passController = TextEditingController();
  bool passToggle = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login Page"), // App Bar Title
        centerTitle: true, // Center align the title
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 400,
          ),
          child: SingleChildScrollView(
            child: Form(
              key: _formfield,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    "images/avatar1.jpeg", // Image Widget to display an image
                    height: 200,
                    width: 200,
                  ),
                  const SizedBox(height: 50), // Vertical spacing
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    controller: emailController,
                    decoration: const InputDecoration(
                      labelText: "Email",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.email), // Email icon
                    ),
                    validator: (value) {
                      // Validation logic for the email field
                      bool emailValid = RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_'{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(value!);

                      if (value.isEmpty) {
                        return "Enter Email"; // Validation error message
                      } else if (!emailValid) {
                        return "Enter Valid Email"; // Validation error message
                      }
                      return null; // No validation error
                    },
                  ),
                  const SizedBox(height: 20), // Vertical spacing
                  TextFormField(
                    keyboardType: TextInputType.text,
                    controller: passController,
                    obscureText: passToggle,
                    decoration: InputDecoration(
                      labelText: "Password",
                      border: const OutlineInputBorder(),
                      prefixIcon: const Icon(Icons.lock), // Lock icon
                      suffixIcon: InkWell(
                        onTap: () {
                          setState(() {
                            passToggle = !passToggle;
                          });
                        },
                        child: Icon(
                          passToggle ? Icons.visibility_off : Icons.visibility,
                        ),
                      ),
                    ),
                    validator: (value) {
                      // Validation logic for the password field
                      if (value!.isEmpty) {
                        return "Enter Password"; // Validation error message
                      } else if (passController.text.length < 6) {
                        return "Password length must be more than 6 characters"; // Validation error message
                      }
                      return null; // No validation error
                    },
                  ),
                  const SizedBox(height: 60), // Vertical spacing
                  InkWell(
                    onTap: () {
                      if (_formfield.currentState!.validate()) {
                        emailController.clear();
                        passController.clear();

                        // Navigate to the home page after successful login
                        Navigator.pushReplacementNamed(context, '/home');
                      }
                    },
                    child: Container(
                      height: 50,
                      width: 150,
                      decoration: BoxDecoration(
                        color: Colors.indigo,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: const Center(
                        child: Text(
                          "Log In", // Button text
                          style: TextStyle(
                            color: Colors.white, // Text color
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20), // Vertical spacing
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Already have an account?",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          // we can add sign-up redirection logic here
                        },
                        child: const Text(
                          "Sign Up",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
