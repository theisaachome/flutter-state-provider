import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providerapp/model/user.dart';

void main() {
  runApp(Provider(create: (context) => User(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context).currentUser;
    return Scaffold(
      appBar: AppBar(
        title: Text("Provider Demo"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.settings),
          )
        ],
      ),
      body: Column(
        children: [PostWidget(user)],
      ),
    );
  }
}

class PostWidget extends StatelessWidget {
  final User user;
  PostWidget(this.user);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                //profile
                CircleAvatar(
                  backgroundImage: NetworkImage(user.profileImage),
                ),
                SizedBox(
                  width: 6.0,
                ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // name
                    Text(
                      user.name,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    Row(
                      children: [
                        Text("12 h"),
                        SizedBox(
                          width: 6,
                        ),
                        Icon(
                          Icons.public,
                          size: 14,
                        ),
                      ],
                    )
                  ],
                ),
                Spacer(),
                Icon(Icons.more_horiz),
              ],
            ),
          ),
          Container(
            height: 300,
            width: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover, image: NetworkImage(user.postImage))),
          )
        ],
      ),
    );
  }
}
