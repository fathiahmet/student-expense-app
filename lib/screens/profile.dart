import 'package:flutter/material.dart';
import '../services/auth_service.dart';
import '../utils/design_system.dart';
import 'login_screen.dart';

// 1. Change to StatefulWidget to allow UI updates when language changes
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // 2. Define the state variable to hold the selection
  String _selectedLanguage = 'English';

  void _logout(BuildContext context) async {
    await AuthService().signOut();
    if (!mounted) return;
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (_) => const LoginPage()),
      (route) => false,
    );
  }

  // 3. The Dialog Logic
  void _showLanguageDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: const Text("Select Language"),
          children: <Widget>[
            _languageOption('English', 'english'),
            _languageOption('Somali', 'somali'),
            _languageOption('Amharic', 'amharic'),
            _languageOption('Oromo', 'oromo'),
          ],
        );
      },
    );
  }

  // 4. Helper for individual language buttons
  Widget _languageOption(String title, String value) {
    return SimpleDialogOption(
      onPressed: () {
        setState(() {
          _selectedLanguage = title; // This updates the UI
        });
        Navigator.pop(context);
        // Add your logic here to change the app's actual Locale
        print("Selected Language Code: $value");
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        child: Text(title, style: const TextStyle(fontSize: 16)),
      ),
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
          // Profile Header
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

          const SizedBox(height: 40),

          // --- REIMPLEMENTED LANGUAGE SECTION ---
          ListTile(
            leading: const Icon(Icons.language),
            title: const Text('Language'),
            subtitle: Text(_selectedLanguage), // Shows current selection
            trailing: const Icon(Icons.chevron_right, color: AppColors.primary),
            onTap: _showLanguageDialog,
          ),

          // ---------------------------------------
          ListTile(
            leading: const Icon(Icons.notifications),
            title: const Text('Notifications'),
            trailing: Switch(
              value: true,
              onChanged: (v) {},
              activeColor: AppColors.primary,
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
            onTap: () => _logout(context),
          ),
        ],
      ),
    );
  }
}
