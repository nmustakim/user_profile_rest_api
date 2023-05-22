import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../const.dart';
import '../models/user.dart';

class ProfileScreen extends StatelessWidget {
  final User user;
  ProfileScreen({super.key, required this.user});
  final ImagePicker picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.lightGreen,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(
                        Icons.navigate_before,
                        size: 35,
                      )),
                  const Center(
                    child: Icon(
                      Icons.person_outline_sharp,
                      size: 130,
                    ),
                  ),
                  Center(
                      child: Column(
                    children: [
                      Text(
                        user.name,
                        style: titleTextStyle1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        user.email,
                        style: bodyTextStyle1,
                      )
                    ],
                  )),
                  const SizedBox(
                    height: 25,
                  ),
                  Card(
                      child: ListTile(
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Username',
                                style: titleTextStyle2,
                              ),
                              Text(
                                "ID: ${user.id.toString()}",
                                style: titleTextStyle2,
                              )
                            ],
                          ),
                          subtitle: Text(
                            user.username,
                            style: bodyTextStyle1,
                          ))),
                  Card(
                    child: ListTile(
                        title: Text('Phone', style: titleTextStyle2),
                        subtitle: Text(
                          user.phone,
                          style: bodyTextStyle1,
                        )),
                  ),
                  Card(
                    child: ListTile(
                        title: Text('Company', style: titleTextStyle2),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              user.company.name,
                              style: bodyTextStyle1,
                            ),
                            Text(
                              user.company.catchPhrase,
                              style: bodyTextStyle1,
                            ),
                            Text(
                              user.company.bs,
                              style: bodyTextStyle1,
                            )
                          ],
                        )),
                  ),
                  Card(
                    child: ListTile(
                        title: Text('Website', style: titleTextStyle2),
                        subtitle: Text(
                          user.website,
                          style: bodyTextStyle1,
                        )),
                  ),
                  Card(
                    child: ListTile(
                        title: Text('Address', style: titleTextStyle2),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  Text(
                                    "${user.address.city}, ${user.address.street}, ${user.address.suite}",
                                    style: bodyTextStyle1,
                                  )
                                ],
                              ),
                            ),
                            Text(
                              "Zip: ${user.address.zipcode}",
                              style: bodyTextStyle1,
                            ),
                            Row(
                              children: [
                                Text(
                                  "Lat: ${user.address.geo.lat}, Lon: ${user.address.geo.lng}",
                                  style: bodyTextStyle1,
                                )
                              ],
                            )
                          ],
                        )),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
