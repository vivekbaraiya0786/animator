import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Theme_provider.dart';

class PersonPage extends StatefulWidget {
  const PersonPage({Key? key}) : super(key: key);

  @override
  State<PersonPage> createState() => _PersonPageState();
}

class _PersonPageState extends State<PersonPage> {
  bool notification = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double _height = size.height;
    double _width = size.width;

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
            gradient: (Provider.of<ChangeThemeProvider>(context, listen: true)
                    .changethemeModel
                    .isDark)
                ? const LinearGradient(
                    colors: [
                      Color(0xff130320),
                      Color(0xff2a0d2b),
                    ],
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                  )
                : const LinearGradient(
                    colors: [
                      Colors.white,
                      Colors.black12,
                    ],
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                  )),
        child: Padding(
          padding: const EdgeInsets.only(
            top: 20,
            right: 10,
            left: 10,
          ),
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.keyboard_arrow_left, size: 30),
                  ),
                  SizedBox(
                    width: _height * 0.12,
                  ),
                  Text(
                    "Settings",
                    style: TextStyle(fontSize: 18),
                  )
                ],
              ),
              SizedBox(
                height: _height * 0.015,
              ),
              const Card(
                borderOnForeground: true,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          child: Icon(Icons.person),
                        ),
                        title: Text("Vivek Baraiya",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        subtitle: Text("baraiyavivek48@gmail.com"),
                        trailing: Icon(Icons.chevron_right),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: _height * 0.01,
              ),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const Icon(Icons.notifications_none),
                              SizedBox(
                                width: _width * 0.03,
                              ),
                              const Text("Notification",
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                            ],
                          ),
                          Switch(
                            value: notification,
                            onChanged: (value) {
                              setState(() {
                                notification = value;
                              });
                            },
                          )
                        ],
                      ),
                      SizedBox(
                        height: _height * 0.01,
                      ),
                      const Divider(),
                      SizedBox(
                        height: _height * 0.01,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const Icon(Icons.dark_mode_outlined),
                              SizedBox(
                                width: _width * 0.03,
                              ),
                              const Text("Dark Mode",
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                            ],
                          ),
                          Switch(
                            value: Provider.of<ChangeThemeProvider>(context,
                                    listen: true)
                                .changethemeModel
                                .isDark,
                            onChanged: (value) {
                              Provider.of<ChangeThemeProvider>(context,
                                      listen: false)
                                  .chnageTheme();
                            },
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: _height * 0.01,
              ),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("What's new",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          Icon(
                            CupertinoIcons.arrow_up_right,
                            size: 20,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: _height * 0.01,
                      ),
                      const Divider(),
                      SizedBox(
                        height: _height * 0.01,
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("FAQs / Contact us",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          Icon(
                            CupertinoIcons.arrow_up_right,
                            size: 20,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: _height * 0.01,
                      ),
                      const Divider(),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Community guidelines",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          Icon(
                            CupertinoIcons.arrow_up_right,
                            size: 20,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: _height * 0.01,
                      ),
                      const Divider(),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Terms of condition",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          Icon(
                            CupertinoIcons.arrow_up_right,
                            size: 20,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: _height * 0.01,
                      ),
                      const Divider(),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Privacy policies",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          Icon(
                            CupertinoIcons.arrow_up_right,
                            size: 20,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
