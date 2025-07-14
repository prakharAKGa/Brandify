import 'package:brandify/screens/home_page/widgets/home_gradient.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int _selectedIndex = 1; // Profile tab selected

  @override
  Widget build(BuildContext context) {
    return CustomBackground(
      child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              const SizedBox(height: 64),
              // Profile Card
              Container(
                width: 320,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 70,
                          height: 70,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xFFD9D9D9),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Kavya Yadav',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              'kavitayadav2701@gmail.com',
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    ...decorativeDots(),
                  ],
                ),
              ),
              const SizedBox(height: 32),
              _buildMenuItem(Icons.calendar_today, "Schedule content"),
              _buildMenuItem(Icons.person, "Manage your account"),
              _buildMenuItem(Icons.privacy_tip, "Privacy settings"),
              _buildMenuItem(Icons.notifications, "Notification settings"),
              _buildMenuItem(Icons.logout, "Logout"),
              const Spacer(),
            ],
          ),
          
        ),
    );
    
  }

  Widget _buildMenuItem(IconData icon, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 40),
      child: Row(
        children: [
          Icon(icon, color: Colors.white, size: 20),
          const SizedBox(width: 16),
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> decorativeDots() {
    return [
      Positioned(top: 10, left: 50, child: _buildDot(6, Colors.purpleAccent)),
      Positioned(top: 20, left: 30, child: _buildDot(8, Colors.amber)),
      Positioned(top: 60, left: 15, child: _buildDot(5, Colors.amber)),
      Positioned(top: 100, left: 25, child: _buildDot(6, Colors.purpleAccent)),
      Positioned(top: 95, left: 85, child: _buildDot(8, Colors.amber)),
    ];
  }

  Widget _buildDot(double size, Color color) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
    );
  }
}
