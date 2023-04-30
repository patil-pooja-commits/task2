import 'package:get/get.dart';
import 'package:innovecture/Pages/SearchMovie/controller/search_controller.dart';

class SearchBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SearchController>(
      () => SearchController(),
    );
  }
}
