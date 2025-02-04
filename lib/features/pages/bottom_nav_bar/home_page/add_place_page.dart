import 'package:propswift/config/image_path/image_path.dart';
import 'package:propswift/config/validation/textfield_validation.dart';
import 'package:propswift/core/config/app_color/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:propswift/core/utils/hive_functions/hive_services.dart';
import 'package:propswift/core/utils/responsive_size/responsive_screen.dart';
import 'package:propswift/core/utils/responsive_size/rsp_textstyle.dart';
import 'package:propswift/data/source/local/hive_database.dart/user_model.dart';
import 'package:propswift/data/source/local/shared_pref/shared_preference.dart';
import 'package:propswift/features/widgets/space_widget.dart';
import 'package:propswift/features/widgets/text/custom_text.dart';
import 'package:propswift/features/widgets/text/subtitle_text.dart';
import 'package:propswift/features/widgets/text/title_text.dart';

class AddPlacePage extends StatefulWidget {
  const AddPlacePage({super.key});

  @override
  State<AddPlacePage> createState() => _AddPlacePageState();
}

class _AddPlacePageState extends State<AddPlacePage> {
  final TextEditingController _placeNameController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              SpaceWidget(
                ctx: context,
                height: 30,
              ),
              Container(
                height: height * 0.14,
                width: width * 0.75,
                decoration: BoxDecoration(
                  // color: AppColor.secondContainerColor,
                  borderRadius: BorderRadius.circular(35.rf(context)),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.rw(context)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            icon: Icon(
                              Icons.sort,
                              size: 40.rf(context),
                            ),
                            onPressed: () {
                              Scaffold.of(context).openDrawer();
                            },
                          ),
                          SizedBox(
                              // color: Colors.green,
                              height: width * 0.2,
                              child: Image.asset(ImagePath.aiLogo)),
                          CircleAvatar(
                            radius: 20.rf(context),
                            child: Center(
                              child: Icon(Icons.person),
                            ),
                          )
                        ],
                      ),
                    ),
                    SpaceWidget(
                      ctx: context,
                      height: 20,
                    ),
                  ],
                ),
              ),
              SpaceWidget(
                ctx: context,
                height: 50,
              ),
              Padding(
                  padding: EdgeInsets.only(left: 15.rf(context)),
                  child: CustomText(
                      text: 'Add a new place',
                      fontsize: 20,
                      textColor: FontColor.blackColor,
                      fontWeight: FontWeight.w600)
                  // CustomText(
                  //     text: 'Add a new place', fontWeight: FontWeight.w400),
                  ),
              SpaceWidget(
                ctx: context,
                height: 50,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.rw(context)),
                child: Container(
                  color: AppColor.textFormFieldColor,
                  height: 61.rh(context),
                  width: 340.rw(context),
                  child: TextFormField(
                    controller: _placeNameController,
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      final data =
                          TextFormFieldValidation.nameValidation(value: value!);
                      if (value == null || value == "") {
                        return data;
                      }
                    },
                    decoration: inputMethod(
                        hintText: "Place name", child: Icon(Icons.house)),
                  ),
                ),
              ),
              SpaceWidget(
                ctx: context,
                height: 30,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.rw(context)),
                child: Container(
                  color: AppColor.textFormFieldColor,
                  height: 61.rh(context),
                  width: 340.rw(context),
                  child: TextFormField(
                    controller: _amountController,
                    validator: (value) {
                      final data = TextFormFieldValidation.amountValidation(
                          value: value!);
                      if (value == null || value == "") {
                        return data;
                      }
                    },
                    decoration: inputMethod(
                        hintText: "Amount",
                        child: Icon(Icons.attach_money_sharp)),
                  ),
                ),
              ),
              SpaceWidget(
                ctx: context,
                height: 40,
              ),
              Align(
                alignment: Alignment.center,
                child: InkWell(
                  onTap: () async {
                    if (_formKey.currentState!.validate()) {
                      createPlaceButton();
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
                        text: "Add place",
                        fontWeight: FontWeight.w600,
                        color: FontColor.whiteColor,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  createPlaceButton() async {
    try {
      ScaffoldMessenger.maybeOf(context)!.clearSnackBars();
      final userDetails = await SharedPreferce.getUser();

      int userId = userDetails!.id;
      int userType = userDetails.userType;
      Place place = Place(
        placeName: _placeNameController.text,
        amount: double.parse(_amountController.text),
        addedBy: userId,
        addedPersonUserType: userType,
      );
      HiveServices services = HiveServices();
      await services.addPlaceToUser(userId, place);
      _placeNameController.clear();
      _amountController.clear();
      ScaffoldMessenger.maybeOf(context)!.showSnackBar(
        SnackBar(
          backgroundColor: AppColor.primary,
          content: SubtitleText(
            text: "Saved successfully",
            color: FontColor.whiteColor,
            fontWeight: FontWeight.w400,
          ),
        ),
      );
    } catch (e) {
      print("error is : $e");
    }
  }

  inputMethod({required String hintText, Widget? child}) {
    return InputDecoration(
      prefixIcon: child,
      hintText: hintText,
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
