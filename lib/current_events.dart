import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:first_app/todomodels.dart';
import 'package:first_app/user_profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {


  int selectedIndex = 0; //to handle which item is currently selected in the bottom app bar
  String text = "Home";
  void updateTabSelection(int index, String buttonText) {
    setState(() {
      selectedIndex = index;
      text = buttonText;
    });
  }


  @override
  Widget build(BuildContext context) {
    return  DefaultTabController(
      // length: 2,
      // child: Scaffold(
      //   appBar: AppBar(
      //     backgroundColor: Colors.white,
      //     toolbarHeight: 120,
      //     leading: Icon(Icons.menu ,size: 20, color: Colors.black,),
      //     titleSpacing: 0,
      //     title: Text("MY JIIVO" ,style :TextStyle(color: Color(0xff000000) , fontSize: 17),),
      //     actions: [
      //       Icon(Icons.search , color: Color(0xffFF8701),),
      //       SizedBox(width: 16,)
      //     ],
      //     bottom: TabBar(
      //       isScrollable: true,
      //       labelStyle: TextStyle(color: Color(0xffBCBCBC) , fontSize: 16),
      //       unselectedLabelColor: Color(0xffBCBCBC),
      //       labelColor:  Color(0xffBCBCBC),
      //       indicatorColor: Color(0xffFF8701),
      //       indicatorWeight: 3,
      //       labelPadding: EdgeInsets.only(left: 30 ,right: 30),
      //       tabs: [
      //         Tab(text: "Current event",),
      //         Tab(text: "Past event",),
      //       ],
      //     ),
      //   ),
      //   body: TabBarView(
      //     children: [
      //       CurrentEvent(),
      //       PastEvent(),
      //
      //     ],
      //   ),
      //   floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked, //specify the location of the FAB
      //   floatingActionButton: FloatingActionButton(
      //     onPressed: () {
      //
      //     },
      //
      //     tooltip: "Centre FAB",
      //     child: Container(
      //
      //       child: Center(child: Icon(Icons.add ,size: 30,)),
      //       decoration: BoxDecoration(
      //           boxShadow: [
      //             BoxShadow(
      //                 color: Color(0x5CFF8701),
      //                 offset: Offset(0,10),
      //                 blurRadius: 15
      //             )
      //           ]
      //       ),
      //     ),
      //     elevation: 4.0,
      //   ),
      //   bottomNavigationBar: BottomAppBar(
      //     child: Container(
      //
      //       decoration: BoxDecoration(
      //           color: Color(0xFFFFFF),
      //           borderRadius: BorderRadius.circular(10),
      //           boxShadow: [
      //             BoxShadow(
      //                 color: Color(0xff00000029),
      //                 offset: Offset(0,3),
      //                 blurRadius: 6
      //             )
      //           ]
      //       ),
      //       margin: EdgeInsets.only(bottom: 5 ),
      //       height: 70,
      //       child: Row(
      //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //         children: [
      //           Column(
      //             children: [
      //               IconButton(icon: Icon( Icons.event_available ,color: selectedIndex == 0
      //                   ? Color(0xffFF8701)
      //                   : Color(0xffD2D8CF),size: 20,), onPressed: (){
      //                 updateTabSelection(0, "Events");
      //
      //               }),
      //               Text("Event" , style: TextStyle(color: selectedIndex == 0
      //                   ? Color(0xffFF8701)
      //                   : Color(0xffD2D8CF), fontSize: 13),)
      //             ],
      //           ),
      //           SizedBox(width: 20,),
      //           Column(
      //             children: [
      //               IconButton(icon: Icon(Icons.person ,   size: 20, color: selectedIndex == 1
      //                   ? Color(0xffFF8701)
      //                   : Color(0xffD2D8CF),), onPressed: (){
      //                 Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfileClass()));
      //                 updateTabSelection(1, "profile");
      //
      //               }),
      //               Text("profile"  , style: TextStyle(color: selectedIndex == 1
      //                   ? Color(0xffFF8701)
      //                   : Color(0xffD2D8CF),
      //                   fontSize: 13),)
      //             ],
      //           ),
      //
      //         ],
      //       ),
      //     ),
      //     shape: CircularNotchedRectangle(),
      //
      //
      //   ),
      // ),
      length: 2,
      child: Scaffold(
        backgroundColor: Color(0xFFF7FBFE),
        appBar: AppBar(
          backgroundColor: Color(0xFFFFFFFF),
          elevation: 0,
          leading: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 10, vertical: 20),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 3.5,
                          width: 15,
                          decoration: BoxDecoration(
                              color: Colors.black,
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(2)),
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Container(
                          height: 3.5,
                          width: 20,
                          decoration: BoxDecoration(
                              color: Colors.black,
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(5)),
                        ),
                        SizedBox(
                          height: 2,
                        ),
                      ],
                    ),
                    Container(
                      height: 3.5,
                      width: 15,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(5)),
                    ),
                  ],
                ),
              ],
            ),
          ),
          centerTitle: false,
          title: Text(
            "My Jiivo",
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 20),
          ),
          actions: [
            IconButton(
                icon: Icon(
                  Icons.search_rounded,
                  color: Color(0xFFFF8701),
                ),
                onPressed: () {}),
          ],
          bottom: TabBar(
            indicator: UnderlineTabIndicator(
              borderSide: BorderSide(
                width: 3.0,
                color: Color(0xFFFF8701),
              ),
              insets: EdgeInsets.symmetric(horizontal: 40.0),
            ),
            tabs: [
              Tab(
                  child: Text(
                    "Current event",
                    style: TextStyle(
                        color: Color(0xFFBCBCBC),
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  )),
              Tab(
                  child: Text(
                    "Past event",
                    style: TextStyle(
                        color: Color(0xFFBCBCBC),
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  )),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // SingleChildScrollView(
            //   child: Container(
            //     padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            //     child: Column(
            //       children: [
            //         //_buildBody(),
            //         ListView.separated(
            //           physics: NeverScrollableScrollPhysics(),
            //           primary: false,
            //           shrinkWrap: true,
            //           itemCount: image.length,
            //           itemBuilder: (context, index) {
            //             return Events(
            //               // color: Color(0xFFF3BB76),
            //               image: image[index],
            //               day: day[index],
            //               month: month[index],
            //               title: title[index],
            //               imagename: imagename[index],
            //               time: time[index],
            //               location: location[index],
            //               // name: listDoctors[index],
            //             );
            //           },
            //           separatorBuilder: (context, index) {
            //             return SizedBox(
            //               height: 10,
            //             );
            //           },
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
            // PastEvents(),
            CurrentEvent(),
                  PastEvent(),
          ],
        ),
        floatingActionButtonLocation:
        FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Container(
          height: 64,
          width: 64,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xFFFF8701),
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 10),
                  blurRadius: 20,
                  color: Color(0x5CFF8701),
                )
              ]),
          child: IconButton(
              icon: Icon(Icons.add, color: Colors.white, size: 30),
              onPressed: () {}),
        ),
        bottomNavigationBar: BottomAppBar(
          shape: CircularNotchedRectangle(),
          child: Container(
            height: 80,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      IconButton(
                          icon: Icon(Icons.event_note_sharp, size: 30),
                          color: Color(0xFFFF8701),
                          onPressed: () {}),
                      Text(
                        "Event",
                        style: TextStyle(
                            color: Color(0xFFFF8701),
                            fontWeight: FontWeight.bold,
                            fontSize: 13),
                      )
                    ],
                  ),
                  SizedBox(),
                  Column(
                    children: [
                      IconButton(
                          icon: Icon(Icons.people_alt_outlined, size: 30),
                          color: Colors.grey[200],
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProfileClass(),
                              ),
                            );
                          }),
                      Text(
                        "Profile",
                        style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                            fontSize: 13),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CurrentEvent extends StatefulWidget {
  const CurrentEvent({
    // this.image,
    this.day,
    // this.month,
    // this.title,
    // this.imagename,
    // this.time,
    // this.location,
    Key key,
  }) : super(key: key);
  // final String image;
  final String day;
  // final String month;
  // final String title;
  // final String imagename;
  // final String time;
  // final String location;

  @override
  _CurrentEventState createState() => _CurrentEventState();
}

