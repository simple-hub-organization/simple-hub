// import 'package:site/application/new_home_page/new_home_page_bloc.dart';
// import 'package:site/injection.dart';
// import 'package:site/presentation/new_home_page/widgets/new_home_page_widget.dart';
// import 'package:site/presentation/new_home_page/widgets/new_nav_bar.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:hexcolor/hexcolor.dart';
//
// class NewHomePagePage extends StatelessWidget {
//   void backButtonFunction(BuildContext context) {
//     Navigator.pop(context);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         toolbarHeight: 0,
//         backgroundColor: Colors.black,
//         systemOverlayStyle: SystemUiOverlayStyle.light,
//       ),
//       body: ColoredBox(
//         color: HexColor('#FBF5F9'),
//         child: Stack(
//           children: [
//             Expanded(
//               child: BlocProvider(
//                 create: (context) => getIt<NewHomePageBloc>()
//                   ..add(const NewHomePageEvent.initialized()),
//                 child: NewHomePageWidget(),
//               ),
//             ),
//             NewNavBar(),
//           ],
//         ),
//       ),
//     );
//   }
// }
