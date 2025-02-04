import 'package:propswift/config/routes/navigation.dart';
import 'package:propswift/config/routes/routes.dart';
import 'package:propswift/config/validation/textfield_validation.dart';
import 'package:propswift/core/config/app_color/app_colors.dart';
import 'package:propswift/core/utils/hive_functions/hive_services.dart';
import 'package:propswift/core/utils/responsive_size/responsive_screen.dart';
import 'package:propswift/core/utils/responsive_size/rsp_textstyle.dart';
import 'package:propswift/data/source/local/hive_database.dart/user_model.dart';
import 'package:propswift/features/bloc/bloc/signup_page/bloc/signup_page_bloc.dart';
import 'package:propswift/features/widgets/space_widget.dart';
import 'package:propswift/features/widgets/text/custom_text.dart';
import 'package:propswift/features/widgets/text/subtitle_text.dart';
import 'package:propswift/features/widgets/text/title_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phonenumerController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      body: BlocBuilder<SignupPageBloc, SignupPageState>(
        builder: (context, state) {
          return SafeArea(
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SpaceWidget(
                      ctx: context,
                      height: 10,
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(
                            Icons.arrow_back_ios,
                          ),
                        ),
                      ],
                    ),
                    SpaceWidget(
                      ctx: context,
                      height: 10,
                    ),
                    CustomText(
                      text: "Let’s Get Started!",
                      fontsize: 24,
                      textColor: FontColor.blackColor,
                      fontWeight: FontWeight.w600,
                    ),
                    SpaceWidget(
                      ctx: context,
                      height: 30,
                    ),
                    SubtitleText(
                      text:
                          "Create an account on PropSwift to get all features",
                      fontWeight: FontWeight.w400,
                    ),
                    SpaceWidget(
                      ctx: context,
                      height: 20,
                    ),
                    SizedBox(
                      // color: AppColor.textFormFieldColor,
                      height: 61.rh(context),
                      width: 340.rw(context),
                      child: OverflowBar(
                        alignment: MainAxisAlignment.spaceAround,
                        children: [
                          Wrap(
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children: [
                              SubtitleText(
                                text: "Customer",
                                fontWeight: FontWeight.w400,
                              ),
                              Radio(
                                value: 1,
                                groupValue: state.selectedRadio,
                                activeColor: AppColor.primary,
                                onChanged: (val) {
                                  context.read<SignupPageBloc>().add(
                                      OnRadioButtonTapped(
                                          selectedButton: val!));
                                  // print("Radio $val");
                                  // setSelectedRadio(val!);
                                },
                              ),
                            ],
                          ),
                          Wrap(
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children: [
                              SubtitleText(
                                  text: "Agent", fontWeight: FontWeight.w400),
                              Radio(
                                value: 2,
                                groupValue: state.selectedRadio,
                                activeColor: AppColor.primary,
                                onChanged: (val) {
                                  context.read<SignupPageBloc>().add(
                                      OnRadioButtonTapped(
                                          selectedButton: val!));
                                  // print("Radio $val");
                                  // setSelectedRadio(val!);
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      color: AppColor.textFormFieldColor,
                      height: 61.rh(context),
                      width: 340.rw(context),
                      child: TextFormField(
                        validator: (value) {
                          final data = TextFormFieldValidation.nameValidation(
                              value: value!);
                          if (value == null || value == "") {
                            return data;
                          }
                        },
                        controller: _nameController,
                        decoration: inputMethod(
                          hintText: "Name",
                          icon: Icons.person,
                          needSuffixIcon: false,
                        ),
                      ),
                    ),
                    SpaceWidget(
                      ctx: context,
                      height: 20,
                    ),
                    Container(
                      color: AppColor.textFormFieldColor,
                      height: 61.rh(context),
                      width: 340.rw(context),
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          final data =
                              TextFormFieldValidation.phoneNumberValidation(
                                  value: value!);
                          if (value == null || value == "") {
                            return data;
                          }
                        },
                        controller: _phonenumerController,
                        decoration: inputMethod(
                            hintText: "Phone number",
                            icon: Icons.phone,
                            needSuffixIcon: false),
                      ),
                    ),
                    SpaceWidget(
                      ctx: context,
                      height: 20,
                    ),
                    Container(
                      color: AppColor.textFormFieldColor,
                      height: 61.rh(context),
                      width: 340.rw(context),
                      child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          final data = TextFormFieldValidation.emailValidation(
                              value: value!);
                          if (value == null || value == "") {
                            return data;
                          }
                        },
                        controller: _emailController,
                        decoration: inputMethod(
                            hintText: "Email",
                            icon: Icons.email,
                            needSuffixIcon: false),
                      ),
                    ),
                    SpaceWidget(
                      ctx: context,
                      height: 20,
                    ),
                    Container(
                      color: AppColor.textFormFieldColor,
                      height: 61.rh(context),
                      width: 340.rw(context),
                      child: TextFormField(
                        obscureText: state.obscureText1,
                        validator: (value) {
                          final data =
                              TextFormFieldValidation.passwordValidation(
                                  value: value!);
                          if (value == null || value == "") {
                            return data;
                          }
                        },
                        controller: _passwordController,
                        decoration: inputMethod(
                            hintText: "Password",
                            icon: Icons.lock,
                            needSuffixIcon: true,
                            isVisible: state.obscureText1,
                            onpressed: () {
                              context
                                  .read<SignupPageBloc>()
                                  .add(ObscureTextOne());
                            }),
                      ),
                    ),
                    SpaceWidget(
                      ctx: context,
                      height: 20,
                    ),
                    Container(
                      color: AppColor.textFormFieldColor,
                      height: 61.rh(context),
                      width: 340.rw(context),
                      child: TextFormField(
                        obscureText: state.obscureText2,
                        validator: (value) {
                          if (_passwordController.text.isNotEmpty) {
                            if (_passwordController.text !=
                                _confirmPasswordController.text) {
                              return 'Password mismatch';
                            }
                          }
                        },
                        controller: _confirmPasswordController,
                        decoration: inputMethod(
                          hintText: "Confirm Password",
                          icon: Icons.lock,
                          needSuffixIcon: true,
                          isVisible: state.obscureText2,
                          onpressed: () {
                            context
                                .read<SignupPageBloc>()
                                .add(ObscureTextTwo());
                          },
                        ),
                      ),
                    ),
                    SpaceWidget(
                      ctx: context,
                      height: 20,
                    ),
                    InkWell(
                      onTap: () async {
                        ScaffoldMessenger.maybeOf(context)!.clearSnackBars();
                        if (state.selectedRadio != 0) {
                          if (_formKey.currentState!.validate()) {
                            final newUser = User(
                              name: _nameController.text,
                              email: _emailController.text,
                              password: _passwordController.text,
                              phoneNumber: _phonenumerController.text,
                              userType: state.selectedRadio,
                            );
                            HiveServices hiveServices = HiveServices();
                            await hiveServices.addUser(newUser);
                            ScaffoldMessenger.maybeOf(context)!.showSnackBar(
                              SnackBar(
                                backgroundColor: AppColor.primary,
                                content: SubtitleText(
                                  text: "Account created successfully",
                                  color: FontColor.whiteColor,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            );
                            context.mounted ? Navigator.pop(context) : null;
                          }
                        } else {
                          ScaffoldMessenger.maybeOf(context)!.showSnackBar(
                            SnackBar(
                              backgroundColor: AppColor.redAccentColor,
                              content: SubtitleText(
                                text: 'Please select a category',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          );
                          // print("radio button is not selected");
                        }
                      },
                      child: Container(
                        height: 61.rh(context),
                        width: 200.rw(context),
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.rf(context))),
                          gradient: LinearGradient(
                            colors: [AppColor.linearStart, AppColor.linearEnd],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                        ),
                        child: Center(
                          child: TitleText(
                            text: "CREATE",
                            fontWeight: FontWeight.w600,
                            color: FontColor.whiteColor,
                          ),
                        ),
                      ),
                    ),
                    SpaceWidget(
                      ctx: context,
                      height: 20,
                    ),
                    Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        TitleText(
                          text: "Already have an account? ",
                          fontWeight: FontWeight.w400,
                        ),
                        InkWell(
                          onTap: () {
                            NavigationService.navigateTo(
                              context: context,
                              routeName: Routes.signinPage,
                              navigationType: NavType.push,
                            );
                          },
                          child: TitleText(
                            text: "Login here",
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  inputMethod(
      {required String hintText,
      required IconData icon,
      required bool needSuffixIcon,
      bool? isVisible,
      Function()? onpressed}) {
    return InputDecoration(
      suffixIcon: needSuffixIcon
          ? IconButton(
              onPressed: onpressed,
              icon: Icon(isVisible! ? Icons.visibility : Icons.visibility_off))
          : SizedBox(),
      // fillColor: AppColor.greyTextShade,
      prefixIcon: Icon(icon),
      hintText: hintText, //"Username",
      enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          color: AppColor.greyColor,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: AppColor.greyColor,
        ),
      ),
    );
  }
}
