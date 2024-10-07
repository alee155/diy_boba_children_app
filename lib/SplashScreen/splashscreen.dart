import 'dart:async';

import 'package:diy_boba/App_Utils/app_utils.dart';
import 'package:diy_boba/BoardingScreens/bordingscreen1.dart';
import 'package:diy_boba/WelcomeScreen/WelcomeScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:store_redirect/store_redirect.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Firebase.initializeApp();
    initRemoteConfig();
  }

  Future<void> initRemoteConfig() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    String version = packageInfo.version;
    int currentAppVersion = int.parse(version.split('.')[0]);
    print('>>>>>>>>>>>>>>>>>Current App Version: $currentAppVersion');

    final remoteConfig = FirebaseRemoteConfig.instance;
    await remoteConfig.setConfigSettings(RemoteConfigSettings(
      fetchTimeout: const Duration(minutes: 1),
      minimumFetchInterval: const Duration(hours: 1),
    ));

    await remoteConfig.setDefaults(const {"drinkapp_version": 1});
    await remoteConfig.fetchAndActivate();
    final latestAppVersion =
        int.parse(remoteConfig.getString("drinkapp_version"));
    print('>>>>>>>>>Latest remote config Version: $latestAppVersion');

    if (currentAppVersion < latestAppVersion) {
      showUpdateDialog();
    } else {
      navigateToScreen();
    }
    remoteConfig.onConfigUpdated.listen((event) async {
      await remoteConfig.activate();
    });
  }

  void showUpdateDialog() {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: const Text(
            'Update Available',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          content: const Text(
            'A new version of the app is available. Please update to continue using the app.',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          actions: [
            Center(
              child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                  const Color(0xFF92F3FF),
                )),
                child: const Text(
                  'Update Now',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onPressed: () async {
                  String packageName = await AppUtils.getPackageName();
                  StoreRedirect.redirect(
                      androidAppId: packageName, iOSAppId: packageName);
                  // ignore: use_build_context_synchronously
                  Navigator.push(
                      context,
                      PageTransition(
                          type: PageTransitionType.fade,
                          child: const SplashScreen()));
                },
              ),
            ),
          ],
        );
      },
    );
  }

  void navigateToScreen() {
    SharedPreferences.getInstance().then((prefs) {
      final bool hasSeenOnboarding =
          prefs.getBool('hasSeenOnboardingScreen') ?? false;

      if (hasSeenOnboarding) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const MyWelcomeScreen()),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const OnboardingScreen()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/fullsplash.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: const Stack(
          children: [
            Positioned(
              bottom: 50.0,
              left: 0.0,
              right: 0.0,
              child: Center(
                child: Text(
                  'Loading...',
                  style: TextStyle(
                    fontSize: 29,
                    color: Color.fromARGB(255, 2, 53, 95),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
