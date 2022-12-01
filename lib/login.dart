//SignInScreen

import 'package:demo_application/tababr.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';




class SignInScreen extends StatefulWidget {
const SignInScreen({Key? key}) : super(key: key);

@override
_SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {

  // function to implement the google signin

// creating firebase instance
final FirebaseAuth auth = FirebaseAuth.instance;

Future<void> signup(BuildContext context) async {
	final GoogleSignIn googleSignIn = GoogleSignIn();
	final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
	if (googleSignInAccount != null) {
	final GoogleSignInAuthentication googleSignInAuthentication =
		await googleSignInAccount.authentication;
	final AuthCredential authCredential = GoogleAuthProvider.credential(
		idToken: googleSignInAuthentication.idToken,
		accessToken: googleSignInAuthentication.accessToken);
	
	// Getting users credential
	UserCredential result = await auth.signInWithCredential(authCredential);
	User? user = result.user;
	
	if (result != null) {
		// ignore: use_build_context_synchronously
		Navigator.pushReplacement(
			context, MaterialPageRoute(builder: (context) => const TabBarBottom()));
	} // if result not null we simply call the MaterialpageRoute,
		// for go to the HomePage screen
	}
}



@override
Widget build(BuildContext context) {
	return Scaffold(
	body: Container(
		width: double.infinity,
		height: double.infinity,
		decoration: const BoxDecoration(
		gradient: LinearGradient(
			colors: [
			Colors.blue,
			Colors.red,
			],
		),
		),
		child: Card(
		margin: const EdgeInsets.only(top: 200, bottom: 200, left: 30, right: 30),
		elevation: 20,
		child: Column(
			mainAxisAlignment: MainAxisAlignment.spaceEvenly,
			children: [
			const Text(
				"Welcome",
				style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
			),
			Padding(
				padding: const EdgeInsets.only(left: 20, right: 20),
				child: MaterialButton(
				color: Colors.teal[100],
				elevation: 10,
				child: Row(
					mainAxisAlignment: MainAxisAlignment.start,
					children: [
					Container(
						height: 30.0,
						width: 30.0,
						decoration: const BoxDecoration(
						image: DecorationImage(
							image:
								NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSdk8gkKEtc0Rbw0l5gIOFezXsxBlk0pf64PgZnq90b33BFUYgiSsJZrdw0C0EAzsIRKEA&usqp=CAU'),
							fit: BoxFit.cover),
						shape: BoxShape.circle,
						),
					),
					const SizedBox(
						width: 20,
					),
					const Text("Sign In with Google")
					],
				),
				
				// by onpressed we call the function signup function
				onPressed: (){
					signup(context);
				},
				),
			)
			],
		),
		),
	),
	);
}

}
