import 'package:flutter/material.dart';

class AppLocalizations {
  final Locale locale;
  AppLocalizations([this.locale = const Locale('en')]);

  String get contactInfo => 'Contact Info';
  String get settings => 'Settings';
  String get editProfile => 'Edit Profile';
  String get email => 'Email';
  String get phone => 'Phone';
  String get location => 'Location';
  String get language => 'Language';
  String get englishLabel => 'English';
  String get arabicLabel => 'Arabic';
  String get theme => 'Theme';
  String get logout => 'Logout';
  String get save => 'Save';
  String get profileUpdated => 'Profile updated';
  String get name => 'Name';
  String get bio => 'Bio';
}