import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:learn_supabase/config/config.dart';
import 'package:learn_supabase/model/model_activity.dart';
import 'package:supabase/supabase.dart';

class ActivityController extends GetxController {
  final _activity = <ModelActivity>{}.obs;
    var isLoading = false.obs;
  Set<ModelActivity> get listActivity => _activity();

  final client =
      SupabaseClient(GlobalConfig.SUPABASE_URL, GlobalConfig.SUPABASE_KEY);

  Future fetchActivity() async {
    _activity.clear();
     isLoading.value = true;
    final response = await client.from('activity').select('*').execute();
    if (response.hasError) {
    } else {
        isLoading.value = false;
      var list = response.data;
      for (var e in (list as List)) {
        var activ = ModelActivity.fromJson(e);
        _activity.add(activ);
        if (_activity.length < 4) {
          await Future.delayed(const Duration(milliseconds: 500));
        }
      }
    }
  }

  @override
  void onInit() {
    super.onInit();
  }
}
