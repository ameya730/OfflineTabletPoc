import 'package:app/controllers/home_controller.dart';
import 'package:app/other/constants.dart';
import 'package:app/widgets/common/input.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final List<dynamic> loginDetails = ["UserName", "Password"];
  final HomeController controller = Get.find();
  final TextStyle mainHeadingStyle = const TextStyle(
      fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Material(
              elevation: 5,
              borderRadius: BorderRadius.circular(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Container(
                      decoration: containerDecoration,
                      height: MediaQuery.of(context).size.height,
                      width: 300,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 36.0,
                              bottom: 36.0,
                            ),
                            child: Text(
                              'Offline Class',
                              textScaleFactor: 2,
                              style: mainHeadingStyle,
                            ),
                          ),
                          SizedBox(
                            height: 400,
                            child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  const Text(
                                    'Login',
                                    textScaleFactor: 2,
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  Input(
                                    hintText: 'User Name',
                                    onChanged: (value) =>
                                        {controller.userName.value = value},
                                  ),
                                  Input(
                                    hintText: 'Password',
                                    onChanged: (value) =>
                                        {controller.passWord.value = value},
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      left: 16.0,
                                      right: 16.0,
                                    ),
                                    child: SizedBox(
                                      width: 200,
                                      child: ElevatedButton.icon(
                                        style: ButtonStyle(
                                          shape: MaterialStateProperty.all<
                                                  RoundedRectangleBorder>(
                                              RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                  side: const BorderSide())),
                                          padding: MaterialStateProperty.all(
                                              const EdgeInsets.only(
                                            top: 16.0,
                                            bottom: 16.0,
                                            right: 8.0,
                                            left: 8.0,
                                          )),
                                          elevation:
                                              MaterialStateProperty.all(5),
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                            Colors.white,
                                          ),
                                        ),
                                        onPressed: () {
                                          Get.toNamed('/dashboard');
                                        },
                                        icon: const Icon(
                                          Icons.login,
                                          color: Colors.black,
                                        ),
                                        label: const Text(
                                          'Login',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16),
                                        ),
                                      ),
                                    ),
                                  ),
                                ]),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Material(
                    elevation: 5,
                    borderRadius: BorderRadius.circular(0),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    color: Colors.white,
                    child: Image.asset('lib/assets/offlineicon.gif',
                        fit: BoxFit.fitWidth),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
