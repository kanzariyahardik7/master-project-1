import 'package:flutter/material.dart';

class TeamFolderPage extends StatefulWidget {
  const TeamFolderPage({Key? key}) : super(key: key);

  @override
  State<TeamFolderPage> createState() => _TeamFolderPageState();
}

class _TeamFolderPageState extends State<TeamFolderPage> {
  double availableScreenWidth = 0;
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    availableScreenWidth = MediaQuery.of(context).size.width - 50;
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(25),
            alignment: Alignment.bottomCenter,
            height: 170,
            decoration: BoxDecoration(color: Colors.blue.shade800),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  // mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Riotters",
                      style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    Text(
                      "Team Folder",
                      style: TextStyle(fontSize: 17, color: Colors.white),
                    )
                  ],
                ),
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.black.withOpacity(0.1)),
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.search,
                          size: 28,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.black.withOpacity(0.1)),
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.notifications,
                          size: 28,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                    text: TextSpan(
                        text: "Storage",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.black),
                        children: [
                      TextSpan(
                        text: "9.6/10",
                        style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 16,
                            color: Colors.black),
                      ),
                    ])),
                Text(
                  "Upgrade",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.blue),
                )
              ],
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Row(
              children: [
                buildFileSizeChart("SOURCES", Colors.black, .3),
                SizedBox(
                  width: 2,
                ),
                buildFileSizeChart("DOOCS", Colors.red, .25),
                SizedBox(
                  width: 2,
                ),
                buildFileSizeChart("IMAGES", Colors.yellow, .20),
                SizedBox(
                  width: 2,
                ),
                buildFileSizeChart("", Colors.grey.shade200, .23),
              ],
            ),
          ),
          SizedBox(
            width: 15,
          ),
          Divider(
            height: 20,
            color: Colors.grey,
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(25),
              children: [
                Text(
                  "Recently updated ",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    buildFileColumn( "assets/images/profile.jpeg","desktop", ".sketch"),
                    SizedBox(
                      width: availableScreenWidth * 0.03,
                    ),
                    buildFileColumn( "assets/images/profile.jpeg","mobile", ".sketch"),
                    SizedBox(
                      width: availableScreenWidth * 0.03,
                    ),
                    buildFileColumn("assets/images/profile.jpeg","interaction", ".prd"),
                  ],
                ),
                Divider(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Project",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                    Text(
                      "Create new",
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                BuildProjectRow("ChatBox"),
                BuildProjectRow("TimeNote"),
                BuildProjectRow("Something"),
                BuildProjectRow("Others"),
              ],
            ),
          )
        ],
      ),
      floatingActionButton: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow:[ BoxShadow(color: Colors.white,spreadRadius: 7,blurRadius: 1)]
        ),
        child: FloatingActionButton(
          onPressed: (){
            Navigator.of(context).pop();
          },
          child: Icon(Icons.arrow_back),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationBar(
          onTap: (index) {
            setState(() {
              selectedIndex = index;
            });
          },
          currentIndex: selectedIndex,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.access_time), label: "time"),
            BottomNavigationBarItem(icon: Icon(Icons.add_box), label: "Folder")
          ]),
    );
  }

  ///********************************=======================*****************************///
  Column buildFileSizeChart(String title, Color color, double widthPercentage) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 4,
          width: availableScreenWidth * widthPercentage,
          color: color,
        ),
        SizedBox(
          height: 8,
        ),
        Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
        )
      ],
    );
  }

  ///********************************======================***********************///

  Column buildFileColumn( String image,String filename, String extension) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(38),
          width: availableScreenWidth * .31,
          height: 110,
          decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(20)),
          child: Image.asset(image),
        ),
        SizedBox(
          height: 15,
        ),
        RichText(
          text: TextSpan(
              text: filename,
              style: TextStyle(color: Colors.black, fontSize: 14),
              children: [
                TextSpan(
                    text: extension,
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                        fontWeight: FontWeight.w300))
              ]),
        )
      ],
    );
  }

///***************************=================================****************************///

  Container BuildProjectRow(String folderName) {
    return Container(
      margin: EdgeInsets.only(bottom: 8),
      padding: EdgeInsets.symmetric(horizontal: 20),
      height: 65,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), color: Colors.grey.shade200),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                Icons.folder,
                color: Colors.blue.shade200,
              ),
              SizedBox(
                width: 12,
              ),
              Text(
                folderName,
                style: TextStyle(fontSize: 16),
              )
            ],
          ),
          IconButton(onPressed: () {}, icon: Icon(Icons.more_vert_outlined))
        ],
      ),
    );
  }
}