class _CurrentEventState extends State<CurrentEvent> {
  Welcome listTodos = Welcome();
  bool fetching = true;

  void getHttp() async {
    setState(() {
      fetching = true;
    });
    try {
      Response response =
      await Dio().get("https://networkintern.herokuapp.com/api/events?type=current");
      setState(() {
        listTodos = welcomeFromJson(jsonEncode(response.data)) ;
        fetching = false;
      });
    } catch (e) {
      setState(() {
        fetching = false;
      });
      print(e);
    }
  }

  @override
  void initState() {
    getHttp();
    super.initState();
  }
  // List<String> image = [
  //   "assets/images/devfest.jfif",
  //   "assets/images/comady.jfif",
  //   "assets/images/annual.jfif",
  // ];
  List<String> day = [
    "22",
    "28",
    "29",
  ];
  // List<String> month = [
  //   "Feb",
  //   "Feb",
  //   "Feb",
  // ];
  // List<String> title = [
  //   "Google dev festival & meetup & Start up business idea",
  //   "Standup Comdian by Varun laughter club shows",
  //   "Annual Function",
  // ];
  // List<String> imagename = [
  //   "Google Devfest",
  //   "Stand Up Comady",
  //   "Annual Function",
  // ];
  // List<String> time = [
  //   "10.30Am - 01.00PM",
  //   "08.30PM - 10.00PM",
  //   "10.30Am - 01.00PM",
  // ];
  // List<String> location = [
  //   "ITI, Mumbai...",
  //   "C N Vidhyalay, Ahmedabad...",
  //   "VIET, Visakhapatnam",
  // ];

