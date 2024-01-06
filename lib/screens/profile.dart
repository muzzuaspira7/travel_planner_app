import 'package:flutter/material.dart';
import 'package:nothing/color/all_colors.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor().blue,
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              pinned: true,
              floating: true,
              expandedHeight: 250.0,
              flexibleSpace: FlexibleSpaceBar(
                title: const Text('Arjun Das'),
                background: Image.asset(
                  'assets/images/user.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate([
                Card(
                  color: AppColor().ForCardBackground,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: ListTile(
                    leading: const Icon(Icons.email),
                    title: Text(
                      'arjundas@gmail.com',
                      style: TextStyle(color: AppColor().CardHeadingColor),
                    ),
                    subtitle: const Text('Secured'),
                  ),
                ),
                Card(
                  color: AppColor().ForCardBackground,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: ListTile(
                    leading: const Icon(Icons.person),
                    title: Text(
                      'Mobile Number',
                      style: TextStyle(color: AppColor().CardHeadingColor),
                    ),
                    subtitle: const Text('9237200127'),
                  ),
                ),
                Card(
                  color: AppColor().ForCardBackground,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: ListTile(
                    leading: const Icon(Icons.person),
                    title: Text(
                      'Saved Place',
                      style: TextStyle(color: AppColor().CardHeadingColor),
                    ),
                    subtitle: const Text('Add/edit/place'),
                  ),
                ),
                Card(
                  color: AppColor().ForCardBackground,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: ListTile(
                    leading: const Icon(Icons.language_outlined),
                    title: Text(
                      'App Language',
                      style: TextStyle(color: AppColor().CardHeadingColor),
                    ),
                    subtitle: const Text('English'),
                  ),
                ),
                Card(
                  color: AppColor().ForCardBackground,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: ListTile(
                    leading: const Icon(Icons.privacy_tip_outlined),
                    title: Text(
                      'Privacy Policy',
                      style: TextStyle(color: AppColor().CardHeadingColor),
                    ),
                    subtitle: const Text('Travel Karo User'),
                  ),
                ),
                Card(
                  color: AppColor().ForCardBackground,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: ListTile(
                    leading: const Icon(Icons.system_update),
                    title: Text(
                      'App Version',
                      style: TextStyle(color: AppColor().CardHeadingColor),
                    ),
                    subtitle: const Text('-0.0.1'),
                  ),
                ),
                Card(
                  color: AppColor().ForCardBackground,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: ListTile(
                    leading: const Icon(Icons.logout_rounded),
                    title: Text(
                      'Logout',
                      style: TextStyle(color: AppColor().CardHeadingColor),
                    ),
                    subtitle: const Text('Your Account'),
                  ),
                ),
              ]),
            )
          ],
        )

        //  Column(
        //   crossAxisAlignment: CrossAxisAlignment.start,
        //   children: [
        //     ListTile(
        //       leading: Icon(Icons.person),
        //       title: Text('Arjun Das'),
        //       subtitle: Text('Travel Karo User'),
        //       onTap: () {
        //         // Handle tap on the list item
        //         print('Tapped on Arjun Das');
        //       },
        //     ),
        //     ListTile(
        //       leading: Icon(Icons.email),
        //       title: Text('arjundas@example.com'),
        //       subtitle: Text('Email Address'),
        //       onTap: () {
        //         // Handle tap on the list item
        //         print('Tapped on Email');
        //       },
        //     ),
        //     ListTile(
        //       leading: Icon(Icons.phone),
        //       title: Text('+91 1234567890'),
        //       subtitle: Text('Phone Number'),
        //       onTap: () {
        //         // Handle tap on the list item
        //         print('Tapped on Phone Number');
        //       },
        //     ),
        //     // Add more ListTiles as needed
        //   ],
        // ),

        );
  }
}
