import 'package:app1/widgets/MenuWidget.dart';
import 'package:app1/widgets/PromptWidget.dart';
import 'package:flutter/material.dart';

class AdminPanelPage extends StatefulWidget {
  @override
  _AdminPanelPageState createState() => _AdminPanelPageState();
}

class _AdminPanelPageState extends State<AdminPanelPage> {
  bool isMenuOpen = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                SizedBox(height: 15),
                Row(
                  children: [
                    Image.asset(
                      'images/logo.png',
                      height: 40,
                    ),
                    SizedBox(width: 15),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 15),
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        height: 55,
                        decoration: BoxDecoration(
                          color: Color(0xFFF5F9FD),
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xFF475269),
                              blurRadius: 3,
                              spreadRadius: 1,
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Search",
                                ),
                              ),
                            ),
                            Icon(
                              Icons.search,
                              size: 27,
                              color: Color(0xFF475269),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 15),
                    Padding(
                      padding: EdgeInsets.only(right: 15),
                      child: MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              isMenuOpen = !isMenuOpen;
                            });
                          },
                          child: Icon(
                            Icons.menu_sharp,
                            size: 35,
                            color: Color(0xFF475269),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                PromptWidget(),
                SizedBox(height: 30),
              ],
            ),
            if (isMenuOpen)
              Positioned.fill(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      isMenuOpen = false;
                    });
                  },
                  child: Container(
                    color: Colors.black.withOpacity(0.5),
                  ),
                ),
              ),
            if (isMenuOpen)
              Positioned(
                top: 0,
                right: 0,
                bottom: 0,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [                      
                      MenuWidget(
                        onClose: () {
                          setState(() {
                            isMenuOpen = false;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
