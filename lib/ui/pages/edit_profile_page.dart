// part of 'pages.dart';

// class EditProfilePage extends StatefulWidget {
//   const EditProfilePage({super.key});

//   @override
//   State<EditProfilePage> createState() => _EditProfilePageState();
// }

// class _EditProfilePageState extends State<EditProfilePage> {
//   bool checkedValue = false;
//   bool validatePass = false;

//   String fullName = "";
//   String email = "";
//   String password = "";
//   String confPassword = "";

//   @override
//   Widget build(BuildContext context) {
//     final snackBarPass = SnackBar(
//       content: Text("Confirm Password Must Be Same"),
//       duration: Duration(seconds: 3),
//       padding: EdgeInsets.all(10),
//       backgroundColor: Theme.of(context).colorScheme.error,
//     );

//     return Scaffold(
//       appBar: AppBar(),
//       body: ListView(
//         scrollDirection: Axis.vertical,
//         children: [
//             Row(
//               children: [
//                 Padding(
//                   padding: EdgeInsets.only(top: 25, bottom: 25, left: 25),
//                   child: IconButton(
//                     icon: Icon(Icons.arrow_back_ios_new_rounded, size: 24),
//                     onPressed: () {
//                       Navigator.pop(context);
//                     },
//                   ),
//                 ),
//                 Text("Edit Profile"),
//               ],
//             ),
//           Center(
//             child: Container(
//               margin: const EdgeInsets.only(bottom: 20, left: 37, right: 37),
//               width: 90,
//               height: 90,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(50),
//                 color: lightMode ? colors['light-grey'] : colors['dove-grey'],
//               ),
//             ),
//           ),
//           const Padding(
//             padding: EdgeInsets.only(top: 20),
//             child: TextBox(title: "Full Name", type: 4),
//           ),
//           const Padding(
//             padding: EdgeInsets.only(top: 35),
//             child: TextBox(title: "Email Address", type: 1),
//           ),
//           const Padding(
//             padding: EdgeInsets.only(top: 35),
//             child: TextBox(title: "Password", type: 2),
//           ),
//           const Padding(
//             padding: EdgeInsets.only(top: 35),
//             child: TextBox(title: "Confirm Password", type: 3),
//           ),
//         ],
//       ),
//       bottomSheet: Container(
//         padding: const EdgeInsets.symmetric(horizontal: 20),
//         width: width(context),
//         margin: const EdgeInsets.only(bottom: 30),
//         child: ElevatedButton(
//           onPressed: () {
//             setState(() {
//               email = Provider.of<UserData>(context, listen: false).email;
//               fullName = Provider.of<UserData>(context, listen: false).fullName;
//               confPassword =
//                   Provider.of<UserData>(context, listen: false).confPassword;
//               confPassword ==
//                           Provider.of<UserData>(context, listen: false)
//                               .password &&
//                       confPassword != "" &&
//                       Provider.of<UserData>(context, listen: false).password !=
//                           ""
//                   ? validatePass = !validatePass
//                   : validatePass == true
//                       ? password =
//                           Provider.of<UserData>(context, listen: false).password
//                       : password = "";
//               Provider.of<UserData>(context, listen: false).getUser(email);
//             });
//             validatePass == true && checkedValue == true
//                 ? Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                         builder: (context) => UserProfilePage(
//                               username: email,
//                               name: fullName,
//                               password: password,
//                             )))
//                 : validatePass == true && checkedValue == false
//                     ? ScaffoldMessenger.of(context).showSnackBar(snackBarPass)
//                     : null;
//             ;
//           },
//           child: const Text(
//             "Change Profile",
//             style: TextStyle(fontSize: 16, fontFamily: "Raleway"),
//           ),
//         ),
//       ),
//     );
//   }
// }