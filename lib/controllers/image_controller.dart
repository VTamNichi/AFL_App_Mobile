import 'package:amateur_football_league_mobile/controllers/general/general_controller.dart';
import 'package:amateur_football_league_mobile/fetch_api/image_api.dart';
import 'package:amateur_football_league_mobile/models/Image.dart';
import 'package:get/get.dart';

class ImagesController extends GetxController {
  final generalController = Get.put(GeneralController());

  RxList<Images> imagesList = <Images>[].obs;
  RxInt countListImages = 0.obs;
  RxInt tournamentId = 0.obs;

  Future<void> getListImages({bool isRefresh = false}) async {
    generalController.isLoading.value = true;
    if (isRefresh) {
      generalController.currentImagesPage.value = 1;
    }

    await ImagesAPI.getListImages(
        tournamentId.value, generalController.currentImagesPage.value);
    generalController.isLoading.value = false;
  }
}
