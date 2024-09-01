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

class AddMedicineView extends StatefulWidget {
  const AddMedicineView({super.key});

  @override
  State<AddMedicineView> createState() => _AddMedicineViewState();
}

class _AddMedicineViewState extends State<AddMedicineView> {
  late final AddMedicineCubit addMedicineCubit;
  late final String? csfrToken;
  void initShared() async {
    await SharedPref.init();
  }

  @override
  void initState() {
    addMedicineCubit = BlocProvider.of<AddMedicineCubit>(context);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final TextEditingController scNameController = TextEditingController();
    final TextEditingController coNameController = TextEditingController();
    final TextEditingController catController = TextEditingController();
    final TextEditingController manfController = TextEditingController();
    final TextEditingController qutController = TextEditingController();
    final TextEditingController dateController = TextEditingController();
    final TextEditingController priceController = TextEditingController();

    return BlocConsumer<AddMedicineCubit, AddMedicineState>(
      listener: (context, state) {
        if (state is AddMedicineSuccess) {
          // ignore: avoid_print
          print("Adding medicine is success!");
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
              content: const Text("Medicine has been added to the System",
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
                    GoRouter.of(context)
                        .pushReplacement(AppRouter.kHomeView, extra: 'Admin');
                  },
                ),
              ],
            ),
          );
        }
      },
      builder: (context, state) {
        if (state is AddMedicineInitial) {
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
                  BlocProvider.of<AddMedicineCubit>(context).reset();
                  GoRouter.of(context)
                      .pushReplacement(AppRouter.kHomeView, extra: 'Admin');
                },
              ),
              title: const Text(
                'Add Medicine',
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
                            text: 'Add\n',
                            style: TextStyle(
                                color: MyTextStyles.mytextColor,
                                fontStyle: FontStyle.italic),
                          ),
                          TextSpan(
                            text: 'Medicine ',
                            style: TextStyle(
                                color: MyTextStyles.mytextColor,
                                fontStyle: FontStyle.italic),
                          ),
                          TextSpan(
                            text: 'to your wharehouse',
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
                    mobilenumberController: scNameController,
                    hintText: "Enter scientific_name Name",
                    labelText: "Enter scientific_name Name",
                    fieldColor: kprimecolor,
                    icon: Icons.abc,
                    isObscure: false,
                  ),
                  CustomInputField(
                    size: size,
                    mobilenumberController: coNameController,
                    hintText: "Enter the commercial Name",
                    labelText: "Enter the commercial Name",
                    fieldColor: kprimecolor,
                    icon: Icons.abc,
                    isObscure: false,
                  ),
                  CustomInputField(
                    size: size,
                    mobilenumberController: catController,
                    hintText: "Enter the Category",
                    labelText: "Enter the Category",
                    fieldColor: kprimecolor,
                    icon: Icons.medical_information,
                    isObscure: false,
                  ),
                  CustomInputField(
                    size: size,
                    mobilenumberController: manfController,
                    hintText: "Enter the Manufactor",
                    labelText: "Enter the Manufactor",
                    fieldColor: kprimecolor,
                    icon: Icons.flag,
                    isObscure: false,
                  ),
                  CustomInputField(
                    size: size,
                    mobilenumberController: qutController,
                    hintText: "Enter the Quantity",
                    labelText: "Enter the Quatitiy",
                    fieldColor: kprimecolor,
                    icon: Icons.production_quantity_limits,
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    isObscure: false,
                  ),
                  CustomInputField(
                    size: size,
                    mobilenumberController: dateController,
                    hintText: "Enter the Date",
                    labelText: "Enter the Date",
                    fieldColor: kprimecolor,
                    icon: Icons.date_range,
                    keyboardType: TextInputType.number,
                    isObscure: false,
                  ),
                  CustomInputField(
                    size: size,
                    mobilenumberController: priceController,
                    hintText: "Enter the price",
                    labelText: "Enter the price",
                    fieldColor: kprimecolor,
                    icon: Icons.monetization_on,
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    isObscure: false,
                  ),
                  Container(
                      margin: EdgeInsets.only(
                        left: size.width * sidesmargin,
                        right: size.width * sidesmargin,
                        bottom: size.width * sidesmargin,
                      ),
                      child: CustomButton(
                        text: 'AddMedicine',
                        onPressed: () {
                          //             GoRouter.of(context).pushReplacement(AppRouter.kHomeView,
                          // extra: 'Admin');
                          addMedicineCubit.addMedicine(
                              commercialName: coNameController.text,
                              scientificName: scNameController.text,
                              cat: catController.text,
                              manufacturer: manfController.text,
                              quantity: qutController.text,
                              princ: priceController.text,
                              expireDate: dateController.text);
                        },
                        width: double.maxFinite,
                        height: size.height * 0.064,
                      ))
                ],
              ),
            ),
          );
        } else if (state is AddMedicineFailure) {
          return CustomErrorWidget(errMessage: state.errMessage);
        } else {
          return const CustomLoadingIndecator();
        }
      },
    );
  }
}
