import 'package:flutter/material.dart';
import 'tomato-agency/agency.dart';
import 'tomato-agency/result.dart';
import 'login-and-register/login.dart';
import 'login-and-register/portal.dart';
import 'login-and-register/register-age.dart';

routes(BuildContext context) => {
  "/tomato": (context) => Agency(),
  "/tomato/result": (context) => ResultPage(),
  "/login": (context) => LoginPage(),
  "/login/register_age": (context) => RegisterAgePage(),
  "/portal": (context) => PortalPage(),
};
