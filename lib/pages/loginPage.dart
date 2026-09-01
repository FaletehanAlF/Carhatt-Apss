import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Key untuk Form
  final _formKey = GlobalKey<FormState>();

  // Controller untuk mengambil nilai dari input
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Untuk menampilkan / menyembunyikan password
  bool _obscurePassword = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  // Fungsi Login
  void _login() {
    // Menjalankan validasi Form
    if (_formKey.currentState!.validate()) {
      // Jika validasi berhasil
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Login berhasil!'),
          backgroundColor: Colors.green,
        ),
      );

      // Contoh navigation ke Home
      // Aktifkan jika route /home sudah dibuat
      //
      // Navigator.pushReplacementNamed(context, '/home');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F0),

      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 30,
            ),

            child: Form(
              key: _formKey,

              child: Container(
                width: double.infinity,
                constraints: const BoxConstraints(
                  maxWidth: 430,
                ),

                padding: const EdgeInsets.all(28),

                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(28),

                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.08),
                      blurRadius: 25,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [

                    // =========================
                    // LOGO
                    // =========================

                    Center(
                      child: Container(
                        width: 100,
                        height: 100,

                        padding: const EdgeInsets.all(15),

                        decoration: BoxDecoration(
                          color: const Color(0xFFFFC72C),
                          shape: BoxShape.circle,

                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.12),
                              blurRadius: 15,
                              offset: const Offset(0, 6),
                            ),
                          ],
                        ),

                        child: Image.asset(
                          'assets/images/carhartt_logo.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),

                    const SizedBox(height: 24),

                    // =========================
                    // TITLE
                    // =========================

                    Center(
                      child: Text(
                        'Welcome Back',
                        style: GoogleFonts.poppins(
                          fontSize: 28,
                          fontWeight: FontWeight.w700,
                          color: const Color(0xFF222222),
                        ),
                      ),
                    ),

                    const SizedBox(height: 8),

                    Center(
                      child: Text(
                        'Sign in to continue shopping',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          fontSize: 13,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ),

                    const SizedBox(height: 35),

                    // =========================
                    // EMAIL LABEL
                    // =========================

                    Text(
                      'Email',
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF222222),
                      ),
                    ),

                    const SizedBox(height: 8),

                    // =========================
                    // EMAIL INPUT
                    // =========================

                    TextFormField(
                      controller: _emailController,

                      keyboardType: TextInputType.emailAddress,

                      style: GoogleFonts.poppins(
                        fontSize: 14,
                      ),

                      decoration: InputDecoration(
                        hintText: 'Enter your email',
                        hintStyle: GoogleFonts.poppins(
                          fontSize: 13,
                          color: Colors.grey.shade500,
                        ),

                        prefixIcon: const Icon(
                          Icons.email_outlined,
                          color: Color(0xFF777777),
                        ),

                        filled: true,
                        fillColor: const Color(0xFFF8F8F8),

                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14),
                          borderSide: BorderSide.none,
                        ),

                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14),
                          borderSide: BorderSide(
                            color: Colors.grey.shade200,
                          ),
                        ),

                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14),
                          borderSide: const BorderSide(
                            color: Color(0xFFFFC72C),
                            width: 2,
                          ),
                        ),

                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 16,
                        ),
                      ),

                      // Validasi Email
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Email wajib diisi';
                        }

                        if (!value.contains('@')) {
                          return 'Masukkan email yang valid';
                        }

                        return null;
                      },
                    ),

                    const SizedBox(height: 20),

                    // =========================
                    // PASSWORD LABEL
                    // =========================

                    Text(
                      'Password',
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF222222),
                      ),
                    ),

                    const SizedBox(height: 8),

                    // =========================
                    // PASSWORD INPUT
                    // =========================

                    TextFormField(
                      controller: _passwordController,

                      obscureText: _obscurePassword,

                      style: GoogleFonts.poppins(
                        fontSize: 14,
                      ),

                      decoration: InputDecoration(
                        hintText: 'Enter your password',

                        hintStyle: GoogleFonts.poppins(
                          fontSize: 13,
                          color: Colors.grey.shade500,
                        ),

                        prefixIcon: const Icon(
                          Icons.lock_outline,
                          color: Color(0xFF777777),
                        ),

                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _obscurePassword = !_obscurePassword;
                            });
                          },

                          icon: Icon(
                            _obscurePassword
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined,

                            color: Colors.grey.shade600,
                          ),
                        ),

                        filled: true,
                        fillColor: const Color(0xFFF8F8F8),

                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14),
                          borderSide: BorderSide.none,
                        ),

                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14),
                          borderSide: BorderSide(
                            color: Colors.grey.shade200,
                          ),
                        ),

                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14),
                          borderSide: const BorderSide(
                            color: Color(0xFFFFC72C),
                            width: 2,
                          ),
                        ),

                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 16,
                        ),
                      ),

                      // Validasi Password
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Password wajib diisi';
                        }

                        if (value.length < 6) {
                          return 'Password minimal 6 karakter';
                        }

                        return null;
                      },
                    ),

                    const SizedBox(height: 12),

                    // =========================
                    // FORGOT PASSWORD
                    // =========================

                    Align(
                      alignment: Alignment.centerRight,

                      child: TextButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                'Fitur forgot password belum tersedia',
                              ),
                            ),
                          );
                        },

                        child: Text(
                          'Forgot password?',
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xFFB8860B),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 12),

                    // =========================
                    // LOGIN BUTTON
                    // =========================

                    SizedBox(
                      width: double.infinity,
                      height: 54,

                      child: ElevatedButton(
                        onPressed: _login,

                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFFFC72C),

                          foregroundColor: Colors.black,

                          elevation: 0,

                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                        ),

                        child: Text(
                          'Login',
                          style: GoogleFonts.poppins(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 28),

                    // =========================
                    // DIVIDER
                    // =========================

                    Row(
                      children: [
                        Expanded(
                          child: Divider(
                            color: Colors.grey.shade300,
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                          ),

                          child: Text(
                            'New to Carhartt?',
                            style: GoogleFonts.poppins(
                              fontSize: 12,
                              color: Colors.grey.shade600,
                            ),
                          ),
                        ),

                        Expanded(
                          child: Divider(
                            color: Colors.grey.shade300,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 20),

                    // =========================
                    // REGISTER
                    // =========================

                    SizedBox(
                      width: double.infinity,
                      height: 50,

                      child: OutlinedButton(
                        onPressed: () {
                          // Navigation ke halaman register
                          Navigator.pushNamed(
                            context,
                            '/register',
                          );
                        },

                        style: OutlinedButton.styleFrom(
                          foregroundColor: Colors.black,

                          side: const BorderSide(
                            color: Color(0xFFFFC72C),
                            width: 1.5,
                          ),

                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                        ),

                        child: Text(
                          'Create an Account',
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 24),

                    // =========================
                    // FOOTER
                    // =========================

                    Center(
                      child: Text(
                        'CARHARTT • WORKWEAR & STYLE',
                        style: GoogleFonts.poppins(
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1.2,
                          color: Colors.grey.shade500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}