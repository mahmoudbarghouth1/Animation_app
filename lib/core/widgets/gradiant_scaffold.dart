import 'package:flutter/material.dart';

class GradientScaffold extends StatelessWidget {
  const GradientScaffold({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xff162859),
            Color.fromARGB(255, 4, 51, 180),
            Color.fromARGB(255, 41, 88, 218),
          ],
          // colors: [Color(0xff162859), Color.fromARGB(255, 4, 51, 180)],
          // stops: [0.02, 0.03, 0.4, .1, .5, .8, .1, 1.5, 2, 3, 4],
          //Color.fromARGB(255, 3, 43, 240)
        ),
      ),
      child: child,
    );
  }
}

//import 'package:flutter/material.dart';

// class GradientScaffold extends StatelessWidget {
//   const GradientScaffold({super.key, required this.child});
//   final Widget child;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: const BoxDecoration(
//         gradient: LinearGradient(
//           begin: Alignment.topLeft,
//           end: Alignment.bottomRight,
//           colors: [
//             Color(0xff162859),
//             Color.fromARGB(255, 4, 51, 180),
//             Color.fromARGB(255, 41, 88, 218),
//           ],
//           // stops: [.1, .8, .1],
//           // colors: [Color(0xff162859), Color.fromARGB(255, 4, 51, 180)],
//           // stops: [0.02, 0.03, 0.4, .1, .5, .8, .1, 1.5, 2, 3, 4],
//           //Color.fromARGB(255, 3, 43, 240)
//         ),
//       ),
//       child: child,
//     );
//   }
// }
