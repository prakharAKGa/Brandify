// import 'package:brandify/screens/company_details/company_details_screen3.dart';
// import 'package:flutter/material.dart';

// class NextButton extends StatelessWidget {
//   const NextButton({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 300,
//       height: 52,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(24),
//         gradient: const LinearGradient(
//           colors: [
//             Color(0xFFDF4A80),
//             Color(0xFFD049B9),
//             Color(0xFFC249B3),
//             Color(0xFFB748C7),
//             Color(0xFFBA51DC),
//             Color(0xFFA748E2),
//             Color(0xFF9747FF),
//           ],
//           begin: Alignment.centerLeft,
//           end: Alignment.centerRight,
//         ),
//       ),
//       child: Material(
//         color: Colors.transparent,
//         child: InkWell(
//           borderRadius: BorderRadius.circular(24),
//           onTap: () {
//             Navigator.push(context, MaterialPageRoute(
//               builder: (context) => const Screen3(),
//             ));
//           },
//           child: const Center(
//             child: Text(
//               'Next',
//               style: TextStyle(
//                 fontFamily: 'Montserrat',
//                 fontSize: 16,
//                 fontWeight: FontWeight.w600,
//                 color: Colors.white,
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }