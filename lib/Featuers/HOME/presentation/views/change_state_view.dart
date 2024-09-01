import 'package:dashboard/Core/utils/get_csfr_token.dart';
import 'package:dashboard/Featuers/HOME/presentation/view_models/add_medicine_cubit/add_medicine_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../Core/utils/app_router.dart';
import '../../../../../Core/utils/assets_data.dart';
import '../../../../../Core/utils/my_text_styles.dart';

import '../../../../../Core/utils/service_locator.dart';
import '../../../../../Core/utils/shared_preferences.dart';
import '../../../../../Core/widgets/widgets/custom_button.dart';
import '../../../../../Core/widgets/widgets/custom_error_widget.dart';
import '../../../../../Core/widgets/widgets/custom_input_field.dart';
import '../../../../../Core/widgets/widgets/custom_loading_indecator.dart';
import '../../../../../constants.dart';
import '../view_models/change_state_cubit/change_state_cubit.dart';

class ChangeStateView extends StatefulWidget {
  final String id;
  const ChangeStateView({super.key, required this.id});

  @override
  State<ChangeStateView> createState() => _ChangeStateViewState();
}

class _ChangeStateViewState extends State<ChangeStateView> {
  late final ChangeStateCubit changeStateCubit;
  late final String? csfrToken;
  void initShared() async {
    await SharedPref.init();
  }

  @override
  void initState() {
    changeStateCubit = BlocProvider.of<ChangeStateCubit>(context);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final TextEditingController paymentStateController =
        TextEditingController();
    final TextEditingController reciveStateController = TextEditingController();

    return BlocConsumer<ChangeStateCubit, ChangeStateState>(
      listener: (context, state) {
        if (state is ChangeStateSuccess) {
          // ignore: avoid_print
          print("the orders is changed it's state!");
          print(state.info.status);

          // ignore: prefer_interpolation_to_compose_strings, avoid_print

          // ignore: avoid_print

          showDialog(
            context: context,
            builder: (_) => AlertDialog(
              backgroundColor: kprimecolor,
              title: const Text(
                "Success",
                style: TextStyle(
                    fontSize: MyTextStyles.bigTextSize,
                    fontWeight: MyTextStyles.thinTextWeight),
              ),
              content: const Text("We change the State of the  order",
                  style: TextStyle(fontWeight: MyTextStyles.thinTextWeight)),
              actions: [
                TextButton(
                  style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(kSoftPink)),
                  child: const Text(
                    "OK",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: MyTextStyles.thinTextWeight),
                  ),
                  onPressed: () {
                    GoRouter.of(context).pushReplacement(
                      AppRouter.kAllRequestsView,
                    );
                  },
                ),
              ],
            ),
          );
        }
      },
      builder: (context, state) {
        if (state is ChangeStateInitial) {
          return Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: kPrimaryColor,
              bottom: const PreferredSize(
                preferredSize: Size.fromHeight(0.1),
                child: Divider(color: borderColor, height: 0.1),
              ),
              leading: BackButton(
                color: kprimecolor,
                onPressed: () {
                  GoRouter.of(context)
                      .pushReplacement(AppRouter.kAllRequestsView);
                },
              ),
              title: const Text(
                'Change State',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: MyTextStyles.thinTextWeight),
              ),
            ),
            body: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      left: size.width * sidesmargin,
                      right: size.width * sidesmargin,
                      bottom: size.width * sidesmargin,
                    ),
                    child: RichText(
                      text: const TextSpan(
                        style: TextStyle(
                          fontSize: MyTextStyles.bigTextSize,
                          fontWeight: FontWeight.bold,
                          shadows: [MyTextStyles.textShadow],
                        ),
                        children: [
                          TextSpan(
                            text: 'change\n',
                            style: TextStyle(
                                color: MyTextStyles.mytextColor,
                                fontStyle: FontStyle.italic),
                          ),
                          TextSpan(
                            text: 'The State ',
                            style: TextStyle(
                                color: MyTextStyles.mytextColor,
                                fontStyle: FontStyle.italic),
                          ),
                          TextSpan(
                            text: 'of the Order',
                            style: TextStyle(
                                color: MyTextStyles.mytextColor,
                                fontStyle: FontStyle.italic),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomInputField(
                    size: size,
                    mobilenumberController: paymentStateController,
                    hintText: "enter the new  payment state",
                    labelText: "enter the new  payment state",
                    fieldColor: kprimecolor,
                    icon: Icons.abc,
                    isObscure: false,
                  ),
                  CustomInputField(
                    size: size,
                    mobilenumberController: reciveStateController,
                    hintText: "enter the new recive state ",
                    labelText: "enter the new recive state",
                    fieldColor: kprimecolor,
                    icon: Icons.abc,
                    isObscure: false,
                  ),
                  Container(
                      margin: EdgeInsets.only(
                        left: size.width * sidesmargin,
                        right: size.width * sidesmargin,
                        bottom: size.width * sidesmargin,
                      ),
                      child: CustomButton(
                        text: 'ChangeState',
                        onPressed: () {
                          //             GoRouter.of(context).pushReplacement(AppRouter.kHomeView,
                          // extra: 'Admin');
                          changeStateCubit.changeState(
                              id: widget.id,
                              paymentState: paymentStateController.text,
                              receiveState: reciveStateController.text);
                        },
                        width: double.maxFinite,
                        height: size.height * 0.064,
                      ))
                ],
              ),
            ),
          );
        } else if (state is ChangeStateFailure) {
          return CustomErrorWidget(errMessage: state.errMessage);
        } else {
          return const CustomLoadingIndecator();
        }
      },
    );
  }
}
