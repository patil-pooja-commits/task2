import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Api/api_handler.dart';
import '../../Dashboard/model/movieslist_model.dart';

class SearchController extends GetxController {
  Rx<TextEditingController> searchController = TextEditingController().obs;
  RxList<TvShows> searchtvShowList = <TvShows>[].obs;

  @override
  void onInit() {
    searchController.value.text = "";
    searchMoviesList(searchController.value.text);
    super.onInit();
  }

  searchMoviesList(searchKey) async {
    MoviesModel moviesModel = await ApiHandler().searchMoviesListApi(searchKey);
    if (moviesModel.tvShows!.isNotEmpty) {
      searchtvShowList.clear();
      searchtvShowList.addAll(moviesModel.tvShows ?? []);
      searchtvShowList.refresh();
    }
  }
}
