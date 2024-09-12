import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:klontong_app/styles/colors.dart';

InputDecoration inputDecoration(String hint) => InputDecoration(
      filled: true,
      fillColor: Colors.white,
      hintText: hint,
      hintStyle: GoogleFonts.poppins(
        color: Colors.grey,
        fontWeight: FontWeight.w400,
        fontSize: 16,
      ),
      errorStyle: GoogleFonts.poppins(
        color: Colors.red,
        fontWeight: FontWeight.w400,
        fontSize: 12,
      ),
      contentPadding:
          const EdgeInsets.only(top: 16, bottom: 16, left: 16, right: 16),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: textColor),
        borderRadius: BorderRadius.circular(15.0),
      ),
      focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: const BorderSide(color: Colors.red)),
      errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: const BorderSide(color: Colors.red)),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: const BorderSide(color: themeColor)),
      border: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(15.0),
      ),
    );
