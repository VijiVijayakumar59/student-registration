// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:studentlogin/model/form_model.dart';
import 'package:studentlogin/presentations/widgtes/custom_textfield.dart';
import 'package:studentlogin/presentations/widgtes/dropdown_button_widget.dart';
import 'package:studentlogin/presentations/widgtes/dropdown_class.dart';
import 'package:studentlogin/presentations/widgtes/form_text.dart';
import 'package:studentlogin/presentations/widgtes/image_picker.dart';
import 'package:studentlogin/services/save_api.dart';
import 'package:studentlogin/utils/constants.dart/colors.dart';

class StudentDetails extends StatelessWidget {
  StudentDetails({super.key});
  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController guardianController = TextEditingController();
  TextEditingController contactController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController imageController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: const Text(
            "Student Registration",
            style: TextStyle(color: tBlackColor),
          ),
          backgroundColor: tPurpleLight,
        ),
        body: Padding(
          padding: const EdgeInsets.only(
            top: 12,
            bottom: 8,
            left: 12,
            right: 12,
          ),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const FormText(
                    textName: "Student Name",
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  CustomTextFieldWidget(
                    placeHolder: "Student name",
                    textcontroller: nameController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "name field can't be empty";
                      } else if (value.length < 3 || value.length > 30) {
                        return "Name length should be between 3 and 30 characters.";
                      } else {
                        return null;
                      }
                    },
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  const FormText(
                    textName: "Academic Year",
                  ),
                  const AcademicYearDropdown(),
                  const FormText(
                    textName: "Class/Semester",
                  ),
                  const DropDownClassButton(),
                  const FormText(
                    textName: "Whatsapp Number",
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  CustomTextFieldWidget(
                    keyboardType: TextInputType.number,
                    placeHolder: "whatsapp number",
                    textcontroller: numberController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "whatsapp number can't be empty";
                      } else if (value.length != 10) {
                        return 'Mobile Number must be of 10 digit';
                      } else {
                        return null;
                      }
                    },
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  const FormText(
                    textName: "Email",
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  CustomTextFieldWidget(
                    keyboardType: TextInputType.emailAddress,
                    placeHolder: "eg:abc@gmail.com",
                    textcontroller: emailController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Enter your email";
                      } else if (!RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(value)) {
                        return "Enter valid email";
                      } else {
                        return null;
                      }
                    },
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  const FormText(
                    textName: "Addess",
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  TextFormField(
                    maxLines: 3,
                    controller: addressController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "This field can't be empty";
                      } else {
                        return null;
                      }
                    },
                    decoration: const InputDecoration(
                      hintText: "enter your address",
                      contentPadding: EdgeInsets.all(1.8),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: tBlackColor),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  const FormText(
                    textName: "Guardian Name",
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  CustomTextFieldWidget(
                    placeHolder: "guardian name",
                    textcontroller: guardianController,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  const FormText(
                    textName: "Contact Number",
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  CustomTextFieldWidget(
                    placeHolder: "contact number",
                    textcontroller: contactController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "contact number can't be empty";
                      } else if (value.length != 10) {
                        return 'Mobile Number must be of 10 digit';
                      } else {
                        return null;
                      }
                    },
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  const FormText(
                    textName: "Image",
                  ),
                  const ImagePickerButton(),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  Container(
                    height: 50,
                    width: 500,
                    color: const Color.fromARGB(255, 243, 216, 235),
                    child: const Center(
                      child: Text(
                        "Student Login",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  const FormText(
                    textName: "Username",
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  CustomTextFieldWidget(
                    placeHolder: "Username",
                    textcontroller: usernameController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "name field can't be empty";
                      } else if (value.length < 3 || value.length > 30) {
                        return "Name length should be between 3 and 30 characters.";
                      } else {
                        return null;
                      }
                    },
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  const FormText(
                    textName: "Password",
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  CustomTextFieldWidget(
                    placeHolder: "Enter your password",
                    textcontroller: passwordController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Enter Your Password";
                      } else if (!RegExp(r'[A-Z]').hasMatch(value) ||
                          !RegExp(r'[a-z]').hasMatch(value) ||
                          !RegExp(r'[0-9]').hasMatch(value) ||
                          !RegExp(r'[!@#\$%^&*]').hasMatch(value)) {
                        return "Password should contain at least one uppercase letter, one lowercase letter, one digit, and one special character.";
                      } else if (value.length < 8) {
                        return " password atleast needed 8 characters";
                      } else {
                        return null;
                      }
                    },
                    isPassword: true,
                    suffixIcon: Icons.visibility_off,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  const FormText(
                    textName: "Confirm Password",
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  CustomTextFieldWidget(
                    placeHolder: "Confirm your password",
                    textcontroller: confirmPasswordController,
                    validator: (value) {
                      if (value != passwordController.text) {
                        return "Password is Incorrect";
                      } else {
                        return null;
                      }
                    },
                    isPassword: true,
                    suffixIcon: Icons.visibility_off,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                          style: const ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll(
                            Color.fromARGB(255, 203, 94, 222),
                          )),
                          onPressed: () async {
                            if (formKey.currentState!.validate()) {
                              formKey.currentState!.save();
                              final FormModel model = FormModel(
                                  name: usernameController.text,
                                  whatsappNumber: numberController.text,
                                  email: emailController.text,
                                  address: addressController.text,
                                  mobile: contactController.text,
                                  password: passwordController.text);
                              await saveUser(model);
                            }
                          },
                          child: const Text(
                            "Submit",
                            style: TextStyle(
                              color: tBlackColor,
                            ),
                          )),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
