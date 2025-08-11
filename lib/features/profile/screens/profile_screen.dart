import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hiremee/shared/widgets/custom_text.dart';
import 'package:hiremee/shared/widgets/ThemeColor.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final screenHeight = size.height;
    Future<void> signOutUser() async {
      final supabase = Supabase.instance.client;
      try {
        await supabase.auth.signOut();
        context.go('/loginGoogle');
      } catch (e) {
        print('Error signing out: $e');
      }
    }

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        title: MyText(
          text: "Settings",
          color: Colors.grey.shade800,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Profile Section
            Container(
              padding: const EdgeInsets.symmetric(vertical: 20),
              color: Colors.white,
              width: double.infinity,
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage('assets/images/profile.png'),
                  ),
                  const SizedBox(height: 10),
                  MyText(
                    text: "Ali Ahmed",
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                  MyText(
                    text: "ali.ahmed@example.com",
                    color: Colors.grey.shade600,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ThemeColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                    ),
                    onPressed: () {
                      // Edit profile action
                    },
                    child: const Text(
                      "Edit Profile",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 10),

            // Account Section
            _buildSectionHeader("Account"),
            _buildSettingsTile(
              icon: Icons.lock_outline,
              title: "Change Password",
              onTap: () {},
            ),
            _buildSettingsTile(
              icon: Icons.history,
              title: "Job Application History",
              onTap: () {},
            ),
            _buildSettingsTile(
              icon: Icons.bookmark_border,
              title: "Saved Jobs",
              onTap: () {},
            ),
            const SizedBox(height: 10),

            // Preferences Section
            _buildSectionHeader("Preferences"),
            _buildSettingsTile(
              icon: Icons.notifications_outlined,
              title: "Notifications",
              onTap: () {},
            ),
            _buildSettingsTile(
              icon: Icons.language,
              title: "Language",
              onTap: () {},
            ),
            _buildSettingsTile(
              icon: Icons.dark_mode_outlined,
              title: "Dark Mode",
              trailing: Switch(
                value: false,
                activeColor: ThemeColor,
                onChanged: (value) {},
              ), onTap: () {  },
            ),
            const SizedBox(height: 10),

            // Support Section
            _buildSectionHeader("Support"),
            _buildSettingsTile(
              icon: Icons.help_outline,
              title: "Help & Support",
              onTap: () {},
            ),
            _buildSettingsTile(
              icon: Icons.privacy_tip_outlined,
              title: "Privacy Policy",
              onTap: () {},
            ),
            _buildSettingsTile(
              icon: Icons.info_outline,
              title: "About",
              onTap: () {},
            ),
            const SizedBox(height: 20),

            // Logout Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent,
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                icon: const Icon(Icons.logout, color: Colors.white),
                label: const Text(
                  "Logout",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                onPressed: () {
                  signOutUser();
                },
              ),
            ),
            SizedBox(height: screenHeight * 0.05),
          ],
        ),
      ),
    );
  }
  Widget _buildSectionHeader(String title) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      color: Colors.grey.shade200,
      child: MyText(
        text: title,
        color: Colors.grey.shade700,
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  // Reusable Settings Tile
  Widget _buildSettingsTile({
    required IconData icon,
    required String title,
    Widget? trailing,
    required VoidCallback onTap,
  }) {
    return ListTile(
      onTap: onTap,
      leading: Icon(icon, color: ThemeColor),
      title: MyText(
        text: title,
        color: Colors.grey.shade800,
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
      trailing: trailing ?? const Icon(Icons.arrow_forward_ios, size: 16),
      tileColor: Colors.white,
    );
  }
}
