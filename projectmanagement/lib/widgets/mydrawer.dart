import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:magmentv101/constants/app_theme.dart';
import 'package:magmentv101/features/auth/login_page.dart';
import 'package:magmentv101/widgets/aboutpage.dart';
import 'package:magmentv101/widgets/my_settingpage.dart';

class MyDrawer extends StatelessWidget {
  final Widget widget;
  const MyDrawer({super.key, required this.widget});

  @override
  Widget build(BuildContext context) {
    Widget pagetosend() => widget;

    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.primary,
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                const SizedBox(height: 20),
                CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage("assets/jpg/logo.jpg"),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Project Manager",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 20),
                _buildDrawerTile(
                  context,
                  icon: Icons.home,
                  title: "Home",
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => pagetosend()),
                    );
                  },
                ),
                _buildDrawerTile(
                  context,
                  icon: Icons.group,
                  title: "About Us",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => aboutpage()),
                    );
                  },
                ),
                // _buildDrawerTile(
                //   context,
                //   icon: Icons.settings,
                //   title: "Settings",
                //   onTap: () {
                //     Navigator.push(
                //       context,
                //       MaterialPageRoute(
                //           builder: (context) => const SettingsPage()),
                //     );
                //   },
                // ),
              ],
            ),
            _buildDrawerTile(
              context,
              icon: Icons.logout,
              title: "Logout",
              textColor: Colors.red,
              iconColor: Colors.black,
              onTap: () {
                Navigator.pop(context);
                FirebaseAuth.instance.signOut();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => LoginPage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawerTile(
    BuildContext context, {
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    Color iconColor = Colors.white,
    Color textColor = Colors.white,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 6),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              Icon(icon, color: iconColor),
              const SizedBox(width: 10),
              Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: textColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
