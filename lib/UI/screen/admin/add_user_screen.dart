import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'package:image_picker/image_picker.dart';
import 'package:pensionsystem/UI/constant/colors.dart';
import 'package:pensionsystem/UI/constant/size.dart';
import 'package:pensionsystem/UI/constant/sizeconfig.dart';
import 'package:pensionsystem/UI/constant/text_styles.dart';
import 'package:pensionsystem/widget/custom_app_bar.dart';
import 'package:pensionsystem/widget/custom_button.dart';
import 'package:pensionsystem/widget/custom_txt_field.dart';
import 'package:provider/provider.dart';

import '../../../core/repositories/user_repository.dart';
import '../../../services/image_picker_service.dart';

class AddUserScreen extends StatefulWidget {
  const AddUserScreen({super.key});

  @override
  State<AddUserScreen> createState() => _AddUserScreenState();
}

class _AddUserScreenState extends State<AddUserScreen> {
  // File? file;
  // String _filePath = "";
  Uint8List? _image;
  String? _imagePath;

  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController OtherName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController department = TextEditingController();
  TextEditingController designation = TextEditingController();
  TextEditingController salary = TextEditingController();

  selectImage() async {
    List imageData = await pickImage(ImageSource.gallery);

    // set state because we need to display the image we selected on the circle avatar
    setState(() {
      _image = imageData.elementAt(1);
      _imagePath = imageData.elementAt(0);
    });
  }

