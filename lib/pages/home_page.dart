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
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.black87,
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Container(
                      decoration: containerDecoration,
                      height: MediaQuery.of(context).size.height * 0.761,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 16.0,
                              left: 16.0,
                              right: 16.0,
                              bottom: 16.0,
                            ),
                            child: SizedBox(
                              height: 100,
                              child: Image.asset(
                                'lib/assets/gshalaicon.png',
                                fit: BoxFit.scaleDown,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 16.0,
                              bottom: 16.0,
                            ),
                            child: Text(
                              'G-Shala Offline',
                              textScaleFactor: 2,
                              style: mainHeadingStyle,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(24.0),
                            child: Material(
                              elevation: 5,
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              child: SizedBox(
                                height: 350,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    const Text(
                                      'Login',
                                      textScaleFactor: 2,
                                      style: TextStyle(
                                        color: Colors.black87,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Input(
                                      hintText: 'User Name',
                                      onChanged: (value) =>
                                          {controller.userName.value = value},
                                    ),
                                    Input(
                                      hintText: 'Password',
                                      obscure: true,
                                      onChanged: (value) =>
                                          {controller.passWord.value = value},
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        left: 16.0,
                                        right: 16.0,
                                      ),
                                      child: SizedBox(
                                        width: 300,
                                        child: ElevatedButton.icon(
                                          style: ButtonStyle(
                                            shape: MaterialStateProperty.all<
                                                RoundedRectangleBorder>(
                                              RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                                side: const BorderSide(
                                                  width: 0,
                                                ),
                                              ),
                                            ),
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
                                              primaryColor,
                                            ),
                                          ),
                                          onPressed: () {
                                            if (controller
                                                    .passWord.value.isEmpty ||
                                                controller
                                                    .userName.value.isEmpty) {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                const SnackBar(
                                                  content: Text(
                                                      'Please input your username and password'),
                                                ),
                                              );
                                            } else {
                                              Get.toNamed('/learningresource');
                                            }
                                          },
                                          icon: const Icon(
                                            Icons.login,
                                            color: Colors.white,
                                          ),
                                          label: const Text(
                                            'Login',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.760,
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
