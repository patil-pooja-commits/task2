import 'package:get/get.dart';
import 'package:innovecture/Pages/Dashboard/bindings/dashboard_binding.dart';
import 'package:innovecture/Pages/SearchMovie/binding/search_binding.dart';
import 'package:innovecture/Pages/SearchMovie/view/search_view.dart';

import '../Pages/Dashboard/view/dashboard_view.dart';
import '../Pages/Splash/controller/splash_controller.dart';
import '../Pages/Splash/view/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;
  static final routes = [
    GetPage(
        name: _Paths.DASHBOARD,
        page: () => const DashBoardView(),
        binding: DashboardBinding()),
    GetPage(
        name: _Paths.SEARCH,
        page: () => const SearchView(),
        binding: SearchBinding()),
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: BindingsBuilder(() {
        Get.put(SplashController());
      }),
    ),
  ];
}
