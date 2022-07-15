import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn_supabase/config/config.dart';
import 'package:learn_supabase/controller/home_controller.dart';
import 'package:learn_supabase/style/text_style.dart';
import 'package:learn_supabase/view/login_page.dart';
import 'package:supabase/supabase.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController pwdCtrl = TextEditingController();
  TextEditingController nameCtrl = TextEditingController();
  final homeController = Get.find<HomeController>();
  bool obscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment: Alignment.center,
        child: FadeInLeft(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.center,
                child: Image.asset(
                  'assets/logo.png',
                  height: 100,
                  width: 100,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 15, left: 18),
                child: Text(
                  "Register",
                  style: AppTextStyle.title.copyWith(fontSize: 20),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 15, left: 18),
                child: Text(
                  "Nama",
                  style: AppTextStyle.normal,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 8, right: 18, left: 18),
                child: TextField(
                    onChanged: (value) {
                      setState(() {});
                    },
                    controller: nameCtrl,
                    style: AppTextStyle.normal,
                    decoration: InputDecoration(
                      hintText: "Masukan nama",
                      hintStyle: AppTextStyle.normal,
                      contentPadding: EdgeInsets.all(10),
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide: BorderSide(
                          width: 0,
                          style: BorderStyle.none,
                        ),
                      ),
                      fillColor: Color(0xffEBECEC),
                    )),
              ),
              Padding(
                padding: EdgeInsets.only(top: 15, left: 18),
                child: Text(
                  "Email",
                  style: AppTextStyle.normal,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 8, right: 18, left: 18),
                child: TextField(
                    onChanged: (value) {
                      setState(() {});
                    },
                    controller: emailCtrl,
                    style: AppTextStyle.normal,
                    decoration: InputDecoration(
                      hintText: "Masukan email",
                      hintStyle: AppTextStyle.normal,
                      contentPadding: EdgeInsets.all(10),
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide: BorderSide(
                          width: 0,
                          style: BorderStyle.none,
                        ),
                      ),
                      fillColor: Color(0xffEBECEC),
                    )),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10, left: 18),
                child: Text(
                  "Password",
                  style: AppTextStyle.normal,
                  // style: StyleFont.fontStylefs16fw500,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 8, right: 18, left: 18),
                child: TextField(
                    onChanged: (value) {
                      setState(() {});
                    },
                    style: AppTextStyle.normal,
                    controller: pwdCtrl,
                    obscureText: obscure,
                    decoration: InputDecoration(
                      suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              if (obscure == true) {
                                obscure = false;
                              } else {
                                obscure = true;
                              }
                            });
                          },
                          child: obscure == true
                              ? Icon(
                                  Icons.visibility_off,
                                  //color: ColorStyle.maincolors,
                                )
                              : Icon(
                                  Icons.visibility,
                                  //color: ColorStyle.maincolors,
                                )),
                      hintText: "Masukan password",
                      hintStyle: AppTextStyle.normal,
                      contentPadding: EdgeInsets.all(10),
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide: BorderSide(
                          width: 0,
                          style: BorderStyle.none,
                        ),
                      ),
                      fillColor: Color(0xffEBECEC),
                    )),
              ),
              Padding(
                padding:
                    EdgeInsets.only(right: 23, left: 23, bottom: 20, top: 50),
                child: GestureDetector(
                  onTap: () {
                    homeController.register(
                        context, emailCtrl.text, pwdCtrl.text, nameCtrl.text);
                  },
                  child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(8)),
                      child: Center(
                          child: Text(
                        "Register",
                        style: AppTextStyle.title.copyWith(color: Colors.white),
                      ))),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.only(top: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Sudah mempunyai akun? ",
                        style: AppTextStyle.small.copyWith(fontSize: 13),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          "Login",
                          style: AppTextStyle.title.copyWith(
                              color: Colors.blue,
                              fontSize: 13,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
