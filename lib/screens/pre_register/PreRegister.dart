import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:super_home_member/config/constanent.dart';
import 'package:super_home_member/config/functions.dart';
import 'package:super_home_member/screens/login/widgets/textField.dart';
import 'package:super_home_member/screens/pre_register/controller/PreRegisterController.dart';
import 'package:super_home_member/screens/rules_regulations/RulesRegulationScreen.dart';
import 'package:super_home_member/screens/widgets/constants.dart';
import 'select_menu_reusable.dart';
import 'widgets/image.dart';

class PreRegister extends StatefulWidget {
  const PreRegister({Key? key}) : super(key: key);
  @override
  State<PreRegister> createState() => _PreRegisterState();
}

class _PreRegisterState extends State<PreRegister> {
  bool isNID = true;
  String _register_by = "NID";
  var controller2 = "data";
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.white.withOpacity(0.0),
        statusBarIconBrightness: Brightness.dark));
    // Get.put(PreRegisterController()).getBranch();
    // Get.put(PreRegisterController()).howtoFindUsFun();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Colors.cyan[600],
          toolbarHeight: 35,
          title: const Text("Pre Register"),
          centerTitle: true),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(defaultPadding / 2),
          child: GetBuilder<PreRegisterController>(
              init: PreRegisterController(),
              initState: (d){
                d.controller?.howtoFindUsFun();
              },
              builder: (controller) {
                return ListView(
                  physics: const BouncingScrollPhysics(),
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 5, 0, 15),
                      child: Center(
                        child: Container(
                          decoration: const BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                            color: Colors.black,
                            width: 2.0, // Underline thickness
                          ))),
                          child: Text(
                            "Fill up this form with your correct information",
                            style: TextStyle(
                              fontSize: 15.5,
                              color: Colors.grey.shade800,
                              fontWeight: FontWeight.w800,
                              shadows: [
                                BoxShadow(
                                  blurRadius: 2,
                                  spreadRadius: 2,
                                  color: Colors.grey.shade300,
                                  offset: const Offset(2, 2),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),

                    Container(
                      decoration: const BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.all(Radius.circular(15.0)),
                          color: DColors.background),
                      child: CustomeTextField(
                        controller: controller.fullName,
                        labelText: "Full Name",
                        hintText: "Enter your full name",
                      ),
                    ),

                    const SizedBox(height: defaultPadding / 1.5),

                    CustomeTextField(
                      controller: controller.fatherName,
                      labelText: "Father Name",
                      hintText: "Enter your father name",
                    ),

                    const SizedBox(height: defaultPadding / 1.5),

                    Container(
                      height: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.cyan[50],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                              padding: const EdgeInsets.fromLTRB(10, 5, 0, 5),
                              child: RichText(
                                text: TextSpan(
                                  text: 'Date Of Birth',
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey.shade800),
                                  children: const <TextSpan>[
                                    TextSpan(
                                      text: '*',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.red,
                                          fontWeight: FontWeight.w900),
                                    ),
                                  ],
                                ),
                              )),
                          //const SizedBox(height: defaultPadding / 2),
                          InkWell(
                            onTap: () async {
                              await controller.pickDate(context);
                            },
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(20, 5, 20, 3),
                              child: Container(
                                height: 43,
                                padding: const EdgeInsets.all(12),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(color: Colors.white),
                                  borderRadius:
                                      BorderRadius.circular(defaultPadding / 4),
                                ),
                                child: RichText(
                                    text: TextSpan(children: [
                                  const WidgetSpan(
                                    child: Icon(
                                      Icons.calendar_month_rounded,
                                      color: Colors.cyan,
                                      size: 18,
                                    ),
                                  ),
                                  TextSpan(
                                      text:
                                          ' ${numToMonth("${controller.dateOfBirth.day}/${controller.dateOfBirth.month}/${controller.dateOfBirth.year}")}',
                                      style: TextStyle(
                                          color: Colors.grey.shade800,
                                          fontSize: 14))
                                ])),
                              ),
                            ),
                          ),
                          //const SizedBox(height: defaultPadding / 2),
                        ],
                      ),
                    ),

                    const SizedBox(height: defaultPadding / 1.5),

                    SelectCategory(
                      categoryNameReq: 'Marital Status',
                      statusList: controller.maritalStatusList,
                      selectedValue: controller.maritalStatus,
                      onSelected: (s) {
                        controller.selectMaritalStatus(s);
                      },
                      //itemReq: controller.maritalStatusList.map((item) => item).toString(),
                    ),

                    const SizedBox(height: defaultPadding / 1.5),

                    SelectCategory(
                      categoryNameReq: 'Blood Group',
                      statusList: controller.bloodGroupList,
                      selectedValue: controller.bloodGroup,
                      onSelected: (s) {
                        controller.selectBloodGroup(s);
                      },
                      //itemReq: controller.maritalStatusList.map((item) => item).toString(),
                    ),

                    const SizedBox(height: defaultPadding / 1.5),

                    SelectCategory(
                      categoryNameReq: 'Religion',
                      statusList: controller.religionList,
                      selectedValue: controller.religion,
                      onSelected: (s) {
                        controller.selectReligion(s);
                      },
                      //itemReq: controller.maritalStatusList.map((item) => item).toString(),
                    ),

                    const SizedBox(height: defaultPadding / 1.5),

                    SelectCategory(
                      categoryNameReq: 'Occupation',
                      statusList: controller.occupationList,
                      selectedValue: controller.occupation,
                      onSelected: (s) {
                        controller.selectOccupation(s);
                      },
                      //itemReq: controller.maritalStatusList.map((item) => item).toString(),
                    ),

                    const SizedBox(height: defaultPadding / 1.5),

                    SelectCategory(
                      categoryNameReq: 'Educational Qualification',
                      statusList: controller.qualificationList,
                      selectedValue: controller.qualification,
                      onSelected: (s) {
                        controller.selectQualification(s);
                      },
                      //itemReq: controller.maritalStatusList.map((item) => item).toString(),
                    ),

                    const SizedBox(height: defaultPadding / 1.5),

                    /// Phone number /////
                    CustomeTextField(
                      controller: controller.phoneNumber,
                      //labelText: "Phone(Must be exist WhatsApp)",
                      labelText: 'Phone Number',
                      labelText2: "(Must exist WhatsApp number)",
                      hintText: "Enter your phone number",
                      keyboardType: TextInputType.phone,
                      onChanged: ((value) {
                        if (value.length == 11) {
                          controller.isReadyToSendOtp = true;
                          controller.update();
                        } else {
                          if (controller.isReadyToSendOtp) {
                            controller.isReadyToSendOtp = false;
                            controller.update();
                          }
                        }
                      }),
                      suffixIcon: Visibility(
                        visible: controller.isReadyToSendOtp,
                        child: TextButton(
                          onPressed: () {
                            if (controller.phoneNumber.text.length == 11) {
                              controller.phoneValidation();
                            } else {
                              Get.snackbar('Warning',
                                  "Phone number must be required 11 digit",
                                  snackPosition: SnackPosition.BOTTOM,
                                  colorText: Colors.white,
                                  margin: const EdgeInsets.all(8),
                                  backgroundColor: Colors.orange.shade500);
                            }
                          },
                          child: Text(
                            'Send OTP'.toUpperCase(),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: defaultPadding / 1.5),

                    Visibility(
                      visible: controller.isValidPhone.value,
                      child: CustomeTextField(
                        controller: controller.otpController,
                        labelText: "OTP",
                        keyboardType: TextInputType.phone,
                        onChanged: (value) {
                          if (value.length >= 4) controller.otpValidation();
                        },
                        hintText: "Enter otp number",
                      ),
                    ),

                    const SizedBox(height: defaultPadding / 1.5),

                    /// email /////

                    CustomeTextField(
                      controller: controller.email,
                      onChanged: ((value) {
                        if (GetUtils.isEmail(value)) {
                          if (!controller.isEmailSend) {
                            controller.setEmailSend(true);
                            Future.delayed(const Duration(seconds: 1), () {
                              (controller.emailValidation() == true);

                              /// EmailValidator.validate(email)
                            });
                          } else {
                            Future.delayed(const Duration(seconds: 1), () {
                              controller.setEmailSend(true);
                            });
                          }
                        } else {
                          controller.setEmailSend(false);
                        }
                      }),
                      labelText: "Email",
                      hintText: "Enter your email address",
                    ),

                    const SizedBox(height: defaultPadding / 1.5),

                    ///  hkgkhkj //////////////////////////////////////////////////

                    isNID == true
                        ? GestureDetector(
                            onTap: () {
                              setState(() {
                                isNID = false;
                                _register_by = "phone";
                              });
                            },
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Container(
                                width: MediaQuery.of(context).size.width / 3,
                                height: 30,
                                decoration: BoxDecoration(
                                    color: Colors.teal[50],
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(
                                      color: Colors.cyan,
                                    )),
                                child: const Center(
                                  child: Text(
                                    "Use Passport",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xFF515151),
                                        fontFamily: "ceraProMedium",
                                        fontSize: 14),
                                  ),
                                ),
                              ),
                            ))
                        : GestureDetector(
                            onTap: () {
                              setState(() {
                                isNID = true;
                                _register_by = "email";
                              });
                            },
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Container(
                                width: MediaQuery.of(context).size.width / 3,
                                height: 30,
                                decoration: BoxDecoration(
                                    color: Colors.teal[50],
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(
                                      color: Colors.cyan,
                                    )),
                                child: const Center(
                                  child: Text(
                                    "Use NID",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xFF515151),
                                        fontFamily: "ceraProMedium",
                                        fontSize: 14),
                                  ),
                                ),
                              ),
                            ),
                          ),

                    Padding(
                      padding: const EdgeInsets.only(bottom: 4.0),
                      child: isNID == true
                          ? const Text(
                              "NID",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF515151),
                                  fontFamily: "ceraProMedium",
                                  fontSize: 13),
                            )
                          : const Text(
                              "Passport",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF515151),
                                  fontFamily: "ceraProMedium",
                                  fontSize: 13),
                            ),
                    ),

                    CustomeTextField(
                      controller: controller.nid,
                      labelText: "NID/Passport",
                      hintText: "Enter your nid/passport number",
                      keyboardType: TextInputType.phone,
                      onChanged: ((value) => {
                            // 8719637236
                            if (value.length >= 10) {controller.nidValidation()}
                          }),
                    ),
                    const SizedBox(height: defaultPadding / 1.5),

                    // CustomeTextField(
                    //   controller: controller.passportNo,
                    //   labelText: "Passport Number",
                    //   keyboardType: TextInputType.number,
                    //   hintText: "Enter your passport number",
                    // ),

                    // const SizedBox(height: defaultPadding / 1.5),

                    ///            jkhjkh   ///////////////////////////////////////////

                    SelectCategory(
                      categoryNameReq: 'How to know about us',
                      statusList: controller.findUsList,
                      selectedValue: controller.findUs,
                      onSelected: (s) {
                        controller.selectFindUs(s);
                      },
                      //itemReq: controller.maritalStatusList.map((item) => item).toString(),
                    ),

                    const SizedBox(height: defaultPadding / 1.5),

                    Container(
                      decoration: const BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.all(Radius.circular(15.0)),
                          color: DColors.background),
                      child: CustomeTextField(
                        controller: controller.permanentAddress,
                        labelText: "Permanent Address",
                        hintText:
                            "Enter your Village, Post-office, Thana, Zilla",
                      ),
                    ),

                    const SizedBox(height: defaultPadding / 1.5),

                    Container(
                      decoration: const BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.all(Radius.circular(15.0)),
                          color: DColors.background),
                      child: CustomeTextField(
                        controller: controller.presentAddress,
                        labelText: "Present Address",
                        hintText:
                            "Enter your Village, Post-office, Thana, Zilla",
                      ),
                    ),
                    const SizedBox(height: defaultPadding / 1.5),
                    CustomeTextField(
                      controller: controller.eContactName,
                      labelText: "Emergency Contact Name",
                      hintText: "Enter your emergency contact name",
                    ),
                    const SizedBox(height: defaultPadding / 1.5),
                    SelectCategory(
                      categoryNameReq: 'Emergency Contact Relation',
                      statusList: controller.relationList,
                      selectedValue: controller.eContactRelation,
                      onSelected: (s) {
                        controller.selectRelation(s);
                      },
                    ),
                    const SizedBox(height: defaultPadding / 1.5),
                    CustomeTextField(
                      controller: controller.eContactNumber,
                      keyboardType: TextInputType.phone,
                      labelText: "Emergency Contact Phone",
                      hintText: "Enter your emergency contact number",
                    ),
                    const SizedBox(height: defaultPadding / 1.5),
                    CustomeTextField(
                      controller: controller.eContactAddress,
                      labelText: "Emergency Contact Address",
                      hintText: "Enter your emergency contact address",
                    ),
                    const SizedBox(height: defaultPadding / 1.5),
                    ImageUpload(),
                    const SizedBox(height: defaultPadding / 1.5),
                    Row(
                      children: [
                        Checkbox(
                            value: controller.isAgree,
                            onChanged: (value) => controller.setAgree(value)),
                        Expanded(
                          child: RichText(
                            text: TextSpan(
                              children: [
                                const TextSpan(
                                  text:
                                      "By pre booking a service, you agree with our ",
                                  style: TextStyle(color: Colors.black),
                                ),
                                WidgetSpan(
                                    child: InkWell(
                                  onTap: () => Get.to(RulesRegulationScreen()),
                                  child: const Text(
                                    "Rules and Regulation.",
                                    style: TextStyle(color: Colors.blue),
                                  ),
                                ))
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: defaultPadding),
                    Visibility(
                      visible: controller.isValidOtp,
                      child: SizedBox(
                        width: double.infinity,
                        height: 45,
                        child: TextButton(
                          onPressed: () {
                            print(
                                "controller.phoneNumber.text: ${controller.phoneNumber.text}");
                            controller.askPermissions(
                                "member", controller.phoneNumber.text);
                            controller.submit();
                          },
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.cyan[300],
                          ),
                          child: Text(
                            "Submit".toUpperCase(),
                            style: TextStyle(fontWeight: FontWeight.w800),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: defaultPadding),
                  ],
                );
              }),
        ),
      ),
    );
  }
} /*
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:super_home_member/config/constanent.dart';
import 'package:super_home_member/config/functions.dart';
import 'package:super_home_member/screens/login/widgets/textField.dart';
import 'package:super_home_member/screens/pre_register/controller/PreRegisterController.dart';
import 'package:super_home_member/screens/rules_regulations/RulesRegulationScreen.dart';
import 'package:super_home_member/screens/widgets/constants.dart';
import 'select_menu_reusable.dart';
import 'widgets/image.dart';

class PreRegister extends StatelessWidget {
   PreRegister({Key? key}) : super(key: key);
   // final controller = Get.put(PreRegisterController());
  void Validate(String email) {
    bool isvalid = EmailValidator.validate(email);
    print(isvalid);
  }

   var controller2 = "data";

  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.white.withOpacity(0.0),
        statusBarIconBrightness: Brightness.dark));
    Get.put(PreRegisterController()).getBranch();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.cyan[600],
          toolbarHeight:35 ,
          // context: context,
          title: const Text("Pre Register"),centerTitle: true

      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(defaultPadding / 2),
          child: GetBuilder<PreRegisterController>(
              init: PreRegisterController(),
              builder: (controller) {
                var labelText;
                return ListView(
                  physics:  const BouncingScrollPhysics(),
                  children: [

                    Padding(
                      padding: const EdgeInsets.fromLTRB(0,5,0,15),
                      child: Center(
                        child: Container(
                          decoration: const BoxDecoration(
                              border: Border(bottom: BorderSide(
                                color: Colors.black,
                                width: 2.0, // Underline thickness
                              ))
                          ),
                          child: Text("Fill up this form with your correct information",style: TextStyle(
                              fontSize: 15.5,
                              color: Colors.grey.shade800,
                              fontWeight: FontWeight.w800,
                              shadows: [
                                BoxShadow(
                                    blurRadius: 2,
                                    spreadRadius: 2,
                                    color: Colors.grey.shade300,
                                    offset:  const Offset(2, 2),
                                ),
                              ],
                          ),
                          ),
                        ),
                      ),
                    ),


                    Container(
                      decoration: const BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.all(Radius.circular(15.0)),
                          color: DColors.background
                      ),
                      child: CustomeTextField(
                        controller: controller.fullName,
                        labelText: "Full Name",
                        hintText: "Enter your full name",
                      ),
                    ),


                    const SizedBox(height: defaultPadding / 1.5),

                    CustomeTextField(
                      controller: controller.fatherName,
                      labelText: "Father Name",
                      hintText: "Enter your father name",
                    ),

                    const SizedBox(height: defaultPadding / 1.5),


                    Container(
                      height: 80,
                      decoration:  BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.cyan[50],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          Padding(
                            padding: const EdgeInsets.fromLTRB(10,5,0,5),
                            child:  RichText(
                              text: TextSpan(
                                text: 'Date Of Birth',
                                style: TextStyle(fontSize: 14, color: Colors.grey.shade800),
                                children: const <TextSpan>[
                                  TextSpan(text: '*', style: TextStyle(fontSize: 14,color: Colors.red,fontWeight: FontWeight.w900),),
                                ],
                              ),
                            )
                          ),
                          //const SizedBox(height: defaultPadding / 2),
                          InkWell(
                            onTap: () async {
                              await controller.pickDate(context);
                            },
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(20, 5, 20, 3),
                              child: Container(
                                height: 43,
                                padding: const EdgeInsets.all(12),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(color: Colors.white),
                                  borderRadius:
                                  BorderRadius.circular(defaultPadding / 4),
                                ),
                                child: RichText(
                                    text: TextSpan(children: [
                                      const WidgetSpan(
                                        child: Icon(
                                          Icons.calendar_month_rounded,
                                          color: Colors.cyan,
                                          size: 18,
                                        ),
                                      ),
                                      TextSpan(
                                          text:
                                          ' ${numToMonth("${controller.dateOfBirth.day}/${controller.dateOfBirth.month}/${controller.dateOfBirth.year}")}',
                                          style: TextStyle(
                                              color: Colors.grey.shade800, fontSize: 14)
                                      )
                                    ]
                                    )
                                ),
                              ),
                            ),
                          ),
                          //const SizedBox(height: defaultPadding / 2),

                        ],
                      ),
                    ),

                    const SizedBox(height: defaultPadding / 1.5),

                    SelectCategory(
                      categoryNameReq: 'Marital Status',
                      statusList: controller.maritalStatusList,
                      selectedValue: controller.maritalStatus,
                      onSelected: (s ) {controller.selectMaritalStatus(s);  },
                      //itemReq: controller.maritalStatusList.map((item) => item).toString(),
                    ),

                    const SizedBox(height: defaultPadding / 1.5),


                    SelectCategory(
                      categoryNameReq: 'Blood Group',
                      statusList: controller.bloodGroupList,
                      selectedValue: controller.bloodGroup,
                      onSelected: (s ) {controller.selectBloodGroup(s);  },
                      //itemReq: controller.maritalStatusList.map((item) => item).toString(),
                    ),


                    const SizedBox(height: defaultPadding / 1.5),

                    SelectCategory(
                      categoryNameReq: 'Religion',
                      statusList: controller.religionList,
                      selectedValue: controller.religion,
                      onSelected: (s ) {controller.selectReligion(s);  },
                      //itemReq: controller.maritalStatusList.map((item) => item).toString(),
                    ),


                    const SizedBox(height: defaultPadding / 1.5),


                    SelectCategory(
                      categoryNameReq: 'Occupation',
                      statusList: controller.occupationList,
                      selectedValue: controller.occupation,
                      onSelected: (s ) {controller.selectOccupation(s);  },
                      //itemReq: controller.maritalStatusList.map((item) => item).toString(),
                    ),


                    const SizedBox(height: defaultPadding / 1.5),


                    SelectCategory(
                      categoryNameReq: 'Educational Qualification',
                      statusList: controller.qualificationList,
                      selectedValue: controller.qualification,
                      onSelected: (s ) {controller.selectQualification(s);  },
                      //itemReq: controller.maritalStatusList.map((item) => item).toString(),
                    ),


                    const SizedBox(height: defaultPadding / 1.5),

                    /// Phone number /////
                    CustomeTextField(
                      controller: controller.phoneNumber,
                      //labelText: "Phone(Must be exist WhatsApp)",
                      labelText: 'Phone Number',
                      labelText2: "(Must exist WhatsApp number)",
                      hintText: "Enter your phone number",
                      keyboardType: TextInputType.phone,
                      onChanged: ((value) {
                        if (value.length == 11) {
                          controller.isReadyToSendOtp = true;
                          controller.update();
                        }
                        else {
                          if (controller.isReadyToSendOtp) {
                            controller.isReadyToSendOtp = false;
                            controller.update();
                          }
                        }
                      }),
                      suffixIcon: Visibility(
                        visible: controller.isReadyToSendOtp,
                        child: TextButton(
                            onPressed: () {
                              if (controller.phoneNumber.text.length == 11) {
                                controller.phoneValidation();
                              }
                              else {
                                Get.snackbar('Warning',
                                    "Phone number must be required 11 digit",
                                    snackPosition: SnackPosition.BOTTOM,
                                    colorText: Colors.white,
                                    margin: const EdgeInsets.all(8),
                                    backgroundColor: Colors.orange.shade500);
                              }
                            },
                            child: Text(
                              'Send OTP'.toUpperCase(),
                              textAlign: TextAlign.center,
                            ),
                        ),
                      ),
                    ),

                    const SizedBox(height: defaultPadding / 1.5),

                    Visibility(
                      visible: controller.isValidPhone,
                      child: CustomeTextField(
                        controller: controller.otpController,
                        labelText: "OTP",
                        keyboardType: TextInputType.phone,
                        onChanged: (value) {
                          if (value.length >= 4) controller.otpValidation();
                        },
                        hintText: "Enter otp number",
                      ),
                    ),

                    const SizedBox(height: defaultPadding / 1.5),

                    /// email /////

                    CustomeTextField(
                      controller: controller.email,
                      onChanged: ((value) {
                        if (GetUtils.isEmail(value)) {
                          if (!controller.isEmailSend) {
                            controller.setEmailSend(true);
                            Future.delayed(const Duration(seconds: 1), () {
                              (controller.emailValidation()==true);
                              /// EmailValidator.validate(email)
                            });
                          } else {
                            Future.delayed(const Duration(seconds: 1), () {
                              controller.setEmailSend(true);
                            });
                          }
                        } else {
                          controller.setEmailSend(false);
                        }
                      }),
                      labelText: "Email",
                      hintText: "Enter your email address",
                    ),

                    const SizedBox(height: defaultPadding / 1.5),

                    CustomeTextField(
                      controller: controller.nid,
                      labelText: "NID",
                      hintText: "Enter your nid number",
                      keyboardType: TextInputType.phone,
                      onChanged: ((value) => {
                            // 8719637236
                            if (value.length >= 10) {controller.nidValidation()}
                          }),
                    ),
                    const SizedBox(height: defaultPadding / 1.5),

                    CustomeTextField(
                      controller: controller.passportNo,
                      labelText: "Passport Number",
                      keyboardType: TextInputType.number,
                      hintText: "Enter your passport number",
                    ),

                    const SizedBox(height: defaultPadding / 1.5),

                    SelectCategory(
                      categoryNameReq: 'How to find Us',
                      statusList: controller.findUsList,
                      selectedValue: controller.findUs,
                      onSelected: (s ) {controller.selectFindUs(s);  },
                      //itemReq: controller.maritalStatusList.map((item) => item).toString(),
                    ),


                    const SizedBox(height: defaultPadding / 1.5),

                    Container(
                      decoration: const BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.all(Radius.circular(15.0)),
                          color: DColors.background
                      ),
                      child: CustomeTextField(
                        controller: controller.permanentAddress,
                        labelText: "Permanent Address",
                        hintText: "Enter your Village, Post-office, Thana, Zilla",
                      ),
                    ),

                    const SizedBox(height: defaultPadding / 1.5),

                    Container(
                      decoration: const BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.all(Radius.circular(15.0)),
                          color: DColors.background
                      ),
                      child: CustomeTextField(
                        controller: controller.presentAddress,
                        labelText: "Present Address",
                        hintText: "Enter your Village, Post-office, Thana, Zilla",
                      ),
                    ),

                    const SizedBox(height: defaultPadding / 1.5),


                    CustomeTextField(
                      controller: controller.eContactName,
                      labelText: "Emergency Contact Name",
                      hintText: "Enter your emergency contact name",
                    ),

                    const SizedBox(height: defaultPadding / 1.5),


                    SelectCategory(
                      categoryNameReq: 'Emergency Contact Relation',
                      statusList: controller.relationList,
                      selectedValue: controller.eContactRelation,
                      onSelected: (s ) {controller.selectRelation(s);  },
                      //itemReq: controller.maritalStatusList.map((item) => item).toString(),
                    ),

                    const SizedBox(height: defaultPadding / 1.5),

                    CustomeTextField(
                      controller: controller.eContactNumber,
                      keyboardType: TextInputType.phone,
                      labelText: "Emergency Contact Phone",
                      hintText: "Enter your emergency contact number",
                    ),

                    const SizedBox(height: defaultPadding / 1.5),

                    CustomeTextField(
                      controller: controller.eContactAddress,
                      labelText: "Emergency Contact Address",
                      hintText: "Enter your emergency contact address",
                    ),

                    const SizedBox(height: defaultPadding / 1.5),

                    ImageUpload(),

                    const SizedBox(height: defaultPadding / 1.5),
                    Row(
                      children: [
                        Checkbox(
                            value: controller.isAgree,
                            onChanged: (value) => controller.setAgree(value)),
                        Expanded(
                          child: RichText(
                              text: TextSpan(children: [
                            const TextSpan(
                                text:
                                    "By pre booking a service, you agree with our ",
                                style: TextStyle(color: Colors.black),),
                            WidgetSpan(
                                child: InkWell(
                              onTap: () => Get.to(RulesRegulationScreen()),
                              child: const Text(
                                "Rules and Regulation.",
                                style: TextStyle(color: Colors.blue),
                              ),
                            ))
                          ],),),
                        ),
                      ],
                    ),

                    const SizedBox(height: defaultPadding),

                    Visibility(
                      visible: controller.isValidOtp,
                      child: SizedBox(
                        width: double.infinity,
                        height: 45,
                        child: TextButton(
                          onPressed: () {
                            print("controller.phoneNumber.text: ${controller.phoneNumber.text}");
                            //return;
                            controller.askPermissions("member", controller.phoneNumber.text);
                            controller.submit();
                          },
                          /*onPressed: () {
                            controller.askPermissions(context);
                            controller.submit();
                          },
                           */
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: primaryColor,
                          ),
                          child: Text("Submit".toUpperCase()),
                        ),
                      ),
                    ),

                    const SizedBox(height: defaultPadding),
                  ],
                );
              }),
        ),
      ),
    );
  }
}

*/
