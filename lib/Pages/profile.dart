import 'package:flutter/material.dart';
import 'package:imart_project/Pages/login_page.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: list(),
    );
  }

  Widget customAppBar() {
    return Row(
      children: [
        IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
          iconSize: 25,
        ),
        Text(
          "Profile History",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
      ],
    );
  }

  Widget list() {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
          child: customAppBar(),
        ),
        Divider(
          thickness: 1,
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Card(
            color: Color.fromARGB(255, 238, 241, 243),
            // elevation: 40,
            // shadowColor: Colors.blue,
            child: Container(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Image.asset(
                          "assets/images/IMartLogo.png",
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Hari Jung Khadka",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text("9849562425")
                          ],
                        )
                      ],
                    ),
                  ),
                  Divider(
                    thickness: 15,
                    color: Colors.white,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => LoginPage()));
                    },
                    child: listTile(
                      Icons.account_box_sharp,
                      'Account Settings',
                    ),
                  ),
                  Divider(
                    thickness: 1,
                    color: Colors.white,
                  ),
                  InkWell(
                      onTap: () {},
                      child: listTile(Icons.info_outline, 'Addons')),
                  Divider(
                    thickness: 1,
                    color: Colors.white,
                  ),
                  InkWell(
                      onTap: () {},
                      child: listTile(
                          Icons.card_membership, 'Membership History')),
                  Divider(
                    thickness: 1,
                    color: Colors.white,
                  ),
                  InkWell(
                      onTap: () {},
                      child: listTile(Icons.request_page, 'API Prctice')),
                  Divider(
                    thickness: 1,
                    color: Colors.white,
                  ),
                  listTile(Icons.details, 'Save Details'),
                  Divider(
                    thickness: 15,
                    color: Colors.white,
                  ),
                  listTile(Icons.history, 'Profile History'),
                  Divider(
                    thickness: 1,
                    color: Colors.white,
                  ),
                  InkWell(
                      onTap: () {},
                      child: listTile(Icons.travel_explore, 'Rider Track')),
                  Divider(
                    thickness: 1,
                    color: Colors.white,
                  ),
                  listTile(Icons.policy, 'Terms And Policy'),
                  Divider(
                    thickness: 1,
                    color: Colors.white,
                  ),
                  listTile(Icons.money_rounded, 'Unpaid Amount'),
                  Divider(
                    thickness: 15,
                    color: Colors.white,
                  ),
                  listTile(Icons.info, 'About Us'),
                  Divider(
                    thickness: 1,
                    color: Colors.white,
                  ),
                  listTile(Icons.policy, 'Terms And Policy'),
                  Divider(
                    thickness: 1,
                    color: Colors.white,
                  ),
                  listTile(Icons.contact_mail, 'Contact Us'),
                  Divider(
                    thickness: 1,
                    color: Colors.white,
                  ),
                  listTile(Icons.logout, 'Logout'),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget listTile(
    IconData iconImage,
    String title,
  ) {
    return ListTile(
      leading: Icon(
        iconImage,
        color: Colors.black,
      ),
      title: Text(title, style: TextStyle(color: Colors.black)),
    );
  }
}
