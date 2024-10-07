// import 'package:flutter/material.dart';
// import 'package:lottie/lottie.dart';
// import 'package:package_info_plus/package_info_plus.dart';
// import 'package:url_launcher/url_launcher.dart';

// class UpdateDialog extends StatefulWidget {
//   const UpdateDialog({Key? key}) : super(key: key);

//   @override
//   _UpdateDialogState createState() => _UpdateDialogState();
// }

// class _UpdateDialogState extends State<UpdateDialog> {
//   late String appNamespace;

//   @override
//   void initState() {
//     super.initState();
//     _getAppNamespace();
//   }

//   Future<void> _getAppNamespace() async {
//     PackageInfo packageInfo = await PackageInfo.fromPlatform();
//     setState(() {
//       appNamespace = packageInfo.packageName;
//     });
//   }

//   void _navigateToPlayStore() async {
//     if (appNamespace.isEmpty) {
//       print('App namespace is not available');
//       return;
//     }

//     final url = "https://play.google.com/store/apps/details?id=$appNamespace";
//     if (await canLaunch(url)) {
//       await launch(url);
//     } else {
//       print('Could not launch the Play Store');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return WillPopScope(
//       onWillPop: () async {
//         // Return false to prevent the dialog from being dismissed
//         return false;
//       },
//       child: AlertDialog(
//         title: const Text('Update Required'),
//         content: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Lottie.asset(
//               'assets/images/alert.json',
//               width: 100,
//               height: 100,
//               fit: BoxFit.cover,
//             ),
//             const SizedBox(height: 16),
//             const Text('Please update your app to the latest version.'),
//           ],
//         ),
//         actions: <Widget>[
//           TextButton(
//             onPressed: () {
//               // You can add logic here for OK action
//               _navigateToPlayStore();
//             },
//             child: const Text(
//               'Update',
//               style: TextStyle(color: Colors.green),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

