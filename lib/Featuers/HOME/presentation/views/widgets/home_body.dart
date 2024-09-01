import 'package:dashboard/Featuers/HOME/presentation/views/widgets/user_icon.dart';
import 'package:dashboard/Featuers/HOME/presentation/views/widgets/user_welcome_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../Core/utils/app_router.dart';

import '../../../../../Core/utils/my_text_styles.dart';
import '../../../../../constants.dart';
import 'header.dart';
import 'home_welcome_card.dart';

class HomeBody extends StatefulWidget {
  final String userName;
  const HomeBody({super.key, required this.userName});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  @override
  void initState() {
    //       BlocProvider.of<MyRequestsCubit>(context).reset();
    // BlocProvider.of<AllMedicinesCubit>(context).fetchAllMedicinesCategories();
    super.initState();
  }

  final TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: size.width * sidesmargin,
                  vertical: size.height * verticalMargin),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    UserWelcomeText(widget: widget),
                    const UserIcon()
                  ]),
            ),
            HomeWelcomeCard(size: size),
            SizedBox(
              height: size.height * 0.007,
            ),
            Header(size: size),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: size.width * sidesmargin,
                  vertical: size.height * verticalMargin),
              child: Container(
                padding: EdgeInsets.all(size.width * 0.047),
                decoration: BoxDecoration(
                    color: kSoftPink,
                    borderRadius: BorderRadius.circular(curvInHomeView)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onTap: () {
                                GoRouter.of(context).pushReplacement(
                                  AppRouter.kAllRequestsView,
                                );
                              },
                              child: Container(
                                padding: EdgeInsets.all(size.width * 0.04),
                                decoration: BoxDecoration(
                                    color: kprimecolor,
                                    borderRadius:
                                        BorderRadius.circular(curvInHomeView)),
                                child: const Center(
                                    child: Text(
                                  "All Request",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: MyTextStyles.thinTextWeight),
                                )),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(width: size.width * 0.04),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onTap: (){
                                  GoRouter.of(context).pushReplacement(
                                  AppRouter.kAddMedicineView,
                                );
                              },
                              child: Container(
                                padding: EdgeInsets.all(size.width * 0.04),
                                decoration: BoxDecoration(
                                    color: kprimecolor,
                                    borderRadius:
                                        BorderRadius.circular(curvInHomeView)),
                                child: const Center(
                                    child: Text(
                                  "Add Medicine",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: MyTextStyles.thinTextWeight),
                                )),
                              ),
                            )
                          ],
                        ),
                      )
                    ]),
                  
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
