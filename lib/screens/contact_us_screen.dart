import 'package:flutter/material.dart';
import '../theme/color_palette.dart';

class ContactUsScreen extends StatefulWidget {
  const ContactUsScreen({super.key});

  @override
  State<ContactUsScreen> createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _messageController = TextEditingController();

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Message sent successfully!')),
      );

      _nameController.clear();
      _emailController.clear();
      _messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.greyDarker,
      appBar: AppBar(
        title: const Text('Contact Us'),
        backgroundColor: AppColors.greyDark,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 600),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Contact Info Text
                    const Text(
                      "Contact Us",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: AppColors.light,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "Reach out to us through these channels:",
                      style: TextStyle(fontSize: 16, color: AppColors.light),
                    ),
                    const SizedBox(height: 10),
                    const Row(
                      children: [
                        Icon(Icons.phone, color: AppColors.orange, size: 18),
                        SizedBox(width: 8),
                        Text("+1 (123) 456-7890", style: TextStyle(color: AppColors.light)),
                      ],
                    ),
                    const SizedBox(height: 8),
                    const Row(
                      children: [
                        Icon(Icons.email, color: AppColors.orange, size: 18),
                        SizedBox(width: 8),
                        Text("support@woodieshop.com", style: TextStyle(color: AppColors.light)),
                      ],
                    ),
                    const SizedBox(height: 8),
                    const Row(
                      children: [
                        Icon(Icons.location_on, color: AppColors.orange, size: 18),
                        SizedBox(width: 8),
                        Text("123 Woodie Street, Nature Town", style: TextStyle(color: AppColors.light)),
                      ],
                    ),
                    const SizedBox(height: 30),

                    // Feedback Form
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: AppColors.orange,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Form(
                        key: _formKey,
                        autovalidateMode: AutovalidateMode.disabled,
                        child: Column(
                          children: [
                            _buildTextField(_nameController, "Your Name", 1, "Please enter your name"),
                            const SizedBox(height: 10),
                            _buildTextField(_emailController, "Your Email", 1, "Please enter a valid email", isEmail: true),
                            const SizedBox(height: 10),
                            _buildTextField(_messageController, "Your Message", 4, "Please enter your message"),
                            const SizedBox(height: 16),
                            ElevatedButton(
                              onPressed: _submitForm,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.greyDark,
                                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 32),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                              ),
                              child: const Text("Submit", style: TextStyle(color: AppColors.light)),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String hint, int maxLines, String errorText, {bool isEmail = false}) {
    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return errorText;
        }
        if (isEmail && !value.contains('@')) {
          return "Enter a valid email address";
        }
        return null;
      },
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.light,
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.grey),
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
