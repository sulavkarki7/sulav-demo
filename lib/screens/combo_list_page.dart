import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interndemo/components/api_service.dart';
import 'package:interndemo/components/combo_model.dart';
import 'package:interndemo/components/constants.dart';
import 'package:interndemo/screens/add_icon.dart';

class ComboListPage extends StatefulWidget {
  const ComboListPage({super.key});

  @override
  State<ComboListPage> createState() => _ComboListPageState();
}

class _ComboListPageState extends State<ComboListPage> {
  late Future<List<Combo>> futureCombos;
  late List<bool> favoriteStatus;

  @override
  void initState() {
    super.initState();
    futureCombos = fetchCombos();
    favoriteStatus = [];
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Combo>>(
      future: futureCombos,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('No data available'));
        } else {
          final combos = snapshot.data!;
          if (favoriteStatus.isEmpty) {
            favoriteStatus =
                List<bool>.generate(combos.length, (index) => false);
          }

          return ListView.builder(
            shrinkWrap: true,
            itemCount: combos.length,
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                      isScrollControlled: true,
                      context: context,
                      builder: (BuildContext context) {
                        return SingleChildScrollView(
                          child: Container(
                            color: themeColor,
                            height: Get.height * 0.5,
                            child: Column(
                              children: [
                                Container(
                                  height: Get.height * 0.3,
                                  child: Center(
                                    child: Image.network(
                                      combos[index].comboImage,
                                      errorBuilder: (BuildContext context,
                                          Object exception,
                                          StackTrace? stackTrace) {
                                        return const Icon(Icons.error,
                                            color: Colors.red, size: 50);
                                      },
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'Your Item is ${combos[index].comboTitle} ',
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'Item Price = Rs. ${combos[index].comboPrice} ',
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      });
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  color: const Color(0x11FFA451),
                  height: Get.height * 0.2,
                  width: Get.width * 0.38,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            SizedBox(
                              width: Get.width * 0.21,
                            ),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  favoriteStatus[index] =
                                      !favoriteStatus[index];
                                });
                                if (favoriteStatus[index]) {
                                  showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                      backgroundColor:
                                          themeColor.withOpacity(0.9),
                                      content: const Text(
                                        "Added to favorites",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500),
                                      ),
                                      actions: <Widget>[
                                        TextButton(
                                          style: TextButton.styleFrom(
                                              foregroundColor: themeColor,
                                              backgroundColor: Colors.white),
                                          child: const Text("OK"),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                      ],
                                    ),
                                  );
                                }
                              },
                              icon: Icon(
                                favoriteStatus[index]
                                    ? Icons.favorite
                                    : Icons.favorite_border_outlined,
                                color: themeColor,
                              ),
                            )
                          ],
                        ),
                      ),
                      Center(
                        child: Image.network(
                          combos[index].comboImage,
                          errorBuilder: (BuildContext context, Object exception,
                              StackTrace? stackTrace) {
                            return const Icon(Icons.error,
                                color: Colors.red, size: 50);
                          },
                        ),
                      ),
                      Center(
                        child: Text(
                          combos[index].comboTitle,
                          style: comboTitleStyle,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "Rs ${combos[index].comboPrice}",
                            style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: themeColor),
                          ),
                          const AddIconPage(),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        }
      },
    );
  }
}
