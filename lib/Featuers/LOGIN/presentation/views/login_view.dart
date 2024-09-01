import 'package:dashboard/Core/utils/assets_data.dart';
import 'package:dashboard/Core/utils/my_text_styles.dart';
import 'package:dashboard/Featuers/LOGIN/presentation/views/widgets/login_body.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return const Scaffold(
      body: LoginBody(),
    );
  }
}
