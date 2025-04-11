import 'dart:io';

import 'package:flutter/material.dart';
import 'package:foodie/components/foodie_header.dart';
import 'package:foodie/components/foodie_rounded_button.dart';
import 'package:foodie/components/foodie_textfield.dart';
import 'package:foodie/states/profile/profile_state.dart';
import 'package:foodie/utils/theme/color_ext.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController();

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white70,
        body: ChangeNotifierProvider<ProfileState>(
          create: (BuildContext context) => ProfileState(),
          child: Consumer<ProfileState>(
            builder: (context, profileState, child) => SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const FoodieHeaderWithCart(header: 'Profile'),
                    const Gap(20),
                    Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        color: FColor.placeHolder,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: profileState.photo == null
                          ? null
                          : ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: Image.file(
                                File(profileState.photo!.path),
                                height: 100,
                                width: 100,
                                fit: BoxFit.cover,
                              ),
                            ),
                    ),
                    TextButton.icon(
                      onPressed: () {
                        profileState.pickImage();
                      },
                      icon: Icon(
                        Icons.edit,
                        color: FColor.highlight,
                        size: 12,
                      ),
                      label: Text(
                        'Edit Profile',
                        style: TextStyle(
                            color: FColor.highlight,
                            fontSize: 14,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    Text(
                      'Hi there, Mushfiq!',
                      style: TextStyle(
                          color: FColor.primary,
                          fontSize: 16,
                          fontWeight: FontWeight.w700),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'Sign Out',
                        style: TextStyle(
                            color: FColor.primaryText,
                            fontSize: 11,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    const Gap(5),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        children: [
                          FoodieTextfield(
                            controller: nameController,
                            labelText: 'NAME',
                          ),
                          const Gap(10),
                          FoodieTextfield(
                            controller: nameController,
                            labelText: 'EMAIL',
                          ),
                          const Gap(10),
                          FoodieTextfield(
                            controller: nameController,
                            labelText: 'MOBILE',
                          ),
                          const Gap(10),
                          FoodieTextfield(
                            controller: nameController,
                            labelText: 'DOB',
                          ),
                          const Gap(10),
                          FoodieTextfield(
                            controller: nameController,
                            labelText: 'ETC',
                          ),
                          const Gap(10),
                          FoodieTextfield(
                            controller: nameController,
                            labelText: 'ETC',
                          ),
                          const Gap(10),
                          FoodieTextfield(
                            controller: nameController,
                            labelText: 'ETC',
                          ),
                          const Gap(20),
                          RoundedContainerButton(
                            text: 'Save',
                            onTap: () {},
                          ),
                          const Gap(20)
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
