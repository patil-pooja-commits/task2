import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:innovecture/Api/api_handler.dart';
import 'package:innovecture/Pages/Dashboard/model/movieslist_model.dart';

class DashboardController extends GetxController {
  List<TvShows> tvShowList = <TvShows>[].obs;
  RxBool isLoading = true.obs;
  RxString selectedImage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    getMoviesList();
  }

  getMoviesList() async {
    MoviesModel moviesModel = await ApiHandler().callMoviesListApi();
    if (moviesModel.tvShows!.isNotEmpty) {
      tvShowList.clear();
      tvShowList.addAll(moviesModel.tvShows ?? []);
      debugPrint("TV SHOWS LIST ------------- ${tvShowList.length}");

      isLoading.value = false;
    }
  }

  selectImage(index, imagePath) {
    selectedImage.value = imagePath;
  }
}
