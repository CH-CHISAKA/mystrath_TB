import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

class AuthenticationScreen extends StatefulWidget {
  const AuthenticationScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AuthenticationScreenState createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _isPasswordVisible = false;
  final AuthController _authController = Get.put(AuthController());

  String id = '';
  String password = '';

  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      try {
        await _authController.register(id, password);
        // Show success message
      } catch (e) {
        // Show error message
      }
    } else {
      // Show error message
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Theme.of(context).colorScheme.surface,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(height: 60),
                Center(
                  child: Text(
                    'WELCOME',
                    style: GoogleFonts.getFont(
                      'Nunito Sans',
                      fontSize: 27,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),

                const SizedBox(height: 15),

                Center(
                  child: Image.asset(
                    'assets/logos/landing page logo.png',
                    height: 180,
                    width: 180,
                  ),
                ),

                const SizedBox(height: 12),


                Center(
                  child: Text(
                    'Create an account',
                    style: GoogleFonts.getFont(
                      'Nunito Sans',
                      fontSize: 23,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                const SizedBox(height: 45),

                TextFormField(
                  key: const ValueKey('id'),
                  validator: (value) {
                    if (value!.isEmpty || !RegExp(r'^[0-9]+$').hasMatch(value)) {
                      return 'Enter a valid Admission Number';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Enter Admission Number',
                    labelStyle: GoogleFonts.getFont(
                      'Nunito Sans',
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 0.2,
                    ),
                    prefixIcon: const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Icon(Icons.person),
                    ),
                  ),
                  onSaved: (value) {
                    id = value!;
                  },
                ),
                const SizedBox(height: 15),
                TextFormField(
                  key: const ValueKey('password'),
                  validator: (value) {
                    if (value!.isEmpty || value.length < 6) {
                      return 'Password must be at least 6 characters and contain both letters and numbers';
                    } else if (value.length > 15) {
                      return 'Password must not exceed 15 characters';
                    } else if (!RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])').hasMatch(value)) {
                      return 'Password must contain at least one uppercase, one lowercase letter, and one number';
                    }
                    return null;
                  },
                  obscureText: !_isPasswordVisible,
                  decoration: InputDecoration(
                    labelText: 'Enter Password',
                    labelStyle: GoogleFonts.getFont(
                      'Nunito Sans',
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 0.2,
                    ),
                    prefixIcon: const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Icon(Icons.lock),
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          _isPasswordVisible = !_isPasswordVisible;
                        });
                      },
                    ),
                  ),
                  onSaved: (value) {
                    password = value!;
                  },
                ),
                const SizedBox(height: 40),
                GestureDetector(
                  onTap: _submitForm,
                  child: Container(
                    height: 65,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      gradient: const LinearGradient(
                        colors: [
                          Color(0xFFF8AC23),
                          Color(0xFFDC9F31),
                          Color(0xFFC4923A),
                          Color(0xFFBA9553),
                        ],
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'SIGN IN',
                        style: GoogleFonts.getFont(
                          'Nunito Sans',
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    TextButton(
                      onPressed: () {
                        // Handle forgot password action
                      },
                      child: const Text(
                        'Forgot Password?',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AuthController extends GetxController {
  Future<void> register(String id, String password) async {
    // Mock implementation of registration
    await Future.delayed(const Duration(seconds: 1));
    // ignore: avoid_print
    print('User registered with ID: $id and password: $password');
  }
}
