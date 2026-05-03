import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F3EF),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(height: 30),
              //Logo section
              CircleAvatar(
                radius: 45,
                backgroundColor: const Color(0xff1e4d4f),
                child: const Icon(Icons.school, color: Colors.white, size: 35),
              ),
              const SizedBox(height: 15),
              //App Name
              RichText(
                text: const TextSpan(
                  children: [
                    TextSpan(
                      text: "Edu",
                      style: TextStyle(
                        color: Color(0xff1e4d4f),
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: "pay",
                      style: TextStyle(
                        color: Color(0xffd6b97b),
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "welcome to eduPay. Track your expenses",
                style: TextStyle(color: Colors.grey, fontSize: 14),
              ),
              const SizedBox(height: 20),
              const Text(
                "Register Now",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff1e4d4f),
                ),
              ),
              const SizedBox(height: 25),

              //Form container
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildLabel("Full Name"),
                    _buildTextField(
                      hint: "Enter your full name",
                      icon: Icons.person_outline,
                    ),
                    const SizedBox(height: 15),
                    _buildLabel("phone number"),
                    _buildTextField(
                      hint: "Enter your phone number",
                      icon: Icons.phone_outlined,
                      keyboardType: TextInputType.phone,
                    ),
                    const SizedBox(height: 15),
                    _buildLabel("Email"),
                    _buildTextField(
                      hint: "Enter your email",
                      icon: Icons.email_outlined,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    const SizedBox(height: 15),
                    _buildLabel("Password"),
                    _buildTextField(
                      hint: "Enter your password",
                      icon: Icons.lock_outline,
                      isPassword: true,
                      // obscureText: _obscurePassword,
                      // suffixIcon: IconButton(
                      //   icon: Icon(
                      //     _obscurePassword ? Icons.visibility : Icons.visibility_off,
                      //     color: Colors.grey,
                      //   ),
                      //   onPressed: () {
                      //     setState(() {
                      //       _obscurePassword = !_obscurePassword;
                      //     });
                      //   },
                      // ),
                    ),
                    const SizedBox(height: 25),
                    SizedBox(
                      width: double.infinity,
                      height: 55,
                      child: ElevatedButton(
                        onPressed: () {
                          // Handle registration logic here
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xff1e4d4f),
                          // padding: const EdgeInsets.symmetric(vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        child: const Text(
                          "Register",
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    //Login Link
                    Center(
                      child: RichText(
                        text: const TextSpan(
                          text: "Already have an account? ",
                          style: TextStyle(color: Colors.grey),
                          children: [
                            TextSpan(
                              text: "Click here",
                              style: TextStyle(
                                color: Color(0xff1e4d4f),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              const Text(
                "By registering, you agree to our Terms of Service and Privacy Policy.",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey, fontSize: 12),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildLabel(String text) {
  return Text(
    text,
    style: const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.bold,
      color: Color(0xff1e4d4f),
    ),
  );
}

Widget _buildTextField({
  required String hint,
  required IconData icon,
  bool isPassword = false,
  TextInputType keyboardType = TextInputType.text,
}) {
  return TextField(
    obscureText: isPassword,
    keyboardType: keyboardType,
    decoration: InputDecoration(
      hintText: hint,
      prefixIcon: Icon(icon, color: Colors.grey),
      filled: true,
      fillColor: const Color(0xFFF5F3EF),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide.none,
      ),
    ),
  );
}
