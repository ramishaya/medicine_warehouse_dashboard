import 'package:dashboard/Featuers/HOME/presentation/views/widgets/home_body.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  final String userName;
  const HomeView({super.key , required this.userName});

  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      body:  HomeBody(userName: 'Admin'),
    );
  }
}
