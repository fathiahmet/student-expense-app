import 'package:flutter/material.dart';
import '../services/auth_service.dart';
import '../utils/design_system.dart';
import 'register_screen.dart';
import 'dashboard_screen.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailCtrl = TextEditingController();
  final _passCtrl = TextEditingController();
  final _resetEmailCtrl = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    _emailCtrl.dispose();
    _passCtrl.dispose();
    _resetEmailCtrl.dispose();
    super.dispose();
  }

  // Reset Logic
  Future<void> _handlePasswordReset() async {
    final email = _resetEmailCtrl.text.trim();
    if (email.isEmpty || !email.contains('@')) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a valid email address')),
      );
      return;
    }

    try {
      await AuthService().sendPasswordResetEmail(email);

      if (!mounted) return;
      Navigator.pop(context);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Password reset email sent! Check your inbox.'),
          backgroundColor: AppColors.primary,
        ),
      );
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.toString()), backgroundColor: AppColors.error),
      );
    }
  }

  void _showForgotPasswordDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Reset Password'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Enter your email address to receive reset instructions.',
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _resetEmailCtrl,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                labelText: 'Email Address',
                prefixIcon: Icon(Icons.mail_outline),
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: _handlePasswordReset,
            child: const Text('Send Reset Link'),
          ),
        ],
      ),
    );
  }

  void _login() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _isLoading = true);

    try {
      await AuthService().signIn(_emailCtrl.text.trim(), _passCtrl.text.trim());
      if (!mounted) return;

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const DashboardScreen()),
      );
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.toString()), backgroundColor: AppColors.error),
      );
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 40.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const AppLogo(),
                const SizedBox(height: 24),
                const Text(
                  'Welcome back to edupay',
                  style: TextStyle(color: AppColors.textLight, fontSize: 16),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Sign In',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary,
                  ),
                ),
                const SizedBox(height: 40),
                LabeledInput(
                  label: 'Email Address',
                  hint: 'you@example.com',
                  prefixIcon: Icons.mail_outline,
                  controller: _emailCtrl,
                  keyboardType: TextInputType.emailAddress,
                  validator: (v) => v == null || v.isEmpty || !v.contains('@')
                      ? 'Enter valid email'
                      : null,
                ),
                LabeledInput(
                  label: 'Password',
                  hint: 'Enter your password',
                  prefixIcon: Icons.lock_outline,
                  controller: _passCtrl,
                  isPassword: true,
                  validator: (v) =>
                      v == null || v.length < 6 ? 'Minimum 6 characters' : null,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () => _showForgotPasswordDialog(context),
                    child: const Text(
                      'Forgot password?',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        color: Color(0xFF0D47A1),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                CustomButton(
                  text: 'Login',
                  onPressed: _login,
                  isLoading: _isLoading,
                ),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don't have an account? ",
                      style: TextStyle(color: AppColors.textLight),
                    ),
                    GestureDetector(
                      onTap: () => Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const RegisterScreen(),
                        ),
                      ),
                      child: const Text(
                        'Register',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                const Text(
                  'Secure login powered by edupay',
                  style: TextStyle(color: Colors.black38, fontSize: 12),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}