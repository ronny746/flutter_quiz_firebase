import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:date_format/date_format.dart';
import 'package:intl/intl.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  User? user = FirebaseAuth.instance.currentUser;
  final uid = FirebaseAuth.instance.currentUser!.uid;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Center(child: Text("Profile"))),
      body: Column(crossAxisAlignment: CrossAxisAlignment.center,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            const SizedBox(
              height: 50,
            ),
            Center(
                child: CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(user!.photoURL.toString()),
            )),
            const SizedBox(
              height: 10,
            ),
            Text(
              user!.displayName.toString(),
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 16, 68, 111)),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: const [
                    Text(
                      "Join Date",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.red),
                    ),
                    Text("21/11/2022")
                  ],
                ),
                const Text("   "),
                Column(
                  children: const [
                    Text(
                      "Ratting",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.red),
                    ),
                    Text("5✨")
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "My Score",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 126, 231, 6)),
            ),
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('Data')
                    .doc(uid)
                    .collection("Results")
                    .snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (!snapshot.hasData) return Text('Loading...');
                  return ListView(
                    children:
                        snapshot.data!.docs.map((DocumentSnapshot document) {
                       DateTime dt = (document['Time'] as Timestamp).toDate();
                       var d12 = DateFormat('MM-dd-yyyy, hh:mm a').format(dt);
                      return ListTile(
                        subtitle: Text("Date: $d12"),
                        title: Text("Score: ${document['Result']}"),
                        // ignore: prefer_interpolation_to_compose_strings
                        trailing: Text("Attend:" + document['rightAns'].toString() + "/10"),
                      );
                    }).toList(),
                  );
                },
              ),
            )
          ]),
    );
  }
}