  // List <String> img = [  "assets/images/dev2.png" ,"assets/images/dev.png"  ,"assets/images/meme.jpg"];
  //
  // List <String> title = [ "Google dev festival & meetup \n& Start up business idea " , "Standup Comdian by Varun \nlaughter club shows " ,"Standup Comdian by Varun \nlaughter club shows" ,];
  //
  // List <String> date = [ "22" , "28" , "30"];
  //
  // List <String> subtitle = [ "Google Devfest" , "LDevlop Thecho" , "Child Play Center"];


  @override
  Widget build(BuildContext context) {
    if (fetching) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
    if (listTodos.events.length == 0) {
      return Center(
        child: Text("No Data"),
      );
    }
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, ),
      color: Color(0xffF7FBFE),
      padding: EdgeInsets.only(top: 18),
      child:
      ListView.builder(
          itemCount: listTodos.events.length,
          itemBuilder: (context , index){
            Welcome todo = listTodos;
            return Column(
              children: [

                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                            color: Color(0xff00000008),
                            offset: Offset(0,3),
                            blurRadius: 6
                        )
                      ]
                  ),

                  child: Column(
                    children: [
                      SizedBox(height: 20,),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height:40,
                              width: 40,
                              decoration: BoxDecoration(
                                  color: Color(0xffFFF6EE),
                                  border: Border(
                                    left: BorderSide(color: Color(0xffFF8701)),
                                    right: BorderSide(color: Color(0xffFF8701)),
                                    top: BorderSide(color: Color(0xffFF8701)),
                                    bottom: BorderSide(color: Color(0xffFF8701)),
                                  ),
                                  borderRadius: BorderRadius.circular(5)
                              ),
                              child:Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                 "22",
                                                  style: TextStyle(
                                                      color: Color(0xFFFF8701),
                                                      fontSize: 11,
                                                      fontWeight: FontWeight.bold),
                                                ),
                                                Text(
                                                  "\nFeb",
                                                  style: TextStyle(
                                                      color: Color(0xFF2A3E68),
                                                      fontSize: 6,
                                                      fontWeight: FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                          ),
                            SizedBox(width: 11,),
                            Container(
                              child: Text("${todo.events[index].title}"
                                , style: TextStyle(color:Color(0xff2A3E68), fontWeight: FontWeight.bold,fontSize: 13 ),),
                            ),
                          ],
                        ),
                      ),


