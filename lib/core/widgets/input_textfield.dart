import 'package:ez_banking/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InputTextFormField extends StatefulWidget {
  final String label;
  final String hint;
  final TextEditingController? controller;
  final bool isPassword;
  final TextInputType? keyboardType;
  final IconData icon;

  const InputTextFormField(
      {super.key,
      required this.label,
      required this.hint,
      required this.icon,
      this.controller,
      this.keyboardType,
      this.isPassword = false});

  @override
  State<InputTextFormField> createState() => _InputTextFormFieldState();
}

class _InputTextFormFieldState extends State<InputTextFormField> {
  bool passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: lightGrey.withOpacity(0.5),
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.label,
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w400,
              color: lightGrey,
              fontSize: 14,
            ),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 2),
                child: Icon(
                  widget.icon,
                  color: lightGrey,
                  size: 22,
                ),
              ),
              const SizedBox(
                width: 18,
              ),
              Expanded(
                child: TextFormField(
                  controller: widget.controller,
                  obscureText: passwordVisible && widget.isPassword,
                  keyboardType: widget.keyboardType,
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                    fontSize: 14,
                  ),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.only(bottom: 12),
                    labelText: widget.label,
                    hintText: widget.hint,
                    alignLabelWithHint: true,
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    suffixIcon: widget.isPassword
                        ? IconButton(
                            icon: Icon(passwordVisible
                                ? Icons.visibility
                                : Icons.visibility_off),
                            onPressed: () {
                              setState(
                                () {
                                  passwordVisible = !passwordVisible;
                                },
                              );
                            },
                          )
                        : null,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
