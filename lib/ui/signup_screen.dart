import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/auth_controller.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {

  final AuthController controller = Get.find<AuthController>();

  final _formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passController = TextEditingController();

  bool obscurePassword = true;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
              horizontal: 24, vertical: 40),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment:
              CrossAxisAlignment.start,
              children: [

                const SizedBox(height: 30),

                /// 🔹 Title
                const Text(
                  "Create Account 🚀",
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 8),

                Text(
                  "Signup to get started",
                  style: TextStyle(
                    color: Colors.grey.shade600,
                  ),
                ),

                const SizedBox(height: 40),

                /// 🔹 Name
                TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(
                    hintText: "Enter your name",
                    filled: true,
                    fillColor:
                    Colors.grey.shade100,
                    border: OutlineInputBorder(
                      borderRadius:
                      BorderRadius.circular(14),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  validator: (value) {
                    if (value == null ||
                        value.isEmpty) {
                      return "Name is required";
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 20),

                /// 🔹 Email
                TextFormField(
                  controller: emailController,
                  keyboardType:
                  TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: "Enter your email",
                    filled: true,
                    fillColor:
                    Colors.grey.shade100,
                    border: OutlineInputBorder(
                      borderRadius:
                      BorderRadius.circular(14),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  validator: (value) {
                    if (value == null ||
                        value.isEmpty) {
                      return "Email is required";
                    }
                    if (!GetUtils.isEmail(value)) {
                      return "Enter valid email";
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 20),

                /// 🔹 Password
                TextFormField(
                  controller: passController,
                  obscureText: obscurePassword,
                  decoration: InputDecoration(
                    hintText:
                    "Enter your password",
                    filled: true,
                    fillColor:
                    Colors.grey.shade100,
                    border: OutlineInputBorder(
                      borderRadius:
                      BorderRadius.circular(14),
                      borderSide: BorderSide.none,
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        obscurePassword
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                      onPressed: () {
                        setState(() {
                          obscurePassword =
                          !obscurePassword;
                        });
                      },
                    ),
                  ),
                  validator: (value) {
                    if (value == null ||
                        value.isEmpty) {
                      return "Password is required";
                    }
                    if (value.length < 6) {
                      return "Minimum 6 characters";
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 30),

                /// 🔹 Signup Button
                SizedBox(
                  width: double.infinity,
                  height: 52,
                  child: Obx(() => ElevatedButton(
                    style:
                    ElevatedButton.styleFrom(
                      shape:
                      RoundedRectangleBorder(
                        borderRadius:
                        BorderRadius
                            .circular(14),
                      ),
                    ),
                    onPressed:
                    controller.isLoading
                        .value
                        ? null
                        : () {
                      if (_formKey
                          .currentState!
                          .validate()) {
                        controller
                            .register(
                          nameController
                              .text
                              .trim(),
                          emailController
                              .text
                              .trim(),
                          passController
                              .text
                              .trim(),
                        );
                      }
                    },
                    child:
                    controller.isLoading
                        .value
                        ? const SizedBox(
                      height: 22,
                      width: 22,
                      child:
                      CircularProgressIndicator(
                        strokeWidth: 2,
                        color: Colors
                            .white,
                      ),
                    )
                        : const Text(
                      "Create Account",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight:
                        FontWeight
                            .bold,
                      ),
                    ),
                  )),
                ),

                const SizedBox(height: 30),

                /// 🔹 Back to Login
                Center(
                  child: TextButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: const Text(
                      "Already have an account? Login",
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
