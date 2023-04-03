import 'dart:developer';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pensionsystem/UI/constant/colors.dart';
import 'package:pensionsystem/UI/constant/size.dart';
import 'package:pensionsystem/UI/constant/sizeconfig.dart';
import 'package:pensionsystem/widget/custom_app_bar.dart';
import 'package:pensionsystem/widget/custom_button.dart';
import 'package:pensionsystem/widget/custom_txt_field.dart';

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

  selectImage() async {
    Uint8List im = await pickImage(ImageSource.gallery);
    // set state because we need to display the image we selected on the circle avatar
    setState(() {
      _image = im;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Create user profile"),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: SizeConfig.widthOf(5)),
        child: Column(
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
            CustomTextField(
              labelText: "First Name",
              hintText: 'John',
            ),
            vertical10,
            CustomTextField(
              labelText: "Last Name",
              hintText: 'Doe',
            ),
            vertical10,
            CustomTextField(
              labelText: "Other Names",
              hintText: 'Felix',
            ),
            vertical10,
            CustomTextField(
              labelText: "Email",
              hintText: 'John@gmail.com',
            ),
            vertical10,
            CustomTextField(
              labelText: "Phone number",
              hintText: '090***********',
            ),
            vertical10,
            CustomTextField(
              labelText: "Department",
              hintText: 'Academic',
            ),
            vertical10,
            CustomTextField(
              labelText: "Role",
              hintText: 'Head teacher',
            ),
            vertical10,
            SizedBox(
                width: SizeConfig.screenWidth! / 2.5,
                child: CustomButton(onTap: () {}, label: "Submit"))
          ],
        ),
      ),
    );
  }
}
