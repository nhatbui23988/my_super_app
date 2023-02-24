import 'package:domain/entity/mini_app_configure.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:my_super_app/src/presentations/screens/home/home_controller.dart';
import 'package:my_super_app/src/presentations/screens/mini_app/mini_app_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeController controller = Get.find();

  @override
  void initState() {
    super.initState();
    controller.getListAppConfigure();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: Obx(()=>SizedBox(
        height: 120,
        width: MediaQuery.of(context).size.width,
        child: ListView(
          padding: const EdgeInsets.all(12),
          scrollDirection: Axis.horizontal,
          children: List.generate(
              controller.listAppConfig.value.length,
                  (index) => _buildMiniAppIcon(
                  controller.listAppConfig.value[index], (url)=>_openMiniApp(context, url))),
        ),
      )),
    );
  }

  Widget _buildMiniAppIcon(MiniAppConfigure miniAppConfigure,
      Function(String url) onAppIconClicked) {
    return InkWell(
      onTap: () => onAppIconClicked(miniAppConfigure.appUrl),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
                margin: const EdgeInsets.only(bottom: 8),
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  color: Colors.green,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all()),
                child: SvgPicture.network(miniAppConfigure.appIconUrl)),
            Text(miniAppConfigure.appName)
          ],
        ),
      ),
    );
  }

  void _openMiniApp(BuildContext context, String appUrl){
    Navigator.push(context, PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => const MiniAppScreen(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        final tween = Tween(begin: begin, end: end);
        final curvedAnimation = CurvedAnimation(
          parent: animation,
          curve: curve,
        );

        return SlideTransition(
          position: tween.animate(curvedAnimation),
          child: child,
        );
      },
    ));
  }

  @override
  void dispose() {
    Get.delete<HomeController>();
    super.dispose();
  }
}
