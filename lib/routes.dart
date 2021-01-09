import 'package:get/route_manager.dart';
import 'package:traki/pages/login.dart';
import 'package:traki/pages/profile.dart';
import 'package:traki/pages/register.dart';

var routes = [
  GetPage(name: "/login", page: () => Login()),
  GetPage(name: "/profile", page: () => Profile()),
  GetPage(name: "/register", page: () => Register())
];
