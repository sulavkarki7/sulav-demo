import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:interndemo/components/constants.dart';
import 'package:interndemo/screens/final_page.dart';

class AddIconPage extends StatefulWidget {
  const AddIconPage({super.key});

  @override
  State<AddIconPage> createState() => _AddIconPageState();
}

class _AddIconPageState extends State<AddIconPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        color: const Color.fromARGB(208, 248, 167, 91),
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: GestureDetector(
        onTap: () {
          showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              builder: (BuildContext context) {
                return SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.fromLTRB(40, 10, 5, 5),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 6.0),
                            child: Text(
                              'Full Name',
                              style: comboTitleStyle,
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 30),
                          child: Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: TextFormField(
                              decoration: const InputDecoration(
                                hintText: 'Sulav Karki',
                                hintStyle:
                                    TextStyle(color: Colors.grey, fontSize: 12),
                                prefixIcon:
                                    Icon(Icons.person, color: themeColor),
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20.0)),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(40, 10, 5, 5),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 6.0),
                            child: Text(
                              'Email',
                              style: comboTitleStyle,
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 30),
                          child: Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: TextFormField(
                              decoration: const InputDecoration(
                                hintText: 'sulavkarki@gmail.com',
                                hintStyle:
                                    TextStyle(color: Colors.grey, fontSize: 12),
                                prefixIcon:
                                    Icon(Icons.email_sharp, color: themeColor),
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20.0)),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(40, 10, 5, 5),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 6.0),
                            child: Text(
                              'Phone Number',
                              style: comboTitleStyle,
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 30),
                          child: Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                hintText: '9804563255',
                                hintStyle:
                                    TextStyle(color: Colors.grey, fontSize: 12),
                                prefixIcon: Icon(
                                  Icons.phone_sharp,
                                  color: themeColor,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20.0)),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: Get.height * 0.02,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextButton(
                                  style: TextButton.styleFrom(
                                      foregroundColor: Colors.white,
                                      backgroundColor: themeColor,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 30)),
                                  onPressed: () {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                      return const FinalPage();
                                    }));
                                  },
                                  child: const Text('Complete Order')),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: Get.height * 0.07,
                        )
                      ],
                    ),
                  ),
                );
              });
        },
        child: const Icon(
          Icons.add,
          color: themeColor,
        ),
      ),
    );
  }
}
