import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ChattyTextStyles {
  /// ----------------
  /// CHAT SCREEN
  /// ----------------
  static final chatWelcome = GoogleFonts.nunito(
    color: Colors.grey,
    fontSize: 18.sp,
    fontWeight: FontWeight.w500,
    height: 1.25,
  );
  static final chatWelcomeChatty = GoogleFonts.nunito(
    color: Colors.white,
    fontSize: 36.sp,
    fontWeight: FontWeight.w700,
    height: 1.25,
  );
  static final chatRecentChats = GoogleFonts.nunito(
    color: Colors.blueGrey[900],
    fontSize: 24.sp,
    fontWeight: FontWeight.w700,
    height: 1.25,
  );
  static final chatUserIconLetter = GoogleFonts.nunito(
    color: Colors.blueGrey[700],
    fontSize: 24.sp,
    fontWeight: FontWeight.w700,
    height: 1.25,
  );
  static final chatIconLetter = GoogleFonts.nunito(
    color: Colors.white,
    fontSize: 24.sp,
    fontWeight: FontWeight.w700,
    height: 1.25,
  );
  static final chatUsername = GoogleFonts.nunito(
    color: Colors.blueGrey[700],
    fontSize: 20.sp,
    fontWeight: FontWeight.w800,
    height: 1.25,
  );
  static final chatMessage = GoogleFonts.nunito(
    color: Colors.blueGrey[700],
    fontSize: 16.sp,
    fontWeight: FontWeight.w500,
    height: 1.25,
  );
  static final chatTime = GoogleFonts.nunito(
    color: Colors.blueGrey[700],
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
    height: 1.25,
  );
}
