import 'package:flutter/material.dart';
import '../services/auth_service.dart';
import '../utils/design_system.dart';
import 'login_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  void _logout() async {
    await AuthService().signOut();
    if (!mounted) return;
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (_) => const LoginPage()),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    final user = AuthService().currentUser;

    return Scaffold(
      appBar: AppBar(title: const Text('Profile Settings')),
      body: ListView(
        padding: const EdgeInsets.all(24.0),
        children: [
        
          const CircleAvatar(
            radius: 50,
            backgroundColor: AppColors.primary,
            child: Icon(Icons.person, size: 50, color: Colors.white),
          ),
          const SizedBox(height: 16),
          Text(
            user?.email ?? 'User',
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),

          ListTile(
            leading: const Icon(Icons.notifications),
            title: const Text('Notifications'),
            trailing: Switch(
              value: true,
              onChanged: (v) {},
              activeThumbColor: AppColors.primary,
            ),
          ),

          ListTile(
            leading: const Icon(Icons.security),
            title: const Text('Privacy & Security'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {},
          ),

          const Divider(height: 40),

          ListTile(
            leading: const Icon(Icons.logout, color: AppColors.error),
            title: const Text(
              'Logout',
              style: TextStyle(
                color: AppColors.error,
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () => _logout(),
          ),
        ],
      ),
    );
  }
}
