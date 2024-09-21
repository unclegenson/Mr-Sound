import 'package:get/get.dart';
import 'package:mr_sound_2/controllers/bubble_controller.dart';
import 'package:mr_sound_2/controllers/each_music_controller.dart';
import 'package:mr_sound_2/controllers/expand_container_controller.dart';
import 'package:mr_sound_2/controllers/follow_controller.dart';
import 'package:mr_sound_2/controllers/help_bubble.dart';
import 'package:mr_sound_2/controllers/music_player_page.dart';
import 'package:mr_sound_2/controllers/nav_controller.dart';
import 'package:mr_sound_2/controllers/playlist_controller.dart';
import 'package:mr_sound_2/controllers/show_end_widget_controller.dart';
import 'package:mr_sound_2/controllers/splash_controller.dart';

class MyBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(NavController());
    Get.put(MusicPlayerController());
    Get.put(ShowEndWidget_SearchBar_Controller());
    Get.put(BubbleController());
    Get.put(PlaylistController());
    Get.put(EachMusicController());
    Get.put(HelpBubbleController());
    Get.put(ExpandContainerController());
    Get.lazyPut(() => SplashController());
    Get.put(FollowController());
  }
}
