import 'package:diy_boba/DialogBox/Feedback.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class MySettings extends StatefulWidget {
  const MySettings({Key? key}) : super(key: key);

  @override
  _MySettingsState createState() => _MySettingsState();
}

class _MySettingsState extends State<MySettings> {
  late String appNamespace;

  @override
  void initState() {
    super.initState();
    _getAppNamespace();
  }

  Future<void> _getAppNamespace() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    setState(() {
      appNamespace = packageInfo.packageName;
    });
  }

  void _showFeedbackDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return FeedbackDialog.showFeedbackDialog(
          context,
          (String feedback) {
            // Handle the submitted feedback, if needed
            print('Feedback submitted: $feedback');
          },
        );
      },
    );
  }

  void _navigateToPlayStore() async {
    if (appNamespace.isEmpty) {
      print('App namespace is not available');
      return;
    }

    final url = "https://play.google.com/store/apps/details?id=$appNamespace";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      print('Could not launch the Play Store');
    }
  }

  @override
  Widget build(BuildContext context) {
    Future<void> onShare(BuildContext context) async {
      final box = context.findRenderObject() as RenderBox?;

      String linkToShare =
          "https://play.google.com/store/apps/details?id=$appNamespace";
      String text = "Check out this link: $linkToShare";
      String subject = "Sharing with Friends";

      try {
        await Share.share(
          text,
          subject: subject,
          sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size,
        );
      } catch (e) {
        // Handle exceptions, if any
        print("Error sharing: $e");
      }
    }

    void openPrivacyPolicy() async {
      const privacyPolicyUrl = "https://itwingtech.com/privacy-policy/";
      if (await canLaunch(privacyPolicyUrl)) {
        await launch(privacyPolicyUrl);
      } else {
        print('Could not launch $privacyPolicyUrl');
      }
    }

    return Scaffold(
      body: Container(
        height: double.infinity,
        color: const Color(0xFF92F3FF),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 80),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Container(
                        height: 35,
                        padding: const EdgeInsets.all(1.0),
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          shape: BoxShape.circle,
                          border: Border.all(
                            width: 3.0,
                            color: const Color.fromARGB(255, 2, 53, 95),
                          ),
                        ),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: const CircleAvatar(
                            backgroundColor: Colors.transparent,
                            child: Center(
                              child: Padding(
                                padding: EdgeInsets.only(left: 0),
                                child: Icon(
                                  Icons.arrow_back,
                                  color: Color.fromARGB(255, 2, 53, 95),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 100,
                    ),
                    const Text(
                      "Settings",
                      style: TextStyle(
                        fontSize: 24,
                        fontFamily: 'Sora-VariableFont_wght.ttf',
                        color: Color.fromARGB(255, 2, 53, 95),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 80),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: SvgPicture.asset(
                        'assets/images/rateus.svg',
                        height: 70,
                      ),
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    GestureDetector(
                      onTap: () {
                        _navigateToPlayStore();
                      },
                      child: const Text(
                        "Rate Us",
                        style: TextStyle(
                          fontSize: 19,
                          fontFamily: 'Poppins-Black.ttf',
                          fontWeight: FontWeight.w600,
                          color: Color.fromARGB(255, 2, 53, 95),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: SvgPicture.asset(
                        'assets/images/share.svg',
                        height: 70,
                      ),
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    GestureDetector(
                      onTap: () {
                        onShare(context);
                      },
                      child: const Text(
                        "Share this app",
                        style: TextStyle(
                          fontSize: 19,
                          fontFamily: 'Poppins-Black.ttf',
                          color: Color.fromARGB(255, 2, 53, 95),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: SvgPicture.asset(
                        'assets/images/policy.svg',
                        height: 70,
                      ),
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    GestureDetector(
                      onTap: () {
                        openPrivacyPolicy();
                      },
                      child: const Text(
                        "Privacy Policy",
                        style: TextStyle(
                          fontFamily: 'Poppins-Black.ttf',
                          fontSize: 19,
                          color: Color.fromARGB(255, 2, 53, 95),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: SvgPicture.asset(
                        'assets/images/feedback.svg',
                        height: 70,
                      ),
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    GestureDetector(
                      onTap: () async {
                        _showFeedbackDialog(context);
                      },
                      child: const Text(
                        "Feedback",
                        style: TextStyle(
                          fontFamily: 'Poppins-Black.ttf',
                          fontSize: 19,
                          color: Color.fromARGB(255, 2, 53, 95),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
