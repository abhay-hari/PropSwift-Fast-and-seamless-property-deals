import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:propswift/config/image_path/image_path.dart';
import 'package:propswift/config/routes/navigation.dart';
import 'package:propswift/config/routes/routes.dart';
import 'package:propswift/config/validation/textfield_validation.dart';
import 'package:propswift/core/config/app_color/app_colors.dart';
import 'package:propswift/core/utils/hive_functions/hive_services.dart';
import 'package:propswift/core/utils/responsive_size/responsive_screen.dart';
import 'package:propswift/core/utils/responsive_size/rsp_textstyle.dart';
import 'package:propswift/features/bloc/bloc/signin_page/bloc/signin_page_bloc.dart';
import 'package:propswift/features/widgets/space_widget.dart';
import 'package:propswift/features/widgets/text/custom_text.dart';
import 'package:propswift/features/widgets/text/subtitle_text.dart';
import 'package:propswift/features/widgets/text/title_text.dart';
import 'package:flutter/material.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({super.key});
  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  final _formkey = GlobalKey<FormState>();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _passWordController = TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose
    _phoneNumberController.dispose();
    _passWordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Form(
        key: _formkey,
        child: SingleChildScrollView(
          child: BlocBuilder<SigninPageBloc, SigninPageState>(
              builder: (context, state) {
            return Column(
              children: [
                SizedBox(
                  // color: Colors.red,
                  height: MediaQuery.sizeOf(context).height / 5,
                  width: MediaQuery.sizeOf(context).width,
                  child: Stack(
                    children: [
                      // Background container (optional)
                      // Container(color: Colors.white),
                      Positioned(
                        // padding: EdgeInsets.only(
                        right: 70.rw(context),
                        bottom: (MediaQuery.sizeOf(context).height / 5) -
                            150.rh(context),
                        // ),
                        child: Transform.rotate(
                          angle: 110 * 3.14 / 180,
                          child: Container(
                            height: MediaQuery.sizeOf(context).height *
                                0.41, //306.rf(context),
                            width: 171.rf(context),
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30)),
                              color:
                                  AppColor.secondContainerColor, //Colors.blue,
                            ),
                          ),
                        ),
                      ),
                      // Top half colored container
                      Positioned(
                        // padding: EdgeInsets.only(
                        left: 25.rw(context),
                        bottom: (MediaQuery.sizeOf(context).height / 5) -
                            150.rh(context),
                        // ),
                        child: Transform.rotate(
                          angle: 110 * 3.14 / 180,
                          child: Container(
                            height: MediaQuery.sizeOf(context).height *
                                0.40, //285.rf(context),
                            width: 171.rf(context),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(30.rf(context))),
                              color:
                                  AppColor.firstContainerColor, //Colors.blue,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 100.rh(context),
                  child: Image.asset(ImagePath.logoImage),
                ),
                SpaceWidget(
                  ctx: context,
                  height: 40,
                ),
                CustomText(
                    text: "Welcome back!",
                    fontsize: 28,
                    textColor: FontColor.blackColor,
                    fontWeight: FontWeight.w600),
                SpaceWidget(
                  ctx: context,
                  height: 10,
                ),
                SubtitleText(
                  text: "Log in to existing PropSwift account",
                  fontWeight: FontWeight.w300,
                  color: FontColor.greyTextShade,
                ),
                SpaceWidget(
                  ctx: context,
                  height: 40,
                ),
                Container(
                  color: AppColor.textFormFieldColor,
                  height: 61.rh(context),
                  width: 340.rw(context),
                  child: TextFormField(
                    keyboardType: TextInputType.phone,
                    controller: _phoneNumberController,
                    validator: (value) {
                      final data =
                          TextFormFieldValidation.phoneNumberValidation(
                              value: value!);
                      if (value == null || value == "") {
                        return data;
                      }
                    },
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
                    controller: _passWordController,
                    validator: (value) {
                      final data = TextFormFieldValidation.passwordValidation(
                          value: value!);
                      if (value == null || value == "") {
                        return data;
                      }
                    },
                    obscureText: state.obsucreText,
                    decoration: inputMethod(
                        hintText: "Password",
                        icon: Icons.lock,
                        needSuffixIcon: true,
                        isVisible: state.obsucreText,
                        onpressed: () {
                          context
                              .read<SigninPageBloc>()
                              .add(ChangeObscureText());
                        }),
                  ),
                ),
                SpaceWidget(
                  ctx: context,
                  height: 20,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: EdgeInsets.only(right: 25.rw(context)),
                    child: SubtitleText(
                        text: "Forgot Password?", fontWeight: FontWeight.w500),
                  ),
                ),
                SpaceWidget(
                  ctx: context,
                  height: 20,
                ),
                InkWell(
                  onTap: () async {
                    if (_formkey.currentState!.validate()) {
                      final phone = _phoneNumberController.text;
                      final password = _passWordController.text;
                      HiveServices services = HiveServices();
                      final isValid =
                          await services.verifyUser(phone, password);
                      if (isValid) {
                        NavigationService.navigateTo(
                          context: context,
                          routeName: Routes.dashBoardPage,
                          navigationType: NavType.pushAndRemoveUntil,
                        );
                      } else {
                        ScaffoldMessenger.maybeOf(context)!.clearSnackBars();
                        ScaffoldMessenger.maybeOf(context)!.showSnackBar(
                          SnackBar(
                            backgroundColor: AppColor.primary,
                            content: SubtitleText(
                              text: "No user found",
                              color: FontColor.whiteColor,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        );
                      }
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
                        text: "LOG IN",
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
                SubtitleText(
                    text: "Or sign up using ", fontWeight: FontWeight.w700),
                SpaceWidget(
                  ctx: context,
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      ImagePath.facebookIcon,
                      fit: BoxFit.cover,
                    ),
                    SpaceWidget(
                      ctx: context,
                      width: 20,
                    ),
                    Image.asset(
                      ImagePath.googleIcon,
                      fit: BoxFit.cover,
                    ),
                    SpaceWidget(
                      ctx: context,
                      width: 20,
                    ),
                    Image.asset(
                      ImagePath.appleIcon,
                      fit: BoxFit.cover,
                    )
                  ],
                ),
                SpaceWidget(
                  ctx: context,
                  height: 10,
                ),
                Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    TitleText(
                        text: "Don’t have an account?",
                        fontWeight: FontWeight.w400),
                    InkWell(
                        onTap: () {
                          NavigationService.navigateTo(
                              context: context,
                              routeName: Routes.signupPage,
                              navigationType: NavType.push);
                        },
                        child: TitleText(
                            text: " Sign Up", fontWeight: FontWeight.w600)),
                  ],
                )
              ],
            );
          }),
        ),
      ),
    );
  }

  InputDecoration inputMethod(
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
          color: Colors.grey,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.grey,
        ),
      ),
    );
  }
}

// class MyCustomPaint extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     // Paint paint = Paint();
//     // paint.color = Colors.brown;
//     final mountainPaint = Paint()
//       ..color = Colors.brown.shade600
//       ..style = PaintingStyle.fill;
//     final mountainPath = Path()
//       ..moveTo(size.width, size.height * 0.3)
//       ..lineTo(size.width * 0.5, size.height * 0.4)
//       ..lineTo(size.width * 0.4, size.height * 0.4)
//       ..close();
//     canvas.drawPath(mountainPath, mountainPaint);
//   }

//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     return true;
//   }
// }
