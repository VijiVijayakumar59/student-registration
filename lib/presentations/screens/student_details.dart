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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: const Text(
            "Enter the student's information",
          ),
          backgroundColor: tPurpleLight,
        ),
        body: Padding(
          padding:
              const EdgeInsets.only(top: 8, bottom: 8, left: 10, right: 10),
          child: SingleChildScrollView(
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
                  placeHolder: "whatsapp number",
                  textcontroller: numberController,
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
                  placeHolder: "eg:abc@gmail.com",
                  textcontroller: emailController,
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
                CustomTextFieldWidget(
                  maxLines: 3,
                  placeHolder: "enter your address",
                  textcontroller: addressController,
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
                CustomTextFieldWidget(
                  placeHolder: "Username",
                  textcontroller: usernameController,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                CustomTextFieldWidget(
                  placeHolder: "Enter your password",
                  textcontroller: passwordController,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                CustomTextFieldWidget(
                  placeHolder: "Confirm your password",
                  textcontroller: confirmPasswordController,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                ElevatedButton(
                    style: const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(
                      Color.fromARGB(255, 203, 94, 222),
                    )),
                    onPressed: () async {
                      final FormModel model = FormModel(
                          name: usernameController.text,
                          whatsappNumber: numberController.text,
                          email: emailController.text,
                          address: addressController.text,
                          mobile: contactController.text,
                          password: passwordController.text);
                      await saveUser(model);
                    },
                    child: const Text(
                      "Submit",
                      style: TextStyle(
                        color: tBlackColor,
                      ),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
