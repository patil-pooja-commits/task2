import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:innovecture/Pages/SearchMovie/controller/search_controller.dart';

import '../../../utils/app_colors.dart';

class SearchView extends GetView<SearchController> {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      appBar: AppBar(
        backgroundColor: AppColors.blackColor,
        elevation: 0,
        title: Text(
          "Search",
          style: TextStyle(color: AppColors.whiteColor),
        ),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: AppColors.whiteColor,
            )),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
              child: Row(
                children: [
                  Expanded(
                      child: TextFormField(
                    controller: controller.searchController.value,
                    onChanged: ((value) {
                      controller.searchMoviesList(value);
                    }),
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0)),
                        hintText: 'Search',
                        fillColor: AppColors.whiteColor,
                        filled: true),
                  ))
                ],
              ),
            ),
            Obx(() => ListView.builder(
                physics: ScrollPhysics(),
                shrinkWrap: true,
                itemCount: controller.searchtvShowList.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: double.infinity,
                        height: 250.0,
                        color: AppColors.blackColor,
                        child: Column(
                          children: [
                            Container(
                              width: double.infinity,
                              height: 200.0,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image: NetworkImage(controller
                                          .searchtvShowList[index]
                                          .imageThumbnailPath!))),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              controller.searchtvShowList[index].name!,
                              style: TextStyle(color: AppColors.whiteColor),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }))
          ],
        ),
      ),
    );
  }
}