                     // SizedBox(height: 10,),
            Container(
            padding: EdgeInsets.symmetric(vertical: 15),

            child: Image.network("${todo.events[index].bannerImage}" ),

            ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text( "${todo.events[index].description}"  ,
                            style: TextStyle(color: Color(0xff2A3E68) , fontWeight: FontWeight.bold, fontSize: 16),),
                          SizedBox(height: 5,),
                          Row(
                              children: [
                                Text(
                                  "${todo.events[index].from}",
                                  style: TextStyle(color: Color(0xffA1A0A0) , fontWeight: FontWeight.w400 , fontSize: 13),),
                                SizedBox(width: 5,),
                                Text(
                                  "-",

                                  style: TextStyle(color: Color(0xffA1A0A0) , fontWeight: FontWeight.w400 , fontSize: 13),),
                                SizedBox(width: 5,),


                                Text(
                                  "${todo.events[index].to}",
                                  style: TextStyle(color: Color(0xffA1A0A0) , fontWeight: FontWeight.w400 , fontSize: 13),),
                                SizedBox(
                                  width: 10,
                                ),
                                Icon(
                                  Icons.circle,
                                  size: 3,
                                  color: Color(0xFFA1A0A0),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "${todo.events[index].location}",
                                  style: TextStyle(color: Color(0xffA1A0A0) , fontWeight: FontWeight.w400 , fontSize: 13),)
                              ],
                            ),

                        ],
                      ),
                    ),
                      SizedBox(height: 5,),
                      Container(
                          margin: EdgeInsets.symmetric(horizontal: 20),
                          alignment: Alignment.bottomRight,
                          child: Stack(
                            overflow: Overflow.visible,
                            children: [
                              Positioned(
                                left: -40,
                                child: CircleAvatar(
                                  backgroundImage: AssetImage("assets/images/prasad.jpg"),
                                  radius: 12,
                                ),
                              ),
                              Positioned(
                                left: -30,
                                child: CircleAvatar(
                                  backgroundImage: AssetImage("assets/images/apparna.jpg"),
                                  radius: 12,
                                ),
                              ),
                              Positioned(
                                left: -20,
                                child: CircleAvatar(
                                  backgroundImage: AssetImage("assets/images/sowmya.jpg"),
                                  radius: 12,
                                ),
                              ),
                              Positioned(
                                left: -10,
                                child: CircleAvatar(
                                  backgroundImage: AssetImage("assets/images/sunil.jpg"),
                                  radius: 12,
                                ),
                              ),
                              Positioned(

                                child: CircleAvatar(
                                  backgroundColor: Color(0xffFF8701),
                                  child: Center(child: Text("99+" , style: TextStyle(fontSize: 8, color: Colors.white),)),
                                  radius: 12,
                                ),
                              ),

                            ],
                          )
                      ),
                      SizedBox(height: 12,),
                    ],
                  ),
                ),
                SizedBox(height: 10,)
              ],
            ) ;
          }
      ),
    );
  }
}

class PastEvent extends StatefulWidget {
  @override
  _PastEventState createState() => _PastEventState();
}

class _PastEventState extends State<PastEvent> {
  Welcome listTodos = Welcome();
  bool fetching = true;

  void getHttp() async {
    setState(() {
      fetching = true;
    });
    try {
      Response response =
      await Dio().get("https://networkintern.herokuapp.com/api/events?type=current");
      setState(() {
        listTodos = welcomeFromJson(jsonEncode(response.data)) ;
        fetching = false;
      });
    } catch (e) {
      setState(() {
        fetching = false;
      });
      print(e);
    }
  }