  @override
  Widget build(BuildContext context) {
    final userProv = Provider.of<UserProvider>(context);

    return Scaffold(
      appBar: CustomAppBar(title: "Create user profile"),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: SizeConfig.widthOf(5)),
        child: ListView(
          children: [
            Center(
              child: InkWell(
                onTap: () async {
                  selectImage();
                },
                child: _image != null
                    ? CircleAvatar(
                        radius: 64,
                        backgroundImage: MemoryImage(_image!),
                        backgroundColor: appPrimaryColor,
                      )
                    : CircleAvatar(
                        radius: 64,
                        backgroundImage: NetworkImage(
                            'data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAkGBxAHBhMSEBIPDxUQEQ8QFRIODg8QEBAVFREYFhURFRYYHSggGRolHRUTITEiKCkrLi4uFx8zODMsNygtLi0BCgoKDQ0NDw0NDisZFRkrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrK//AABEIAOEA4QMBIgACEQEDEQH/xAAaAAEAAwEBAQAAAAAAAAAAAAAAAwQFAQIH/8QANBABAAEDAgIHBQgDAQAAAAAAAAECAxEEITFxEhNBUWGBsQUicpHwIzIzNFKhwdFC4fEk/8QAFQEBAQAAAAAAAAAAAAAAAAAAAAH/xAAUEQEAAAAAAAAAAAAAAAAAAAAA/9oADAMBAAIRAxEAPwD6oAqAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAIrmopt8Z37o3kErkzFPGYjnLOvauqvh7seHH5q87yDYiuJ4TE8ph6Yr3TdqpjaqY85BrjNt6yqnj73Nds36b0bce6eIJQAAAAAAAAAAAAAAAAAAAAVdfd6NGI/y9AR6rVZ2pnnP9KYKAAAADtNU0zmNsOANTTXuuo8Y4/2mZWmudVeiezhLVQAAAAAAAAAAAAAAAAAAGXq6+nfnw2+X1LTmejGe7djcQAFAAAAAABrWKulZpnwhktXS/l6eSCUAAAAAAAAAAAAAAAAAEd/azV8M+jJa1/8Cr4Z9GSAAoAAAfX18gAAGno5/wDNHn6yzGnovy0efqgnAAAAAAAAAAAAAAAAABS196aZ6MbZic+PgoQu+0qfepnmp43AyZMGFDJEmDAOTwJnETydwYAmcGcGDAC5obs9Po9mJ8lPCz7Pj7flEg0gEAAAAAAAAAAAAAAAAFbX09Kxnun/AEzmxVTFdMxPbszdTY6iY3zE5BCAoAAAAAAL3s6n3ZnyVdPZ665jhtlp2rcWqMQg9gAAAAAAAAAAAAAAAAAINXb6yxPhunAYon1djqq8xwnh4eCBQAAAABJp7PXXMdnbILmgt9G1n9XpC05EYh1AAAAAAAAAAAAAAAAAAAABBrYzpp8vVmNLXVY08x349WaAAoAAND2fH2M/F/EM9f8AZ9X2cx45/ZBbAAAAAAAAAAAAAAAAAABFc1FNvjPlG8glVNZqJtziNsxnKO5rpn7sY8Z3lVqqmuczMzzAmZqnffm4CgAAAAROABc0moqquRTO+c79vBeYsT0Z225LVvW1U8fe/aUGgILeqouduPCrZOAAAAAAAAAAAPNdUUU5nhDOv6mq7PdHdH8gvXL9NvjMco3lWua79Mec/wBKYCS5fqucZnlwhGCgAAAAAAAAAAAA927tVvhMx6PAC3b10x96M8tlm3qaK+3HhOzLEG0MqzqKrU7bx3TwaVq5F2jMf88AewAAAAAUPaFzNcU9288/r1VEmpnOoq54+WyMABQAAAAAAAAAAAAAAAAAAWNFc6F7HZVt59iu7RPRrie6YkGyAgAAAAyL341XxT6vAKAAAAAAAAAAAAAAAAAAAAAANoBAAB//2Q=='),
                        backgroundColor: appPrimaryColor,
                      ),
              ),
            ),
            vertical20,
            Text(
              "Personal Info",
              style: txStyle14,
            ),
            vertical10,
            CustomTextField(
              labelText: "First Name",
              hintText: 'John',
              controller: firstName,
            ),
            vertical10,
            CustomTextField(
              labelText: "Last Name",
              hintText: 'Doe',
              controller: lastName,
            ),
            vertical10,
            CustomTextField(
              labelText: "Other Names",
              hintText: 'Felix',
              controller: OtherName,
            ),
            vertical10,
            CustomTextField(
              labelText: "Email",
              hintText: 'John@gmail.com',
              controller: email,
            ),
            vertical10,
            CustomTextField(
              labelText: "Phone number",
              hintText: '090***********',
              controller: phoneNumber,
            ),
            vertical30,
            Text(
              "Work Profile",
              style: txStyle14,
            ),
            vertical10,
            CustomTextField(
              labelText: "Department",
              hintText: 'Academic',
              controller: department,
            ),
            vertical10,
            CustomTextField(
              labelText: "Designation",
              hintText: 'Head teacher',
              controller: designation,
            ),
            vertical10,
            CustomTextField(
              labelText: "Agreed Salary",
              hintText: '#####',
              controller: salary,
            ),
            vertical30,
            SizedBox(
                width: SizeConfig.screenWidth! / 2.5,
                child: CustomButton(
                    onTap: () async {
                      print(_imagePath);
                      bool u = await userProv.createStaffProfile(
                        firstName: firstName.text,
                        lastName: lastName.text,
                        otherName: OtherName.text,
                        email: email.text,
                        phone: phoneNumber.text,
                        department: department.text,
                        designation: designation.text,
                        salary: salary.text,
                        profilePicture: _image,
                      );
                      if (u) {
                        Get.defaultDialog(
                            title: "Staff Added!",
                            titlePadding: const EdgeInsets.only(top: 20),
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 20, horizontal: 20),
                            backgroundColor: Colors.white,
                            titleStyle: txStyle20,
                            barrierDismissible: true,
                            confirm: Padding(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              child: InkWell(
                                onTap: () async {
                                  userProv.fetchOrganizationStaff();
                                  Get.close(2);
                                },
                                child: Container(
                                  height: 35,
                                  width: 100,
                                  decoration: BoxDecoration(
                                    color: appPrimaryColor,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Center(
                                      child: Text(
                                    "Ok",
                                    style: txStyle14wt,
                                  )),
                                ),
                              ),
                            ),
                            radius: 6,
                            content: Column(
                              children: [
                                Text(
                                  "Staff profile created! You can view details by clicking on a staff",
                                  textAlign: TextAlign.center,
                                  style: txStyle14.copyWith(height: 1.5),
                                )
                              ],
                            ));
                      }
                    },
                    label: "Submit"))
          ],
        ),
      ),
    );
  }
}
