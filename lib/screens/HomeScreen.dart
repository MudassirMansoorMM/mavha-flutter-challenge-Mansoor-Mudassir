import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mavha_flutter_challenge/constants.dart';
import 'TaskScreen.dart';



class HomeScreen extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    return _HomeScreen();
  }

}




class _HomeScreen extends State{

  double _screenHeight , _screenWidth;


  int _selectedIndex = 0 ;


  /// List of Days
  List<int> Days  = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30];


  @override
  Widget build(BuildContext context) {

    _screenHeight = MediaQuery.of(context).size.height;
    _screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(


      /// Floating ACTION Button here  =========================================
      floatingActionButton: FloatingActionButton(

        backgroundColor: Theme.of(context).primaryColorDark,

        child: Icon(Icons.add),
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15))),

        onPressed: (){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => TaskScreen()),
          );
          },

      ),


      /// App Bar ==============================================================
      appBar: AppBar(

        elevation: 0,
        brightness: Brightness.light,
        title: Center(child: Text("MY LIST",style: TextStyle(color: Colors.white , fontWeight: FontWeight.bold),),),
        leading: Icon(Icons.arrow_back,color: Colors.white),

        actions: <Widget>[
          Icon(Icons.more_horiz,color: Colors.white,),
          SizedBox(width: kDefaultPadding,)
        ],

      ),


      /// Body Starts here =====================================================
      /// Body Starts here =====================================================
      body: Stack(children: <Widget>[

        Container(
          height: _screenHeight *.3,
          width: _screenWidth,
          color: Theme.of(context).primaryColor,

          padding: EdgeInsets.only(left: 15 ,right: 15),


        ),

        /// Date picker List  ==================================================
        Container(
          height: _screenHeight*.1 ,
          padding: EdgeInsets.only(left: 15, right: 15),

          child: ListView.builder(

            scrollDirection: Axis.horizontal,
            itemCount: Days.length,
            itemBuilder: (BuildContext ctxt, int index) {

              return new InkWell(

                  onTap: (){
                    setState(() {
                      _selectedIndex = index;
                      kselectedDate = index + 1; /// Set Selected Date for next Screen
                    });
                  },


                  child: Container(
                      height: 100,
                      width:50,
                      margin: EdgeInsets.all(5),

                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5) ,
                        color: _selectedIndex == index ? Colors.white : Theme.of(context).primaryColorDark,
                      ),

                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[

                        SizedBox(height: 5,),

                        Text(Days[index].toString(),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: kTextSubheading,
                            color: _selectedIndex == index ? Theme.of(context).primaryColorDark : Colors.white,
                          ),
                        ),

                        SizedBox(height: 10,),

                        /// Checks for automating day against a date
                        Text(
                          (index % 7 == 1) ? "Mon" :
                          (index % 7 == 2) ? "Tue" :
                          (index % 7 == 3) ? "Wed" :
                          (index % 7 == 4) ? "Thu" :
                          (index % 7 == 5) ? "Fri" :
                          (index % 7 == 6) ? "Sat" :
                          "Sun",

                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: kTextSubheading,
                            color: _selectedIndex == index ? Theme.of(context).primaryColorDark : Colors.white,
                          ),
                        ),


                      ],)
                )
              );

            }
        ),),

        /// Task Menu Cards ====================================================
        Container(
          margin: EdgeInsets.only(top : _screenHeight * .12),
          height: double.infinity ,
          width: _screenWidth,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))
          ),

          child: SingleChildScrollView(

            child: Container(
              padding: EdgeInsets.all(kDefaultPadding),

              child: Column(children: <Widget>[

                /// All Tasks & Personal =======================================
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[


                    InkWell(

                        onTap: (){

                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => TaskScreen()),
                            );

                        },
                        child: Container(

                        height: _screenWidth * .5,
                        width: _screenWidth *.4,


                        decoration: BoxDecoration(

                          borderRadius: BorderRadius.circular(15),
                          color: Theme.of(context).primaryColorLight,

                        ),

                        margin: EdgeInsets.all(kDefaultPadding/2),
                        child: Center(child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[

                            Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  color: Theme.of(context).primaryColor.withOpacity(.2)
                              ),
                              child: Icon(Icons.event_note, size: 40, color: Theme.of(context).primaryColorDark,),
                            ),

                            SizedBox(height: kDefaultPadding,),

                            Text("All Tasks",
                              style: TextStyle(
                                fontSize: kTextHeading,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).primaryColorDark,
                              ),
                            ),

                            SizedBox(height: kDefaultPadding/4,),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[

                                Icon(Icons.access_time , color: Colors.black.withOpacity(.3), size: kText + 2,),

                                SizedBox(width: kDefaultPadding/2,),

                                Text("20 Items",
                                  style: TextStyle(
                                      color: Colors.black.withOpacity(.3),
                                      fontSize: kText
                                  ),
                                )

                              ],)



                          ],),)

                    )),




                    Container(

                      height: _screenWidth * .5,
                      width: _screenWidth *.4,


                      decoration: BoxDecoration(

                        borderRadius: BorderRadius.circular(15),
                        color: Theme.of(context).primaryColorLight,

                      ),

                    margin: EdgeInsets.all(kDefaultPadding/2),
                    child: Center(child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[

                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Theme.of(context).primaryColor.withOpacity(.2)
                          ),
                          child: Icon(Icons.person_outline, size: 40, color: Theme.of(context).primaryColorDark,),
                        ),

                        SizedBox(height: kDefaultPadding,),

                        Text("Personal",
                          style: TextStyle(
                            fontSize: kTextHeading,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).primaryColorDark,
                          ),
                        ),

                        SizedBox(height: kDefaultPadding/4,),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[

                            Icon(Icons.access_time , color: Colors.black.withOpacity(.3), size: kText + 2,),

                            SizedBox(width: kDefaultPadding/2,),

                            Text("100 Items",
                              style: TextStyle(
                                color: Colors.black.withOpacity(.3),
                                fontSize: kText
                              ),
                            )

                        ],)



                    ],),)

                  ),

                ],),

                /// Work & Ideas ===============================================
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[

                  Container(

                      height: _screenWidth * .5,
                      width: _screenWidth *.4,


                      decoration: BoxDecoration(

                        borderRadius: BorderRadius.circular(15),
                        color: Theme.of(context).primaryColorLight,

                      ),

                      margin: EdgeInsets.all(kDefaultPadding/2),
                      child: Center(child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[

                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: Theme.of(context).primaryColor.withOpacity(.2)
                            ),
                            child: Icon(Icons.card_travel, size: 40, color: Theme.of(context).primaryColorDark,),
                          ),

                          SizedBox(height: kDefaultPadding,),

                          Text("Work",
                            style: TextStyle(
                              fontSize: kTextHeading,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).primaryColorDark,
                            ),
                          ),

                          SizedBox(height: kDefaultPadding/4,),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[

                              Icon(Icons.access_time , color: Colors.black.withOpacity(.3), size: kText + 2,),

                              SizedBox(width: kDefaultPadding/2,),

                              Text("100 Items",
                                style: TextStyle(
                                    color: Colors.black.withOpacity(.3),
                                    fontSize: kText
                                ),
                              )

                            ],)



                        ],),)

                  ),


                  Container(

                      height: _screenWidth * .5,
                      width: _screenWidth *.4,


                      decoration: BoxDecoration(

                        borderRadius: BorderRadius.circular(15),
                        color: Theme.of(context).primaryColorLight,

                      ),

                      margin: EdgeInsets.all(kDefaultPadding/2),
                      child: Center(child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[

                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: Theme.of(context).primaryColor.withOpacity(.2)
                            ),
                            child: Icon(Icons.lightbulb_outline, size: 40, color: Theme.of(context).primaryColorDark,),
                          ),

                          SizedBox(height: kDefaultPadding,),

                          Text("Ideas",
                            style: TextStyle(
                              fontSize: kTextHeading,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).primaryColorDark,
                            ),
                          ),

                          SizedBox(height: kDefaultPadding/4,),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[

                              Icon(Icons.access_time , color: Colors.black.withOpacity(.3), size: kText + 2,),

                              SizedBox(width: kDefaultPadding/2,),

                              Text("1000 Items",
                                style: TextStyle(
                                    color: Colors.black.withOpacity(.3),
                                    fontSize: kText
                                ),
                              )

                            ],)



                        ],),)

                  ),

                ],),

                /// ArtWork & Urgent ===========================================
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[

                  Container(

                      height: _screenWidth * .5,
                      width: _screenWidth *.4,


                      decoration: BoxDecoration(

                        borderRadius: BorderRadius.circular(15),
                        color: Theme.of(context).primaryColorLight,

                      ),

                      margin: EdgeInsets.all(kDefaultPadding/2),
                      child: Center(child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[

                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: Theme.of(context).primaryColor.withOpacity(.2)
                            ),
                            child: Icon(Icons.palette, size: 40, color: Theme.of(context).primaryColorDark,),
                          ),

                          SizedBox(height: kDefaultPadding,),

                          Text("Art Work",
                            style: TextStyle(
                              fontSize: kTextHeading,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).primaryColorDark,
                            ),
                          ),

                          SizedBox(height: kDefaultPadding/4,),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[

                              Icon(Icons.access_time , color: Colors.black.withOpacity(.3), size: kText + 2,),

                              SizedBox(width: kDefaultPadding/2,),

                              Text("42 Items",
                                style: TextStyle(
                                    color: Colors.black.withOpacity(.3),
                                    fontSize: kText
                                ),
                              )

                            ],)



                        ],),)

                  ),


                  Container(

                      height: _screenWidth * .5,
                      width: _screenWidth *.4,


                      decoration: BoxDecoration(

                        borderRadius: BorderRadius.circular(15),
                        color: Theme.of(context).primaryColorLight,

                      ),

                      margin: EdgeInsets.all(kDefaultPadding/2),
                      child: Center(child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[

                          ///Icon
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: Theme.of(context).primaryColor.withOpacity(.2)
                            ),
                            child: Icon(Icons.priority_high, size: 40, color: Theme.of(context).primaryColorDark,),
                          ),

                          SizedBox(height: kDefaultPadding,),

                          ///Title
                          Text("Urgent",
                            style: TextStyle(
                              fontSize: kTextHeading,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).primaryColorDark,
                            ),
                          ),

                          SizedBox(height: kDefaultPadding/4,),

                          ///Item Count
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[

                              Icon(Icons.access_time , color: Colors.black.withOpacity(.3), size: kText + 2,),

                              SizedBox(width: kDefaultPadding/2,),

                              Text("2 Items",
                                style: TextStyle(
                                    color: Colors.black.withOpacity(.3),
                                    fontSize: kText
                                ),
                              )

                            ],)



                        ],),)

                  ),

                ],),








              ]),
            )
          ),

        )




      ],),



    );
  }



}