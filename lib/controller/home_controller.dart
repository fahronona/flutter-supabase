import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:learn_supabase/config/config.dart';
import 'package:learn_supabase/controller/activity_controller.dart';
import 'package:learn_supabase/view/login_page.dart';
import 'package:learn_supabase/view/main_page.dart';
import 'package:supabase/supabase.dart';

class HomeController extends GetxController {
  final name = "".obs;
  final email = "".obs;
  final idUser = "a".obs;
  var isLoading = false.obs;
  final box = Get.find<GetStorage>();

  final client =
      SupabaseClient(GlobalConfig.SUPABASE_URL, GlobalConfig.SUPABASE_KEY);

  Future<bool> loginUser(BuildContext context, String email, String pwd) async {
    final result = await client.auth.signIn(email: email, password: pwd);
    if (result.data != null) {
      box.write("user", result.user!.id);

      Get.snackbar("Login Succes", "Your successfully to login",
          backgroundColor: Colors.white);
      return true;
    } else if (result.error != null) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(result.error!.message),
      ));
      return false;
    }
    return true;
  }

  Future fetchUser(String id) async {
    isLoading.value = true;
    final response =
        await client.from('user').select().eq('userId', id).single().execute();
    final error = response.error;
    if (error != null && response.status != 406) {
      isLoading.value = false;
      //context.showErrorSnackBar(message: error.message);
    }
    final data = response.data;
    if (data != null) {
      isLoading.value = false;
      print(isLoading.value);
      name((data['name']) as String);
      email((data['email']) as String);
    }
  }

  Future register(
      BuildContext context, String email, String pwd, String name) async {
    final result = await client.auth.signUp(email, pwd);

    if (result.data != null) {
      try {
        await client.from('user').insert({
          'name': name,
          'userId': result.data!.user!.id,
          'email': email
        }).execute();
      } catch (e) {
        print(e);
        throw Exception(e);
      }

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Account Created Successfully"),
      ));
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => LoginPage()));
    } else if (result.error != null) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(result.error!.message),
      ));
    }
  }

  setUser(String Username, String Useremail) {
    name(Username);
    email(Useremail);
  }

  setId(String id) {
    idUser(id);
  }

 Future logOut<bool>() async{
    box.remove("user");
    return true;
  }

  @override
  void onInit() {
    super.onInit();
  }
}
