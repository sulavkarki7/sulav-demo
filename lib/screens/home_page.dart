import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interndemo/components/constants.dart';
import 'package:interndemo/screens/combo_list_page.dart';
import 'package:interndemo/screens/salad_list_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.shopping_basket_outlined,
                color: themeColor,
              ),
            )
          ],
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(color: themeColor),
                child: Center(
                  child: Text(
                    'Fruit Salad',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              ListTile(
                title: const Text(
                  'Home',
                  style: TextStyle(color: themeColor),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text(
                  'Profile',
                  style: TextStyle(color: themeColor),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text(
                  'Orders',
                  style: TextStyle(color: themeColor),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text(
                  'Settings',
                  style: TextStyle(color: themeColor),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text(
                  'Logout',
                  style: TextStyle(color: themeColor),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: Get.height * 0.01,
              ),
              Padding(
                padding: const EdgeInsets.all(22.0),
                child: RichText(
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: 'Hello Sulav, ',
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF27214D)),
                      ),
                      TextSpan(
                        text: 'What fruit salad\ncombo do you want today?',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF27214D),
                        ),
                      ),
                    ],
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 15.0),
                    width: Get.width * 0.8,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        decoration: InputDecoration(
                          focusColor: Colors.grey[300],
                          hintText: 'Search for fruit salad combo',
                          hintStyle: searchbartexttyle,
                          prefixIcon:
                              const Icon(Icons.search, color: Colors.black),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Icon(Icons.filter_list, color: Colors.black)
                ],
              ),
              const Padding(
                padding: EdgeInsets.all(22.0),
                child: Text(
                  'Recommended Combo',
                  style: titleStyle,
                ),
              ),
              Container(
                height: Get.height * 0.23,
                color: Colors.white,
                margin: const EdgeInsets.all(5.0),
                width: double.infinity,
                child: const ComboListPage(),
              ),
              const Padding(
                padding: EdgeInsets.all(22.0),
                child: Text(
                  'Hottest',
                  style: titleStyle,
                ),
              ),
              Container(
                margin: const EdgeInsets.all(5.0),
                height: Get.height * 0.23,
                color: Colors.white,
                child: const SaladListPage(),
              ),
            ],
          ),
        ));
  }
}
