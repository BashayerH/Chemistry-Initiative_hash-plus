import 'package:flutter/material.dart';
import 'package:chemistry_initiative/pages/home_page.dart';
import '../features/auth/auth_service.dart';
import '../features/auth/presentation/widgets/custom_textfield.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _nameCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _passCtrl = TextEditingController();
  final _confirmCtrl = TextEditingController();

  bool _isSignup = true;

  @override
  void dispose() {
    _nameCtrl.dispose();
    _emailCtrl.dispose();
    _passCtrl.dispose();
    _confirmCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Color System
    const primary = Color(0xFF605F4B); // TRUFFLE - Primary
    const oyster = Color(0xFFF9F4EA); // OYSTER - Background
    const sand = Color(0xFFCDAD85); // SAND - Cards, Highlights
    const sage = Color(0xFF9C9E80); // SAGE - Borders, Neutral
    const terracotta = Color(0xFFC47457); // TERRACOTTA - CTA
    const copper = Color(0xFFB68036); // COPPER - Progress, Icons

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/Carbon Quantum Dots.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(Colors.black54, BlendMode.darken),
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(vertical: 28),
            child: Column(
              children: [
                const SizedBox(height: 8),
                const CircleAvatar(
                  radius: 34,
                  backgroundColor: primary,
                  child: Icon(Icons.science, color: oyster, size: 36),
                ),
                const SizedBox(height: 12),
                Text(
                  _isSignup ? 'إنشاء حساب' : 'تسجيل الدخول',
                  style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: oyster),
                ),
                const SizedBox(height: 18),

                // Card
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  padding: const EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    color: oyster,
                    borderRadius: BorderRadius.circular(18),
                    boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 10)],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Tabs
                      Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: sand.withAlpha(51), // translucent SAND
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: InkWell(
                                onTap: () => setState(() => _isSignup = true),
                                child: Container(
                                  padding: const EdgeInsets.symmetric(vertical: 10),
                                  decoration: BoxDecoration(
                                    color: _isSignup ? Colors.white : Colors.transparent,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'حساب جديد',
                                      style: TextStyle(
                                        color: _isSignup ? primary : sage,
                                        fontWeight: _isSignup ? FontWeight.bold : FontWeight.normal,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: InkWell(
                                onTap: () => setState(() => _isSignup = false),
                                child: Container(
                                  padding: const EdgeInsets.symmetric(vertical: 10),
                                  decoration: BoxDecoration(
                                    color: !_isSignup ? Colors.white : Colors.transparent,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'تسجيل الدخول',
                                      style: TextStyle(
                                        color: !_isSignup ? primary : sage,
                                        fontWeight: !_isSignup ? FontWeight.bold : FontWeight.normal,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 16),

                      // Form
                      if (_isSignup) ...[
                        const Align(alignment: Alignment.centerRight, child: Text('الاسم الكامل', style: TextStyle(fontWeight: FontWeight.bold))),
                        const SizedBox(height: 8),
                        CustomTextfield(hintText: 'الاسم الكامل', controller: _nameCtrl),
                        const SizedBox(height: 12),

                        const Align(alignment: Alignment.centerRight, child: Text('البريد الإلكتروني', style: TextStyle(fontWeight: FontWeight.bold))),
                        const SizedBox(height: 8),
                        CustomTextfield(hintText: 'example@email.com', controller: _emailCtrl),
                        const SizedBox(height: 12),

                        const Align(alignment: Alignment.centerRight, child: Text('كلمة المرور', style: TextStyle(fontWeight: FontWeight.bold))),
                        const SizedBox(height: 8),
                        CustomTextfield(hintText: '********', isPassword: true, controller: _passCtrl),
                        const SizedBox(height: 12),

                        const Align(alignment: Alignment.centerRight, child: Text('إعادة كلمة المرور', style: TextStyle(fontWeight: FontWeight.bold))),
                        const SizedBox(height: 8),
                        CustomTextfield(hintText: '********', isPassword: true, controller: _confirmCtrl),
                        const SizedBox(height: 18),

                        // CTA (chemistry colors)
                        GestureDetector(
                          onTap: () async {
                            final messenger = ScaffoldMessenger.of(context);
                            final navigator = Navigator.of(context);
                            final name = _nameCtrl.text.trim();
                            final email = _emailCtrl.text.trim();
                            final pass = _passCtrl.text;
                            final confirm = _confirmCtrl.text;

                            if (name.isEmpty || email.isEmpty || pass.isEmpty || confirm.isEmpty) {
                              messenger.showSnackBar(const SnackBar(content: Text('يرجى ملء جميع الحقول')));
                              return;
                            }
                            if (pass != confirm) {
                              messenger.showSnackBar(const SnackBar(content: Text('كلمة المرور غير متطابقة')));
                              return;
                            }

                            final err = await AuthService.registerUser(name, email, pass);
                            if (!mounted) return;
                            if (err != null) {
                              messenger.showSnackBar(SnackBar(content: Text(err)));
                              return;
                            }

                            messenger.showSnackBar(const SnackBar(content: Text('تم إنشاء الحساب بنجاح')));
                            navigator.pushReplacement(MaterialPageRoute(builder: (_) => HomePage(showWelcome: true)));
                          },
                          child: Container(
                            height: 54,
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(colors: [copper, terracotta]),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Center(child: Text('إنشاء حساب', style: TextStyle(color: oyster, fontSize: 18, fontWeight: FontWeight.bold))),
                          ),
                        ),
                      ] else ...[
                        const Align(alignment: Alignment.centerRight, child: Text('البريد الإلكتروني', style: TextStyle(fontWeight: FontWeight.bold))),
                        const SizedBox(height: 8),
                        CustomTextfield(hintText: 'example@email.com', controller: _emailCtrl),
                        const SizedBox(height: 12),

                        const Align(alignment: Alignment.centerRight, child: Text('كلمة المرور', style: TextStyle(fontWeight: FontWeight.bold))),
                        const SizedBox(height: 8),
                        CustomTextfield(hintText: '********', isPassword: true, controller: _passCtrl),
                        const SizedBox(height: 18),

                        GestureDetector(
                          onTap: () async {
                            final messenger = ScaffoldMessenger.of(context);
                            final navigator = Navigator.of(context);
                            final email = _emailCtrl.text.trim();
                            final pass = _passCtrl.text;
                            if (email.isEmpty || pass.isEmpty) {
                              messenger.showSnackBar(const SnackBar(content: Text('يرجى إدخال البريد وكلمة المرور')));
                              return;
                            }
                            final ok = await AuthService.loginUser(email, pass);
                            if (!mounted) return;
                            if (!ok) {
                              messenger.showSnackBar(const SnackBar(content: Text('بيانات الدخول غير صحيحة')));
                              return;
                            }

                            navigator.pushReplacement(MaterialPageRoute(builder: (_) => const HomePage()));
                          },
                          child: Container(
                            height: 54,
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(colors: [sand, copper]),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Center(child: Text('تسجيل الدخول', style: TextStyle(color: oyster, fontSize: 18, fontWeight: FontWeight.bold))),
                          ),
                        ),
                      ],

                      const SizedBox(height: 16),
                      Center(child: Text('أو', style: TextStyle(color: sage))),
                      const SizedBox(height: 12),
                      _socialButton('متابعة مع جوجل', Icons.g_mobiledata, Colors.red, primary, sand),
                      const SizedBox(height: 10),
                      _socialButton('متابعة مع فيسبوك', Icons.facebook, Colors.blue, primary, sand),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _socialButton(String text, IconData icon, Color color, Color primaryColor, Color bgColor) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
      decoration: BoxDecoration(
        border: Border.all(color: primaryColor.withAlpha(51)),
        borderRadius: BorderRadius.circular(12),
        color: bgColor.withAlpha(242),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: color),
          const SizedBox(width: 10),
          Text(text, style: TextStyle(fontWeight: FontWeight.w500, color: primaryColor)),
        ],
      ),
    );
  }
}
