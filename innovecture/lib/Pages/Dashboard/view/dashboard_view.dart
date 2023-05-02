import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:innovecture/Pages/Dashboard/controllers/dashboardcontroller.dart';
import 'package:innovecture/routes/app_pages.dart';
import 'package:innovecture/utils/app_colors.dart';

class DashBoardView extends GetView<DashboardController> {
  const DashBoardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        elevation: 0,
        title: Text(
          "Dashboard",
          style: TextStyle(color: AppColors.blackColor),
        ),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              SystemNavigator.pop();
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: AppColors.blackColor,
            )),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(Routes.SEARCH);
        },
        child: Icon(Icons.search),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 200.0,
              child: Obx(
                () => controller.isLoading.value == true
                    ? Center(
                        child: CircularProgressIndicator(
                          color: AppColors.blackColor,
                        ),
                      )
                    : ListView.builder(
                        physics: const ClampingScrollPhysics(),
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: controller.tvShowList.length,
                        itemBuilder: (BuildContext context, int index) =>
                            InkWell(
                          onTap: () => controller.selectImage(index,
                              controller.tvShowList[index].imageThumbnailPath!),
                          child: Card(
                            child: Container(
                                width: 120.0,
                                height: 64.0,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        fit: BoxFit.fill,
                                        image: NetworkImage(controller
                                            .tvShowList[index]
                                            .imageThumbnailPath!)))),
                            // child: Container(
                            //   child: Text("${controller.tvShowList[index].name}"),
                            // ),
                          ),
                        ),
                      ),
              ),
            ),
            SizedBox(
              height: 200.0,
              child: Obx(
                () => ListView.builder(
                  physics: const ClampingScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: controller.tvShowList.length,
                  itemBuilder: (BuildContext context, int index) => Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("${controller.tvShowList[index].name}"),
                    ),
                  ),
                ),
              ),
            ),
            Obx((() => controller.selectedImage.value == ""
                ? Container()
                : Container(
                    width: double.infinity,
                    height: 200.0,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image: NetworkImage(
                                controller.selectedImage.value)))))),
          ],
        ),
      ),
    );
  }
}