  @override
  void initState() {
    getHttp();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    if (fetching) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
    if (listTodos.events.length == 0) {
      return Center(
        child: Text("No Data"),
      );
    }
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, ),
      color: Color(0xffF7FBFE),
      padding: EdgeInsets.only(top: 18),
      child:
      ListView.builder(
          itemCount: listTodos.events.length,
          itemBuilder: (context , index){
            Welcome todo = listTodos;
            return Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                            color: Color(0xff00000008),
                            offset: Offset(0,3),
                            blurRadius: 6
                        )
                      ]
                  ),

                  child: Column(
                    children: [
                      SizedBox(height: 20,),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height:40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                      color: Color(0xffFFF6EE),
                                      border: Border(
                                        left: BorderSide(color: Color(0xffFF8701)),
                                        right: BorderSide(color: Color(0xffFF8701)),
                                        top: BorderSide(color: Color(0xffFF8701)),
                                        bottom: BorderSide(color: Color(0xffFF8701)),
                                      ),
                                      borderRadius: BorderRadius.circular(5)
                                  ),
                                  child:Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "22",
                                        style: TextStyle(
                                            color: Color(0xFFFF8701),
                                            fontSize: 11,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "\nFeb",
                                        style: TextStyle(
                                            color: Color(0xFF2A3E68),
                                            fontSize: 6,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(width: 11,),
                                Container(
                                  child: Text("${todo.events[index].title}"
                                    , style: TextStyle(color:Color(0xff2A3E68), fontWeight: FontWeight.bold,fontSize: 13 ),),
                                ),
                              ],
                            ),
                            Icon(Icons.favorite_border,color: Color(0xFFFF8701),),
                          ],
                        ),
                      ),

                      // SizedBox(height: 10,),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 15),

                        child: Image.network("${todo.events[index].bannerImage}" ),

                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text( "${todo.events[index].description}"  ,
                              style: TextStyle(color: Color(0xff2A3E68) , fontWeight: FontWeight.bold, fontSize: 16),),
                            SizedBox(height: 5,),
                            Row(
                              children: [
                                Text(
                                  "${todo.events[index].from}",
                                  style: TextStyle(color: Color(0xffA1A0A0) , fontWeight: FontWeight.w400 , fontSize: 13),),
                                SizedBox(width: 5,),
                                Text(
                                  "-",

                                  style: TextStyle(color: Color(0xffA1A0A0) , fontWeight: FontWeight.w400 , fontSize: 13),),
                                SizedBox(width: 5,),


                                Text(
                                  "${todo.events[index].to}",
                                  style: TextStyle(color: Color(0xffA1A0A0) , fontWeight: FontWeight.w400 , fontSize: 13),),
                                SizedBox(
                                  width: 10,
                                ),
                                Icon(
                                  Icons.circle,
                                  size: 3,
                                  color: Color(0xFFA1A0A0),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "${todo.events[index].location}",
                                  style: TextStyle(color: Color(0xffA1A0A0) , fontWeight: FontWeight.w400 , fontSize: 13),)
                              ],
                            ),

                          ],
                        ),
                      ),
                      SizedBox(height: 5,),
                      Container(
                          margin: EdgeInsets.symmetric(horizontal: 20),
                          alignment: Alignment.bottomRight,
                          child: Stack(
                            overflow: Overflow.visible,
                            children: [
                              Positioned(
                                left: -40,
                                child: CircleAvatar(
                                  backgroundImage: AssetImage("assets/images/prasad.jpg"),
                                  radius: 12,
                                ),
                              ),
                              Positioned(
                                left: -30,
                                child: CircleAvatar(
                                  backgroundImage: AssetImage("assets/images/apparna.jpg"),
                                  radius: 12,
                                ),
                              ),
                              Positioned(
                                left: -20,
                                child: CircleAvatar(
                                  backgroundImage: AssetImage("assets/images/sowmya.jpg"),
                                  radius: 12,
                                ),
                              ),
                              Positioned(
                                left: -10,
                                child: CircleAvatar(
                                  backgroundImage: AssetImage("assets/images/sunil.jpg"),
                                  radius: 12,
                                ),
                              ),
                              Positioned(

                                child: CircleAvatar(
                                  backgroundColor: Color(0xffFF8701),
                                  child: Center(child: Text("99+" , style: TextStyle(fontSize: 8, color: Colors.white),)),
                                  radius: 12,
                                ),
                              ),

                            ],
                          )
                      ),
                      SizedBox(height: 12,),
                    ],
                  ),
                ),
                SizedBox(height: 10,)
              ],
            ) ;
          }
      ),
    );
  }
}




