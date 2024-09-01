import 'package:dashboard/Core/utils/app_router.dart';
import 'package:dashboard/Featuers/HOME/presentation/view_models/all_requests_cubit/all_requests_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../Core/utils/my_text_styles.dart';
import '../../../../Core/widgets/widgets/custom_error_widget.dart';
import '../../../../Core/widgets/widgets/custom_loading_indecator.dart';
import '../../../../constants.dart';
import '../../data/models/all_requests_model.dart';

class AllRequestView extends StatefulWidget {
  const AllRequestView({super.key});

  @override
  State<AllRequestView> createState() => _AllRequestViewState();
}

class _AllRequestViewState extends State<AllRequestView> {
  @override
  void initState() {
    BlocProvider.of<AllRequestsCubit>(context).fetchAllRequests();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                BlocProvider.of<AllRequestsCubit>(context).reset();
                GoRouter.of(context).pushReplacement(AppRouter.kHomeView , extra: 'Admin');
              },
              icon: const Icon(
                Icons.arrow_back,
                color: kprimecolor,
              )),
          elevation: 0,
          backgroundColor: kPrimaryColor,
          bottom: const PreferredSize(
            preferredSize: Size.fromHeight(0.1),
            child: Divider(color: borderColor, height: 0.1),
          ),
          title: Row(
            children: [
              const Text('All Requests',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: MyTextStyles.thinTextWeight,
                  )),
              const SizedBox(width: 3.0),
              Container(
                margin: const EdgeInsets.only(top: 12),
                width: 7.0,
                height: 7.0,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: kprimecolor,
                ),
              ),
            ],
          ),
        ),
        body: BlocBuilder<AllRequestsCubit, AllRequestsState>(
          builder: (context, state) {
            if (state is AllRequestsSuccess) {
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      //height: size.height,
                      // width: size.width,
                      child: ListView.builder(
                        itemCount: state.myRequests!.length,
                        physics: const PageScrollPhysics(
                            parent: BouncingScrollPhysics()),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          Requests request = state.myRequests![index];
                          return GestureDetector(
                            onTap: () {
                              GoRouter.of(context).pushReplacement(
                                  AppRouter.kChangeStateView,
                                  extra: '${request.id}');

                              BlocProvider.of<AllRequestsCubit>(context)
                                  .reset();
                            },
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: size.width * sidesmargin,
                                  vertical: size.height * verticalMargin),
                              child: Card(
                                color: kSoftPink,
                                shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(curvInHomeView),
                                  side: const BorderSide(
                                    color: borderColor,
                                    width: 1.0,
                                  ),
                                ),
                                elevation: 2,
                                margin: const EdgeInsets.only(
                                  //bottom: 14,
                                  left: sidesmargin,
                                  right: sidesmargin,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        ' payment State: ${request.paymentState}',
                                        style: const TextStyle(
                                            fontSize: 20.0,
                                            fontWeight:
                                                MyTextStyles.thinTextWeight,
                                            color: Colors.black),
                                      ),
                                      const SizedBox(height: 8.0),
                                      Text(
                                        ' order id: ${request.id}',
                                        style: const TextStyle(
                                            fontSize: 20.0,
                                            fontWeight:
                                                MyTextStyles.thinTextWeight,
                                            color: Colors.black),
                                      ),
                                      const SizedBox(height: 8.0),
                                      Text(
                                        'Receive State ${request.receiveState}',
                                        style: const TextStyle(
                                            fontSize: 20.0,
                                            fontWeight:
                                                MyTextStyles.thinTextWeight,
                                            color: Colors.black),
                                      ),
                                      const SizedBox(height: 8.0),
                                      Text(
                                        'price : ${request.price}',
                                        style: const TextStyle(
                                            fontSize: 20.0,
                                            fontWeight:
                                                MyTextStyles.thinTextWeight,
                                            color: Colors.black),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              );
            } else if (state is AllRequestsFailure) {
              return CustomErrorWidget(errMessage: state.errMessage);
            } else {
              return const CustomLoadingIndecator();
            }
          },
        ));
  }
}
