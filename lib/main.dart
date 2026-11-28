
import 'package:flutter/material.dart';

void main() {
  runApp(const AdorApp());
}

class AdorApp extends StatelessWidget {
  const AdorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ador',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF16A66A),
        ),
        useMaterial3: true,
      ),
      home: const LoginScreen(),
    );
  }
}

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  static const Color green = Color(0xFF087A4B);
  static const Color darkGreen = Color(0xFF004D35);

  void openHome(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const HomeScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/login_bg.jpg',
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFFB8E8C9),
                      Color(0xFF287C55),
                      Color(0xFF003D2C),
                    ],
                  ),
                ),
              );
            },
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black.withOpacity(0.05),
                  Colors.black.withOpacity(0.15),
                  const Color(0xFF003D2C).withOpacity(0.95),
                ],
                stops: const [0.0, 0.38, 1.0],
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28),
              child: Column(
                children: [
                  const Spacer(),
                  const Icon(
                    Icons.favorite_rounded,
                    color: Colors.white,
                    size: 58,
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Ador',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 43,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
                    ),
                  ),
                  const Text(
                    'Connect Hearts, Share Happiness',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 13,
                    ),
                  ),
                  const SizedBox(height: 38),
                  SizedBox(
                    width: double.infinity,
                    height: 54,
                    child: ElevatedButton(
                      onPressed: () => openHome(context),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: darkGreen,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.g_mobiledata, size: 34),
                          SizedBox(width: 8),
                          Text(
                            'Continue with Google',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 22),
                  const Row(
                    children: [
                      Expanded(child: Divider(color: Colors.white54)),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 14),
                        child: Text(
                          'OR',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      Expanded(child: Divider(color: Colors.white54)),
                    ],
                  ),
                  const SizedBox(height: 22),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _loginIcon(
                        icon: Icons.facebook,
                        color: const Color(0xFF1877F2),
                        onTap: () => openHome(context),
                      ),
                      const SizedBox(width: 25),
                      _loginIcon(
                        icon: Icons.phone,
                        color: const Color(0xFF20C879),
                        onTap: () => openHome(context),
                      ),
                    ],
                  ),
                  const SizedBox(height: 35),
                  const Text(
                    'By continuing, you agree to our',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 11,
                    ),
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    'User Agreement  •  Privacy Policy',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 25),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _loginIcon({
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(40),
      child: Container(
        width: 58,
        height: 58,
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white70),
        ),
        child: Icon(icon, color: color, size: 30),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F8F4),
      appBar: AppBar(
        backgroundColor: const Color(0xFF087A4B),
        foregroundColor: Colors.white,
        title: const Text(
          'Ador',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: const Center(
        child: Text(
          'Welcome to Ador!',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Color(0xFF087A4B),
          ),
        ),
      ),
    );
  }
}
