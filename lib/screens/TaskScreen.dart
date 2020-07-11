import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mavha_flutter_challenge/constants.dart';
import 'package:mavha_flutter_challenge/models/Tasks.dart';

class TaskScreen extends StatefulWidget{


  @override
  State<StatefulWidget> createState() {

    return _TaskScreen();
  }
}


class _TaskScreen extends State{

  double _screenHeight , _screenWidth;



  @override
  Widget build(BuildContext context) {

    _screenHeight = MediaQuery.of(context).size.height;
    _screenWidth = MediaQuery.of(context).size.width;


    return Scaffold(


      /// FLoating Action Button
      floatingActionButton :FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColorDark,
        child: Icon(Icons.add),
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
      ),


      /// App Bar with Title, back button and More button
      appBar: AppBar(

        elevation: 0,
        brightness: Brightness.light,
        title: Center(child: Text("SCHEDULE",style: TextStyle(color: Colors.white , fontWeight: FontWeight.bold),),),
        leading: InkWell(
          child:Icon(Icons.arrow_back,color: Colors.white),

          onTap: (){
            Navigator.of(context).pop();
          },
        ),

        actions: <Widget>[
          Icon(Icons.more_horiz,color: Colors.white,),
          SizedBox(width: kDefaultPadding,)
        ],

      ),



      /// Body starts here
      body: Stack(children: <Widget>[

        Container(
          height: _screenHeight *.3,
          width: _screenWidth,
          color: Theme.of(context).primaryColor,

          padding: EdgeInsets.only(left: 15 ,right: 15),


        ),


        /// This Block Renders the Slected Date and relevant headings row
        Padding(

          padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
            child:Row(

              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[

                /// Selected Date here
                Container(
                      height: 100,
                      width:50,

                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5) ,
                        color:  Colors.white ,
                      ),


                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[

                          SizedBox(height: 5,),

                          Text(kselectedDate.toString(),
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: kTextSubheading,
                              color: Theme.of(context).primaryColorDark ,
                            ),
                          ),

                          SizedBox(height: 10,),

                          Text(
                            (kselectedDate % 7 == 1) ? "Mon" :
                            (kselectedDate % 7 == 2) ? "Tue" :
                            (kselectedDate % 7 == 3) ? "Wed" :
                            (kselectedDate % 7 == 4) ? "Thu" :
                            (kselectedDate % 7 == 5) ? "Fri" :
                            (kselectedDate % 7 == 6) ? "Sat" :
                            "Sun",

                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: kTextSubheading,
                                color: Theme.of(context).primaryColorDark
                            ),
                          ),


                        ],)
                  ),

                Text("Today's List",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: kTextSubheading,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                Text("8 tasks",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: kTextSubheading,
                      fontWeight: FontWeight.bold,
                    ),
                  ),


              ],),


        ),


        Container(

          margin: EdgeInsets.only(top : _screenHeight * .12),
          padding: EdgeInsets.only(top: kDefaultPadding, left: kDefaultPadding),
          height: double.infinity ,
          width: _screenWidth,

          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))
          ),

          /// Stack is here for drawing line below the current task indicator
          child: Stack(children: <Widget>[

            /// This row Draws the line
            Row(children: <Widget>[


              Expanded(flex: 3, child: Container(),),

              Column(children: <Widget>[

                Expanded(
                  child:Container(
                    padding: EdgeInsets.only(left: 12, right: 12),
                    width: 25,
                    color: Colors.transparent,
                    child: Container(width: 1,color: Colors.black.withOpacity(.2),),
                  )
                  ,)

              ],),



              Expanded(flex: 1, child: Container(),),

              Expanded(flex: 13, child: Container(),),


            ],),

            ///Task List View and Headings
            ListView.separated(
              itemBuilder: (BuildContext context, int index){
                return index == 0 ?


                /// Straight line seperating time and Tasks
                /// Straight line seperating time and Tasks
                Row(children: <Widget>[

                  Expanded(flex: 2,
                      child:Text("Time",
                        style: TextStyle(
                            fontSize: kText
                        ),
                      )
                  ),

                  Expanded(flex: 4,
                      child:Text("Events",
                        style: TextStyle(
                            fontSize: kText
                        ),
                      )
                  ),


                ],):

                (index == taskList.length + 1) ?

                Row(children: <Widget>[ SizedBox(height: 100,) ],):


                /// Tasks & Time =============================================
                /// Tasks & Time =============================================
                Row(children: <Widget>[


                    /// Time
                   Expanded(
                      flex:3,
                      child: Text(taskList[index -1 ].Time,
                        style: TextStyle(fontSize: (index == 2) ? kTextHeading : kText), /// We can check for a condition here if we want to change text size for present task

                      )
                  ),


                   /// Circular Current indicators =============================
                   Container(
                    height: 25,
                    width: 25,

                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: (index == 2 ) ? Colors.white : Colors.transparent
                    ),

                    child: Card(
                      color: (index == 2 ) ? Colors.white : Colors.transparent ,
                      elevation: (index == 2 ) ? 2 : 0,

                      child: Container(
                        margin: EdgeInsets.all(2),

                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color:(index == 2 ) ? Theme.of(context).primaryColorDark : Colors.transparent
                        ),
                      ),
                    ),
                  ),


                  /// Margin ===================================================
                  Expanded(flex: 1, child: Container(),),


                  /// Tasks ====================================================
                  Expanded(
                      flex:13,
                      child: Container(
                        padding: EdgeInsets.all(kDefaultPadding),

                        width: 20,
                        decoration: BoxDecoration(

                            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),topLeft: Radius.circular(20),),
                            color: Theme.of(context).primaryColorLight
                        ),

                        child: Column(children: <Widget>[

                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[

                            Expanded(
                              flex: 4,
                              child: Text(taskList[index-1].Title,
                                style: TextStyle(fontWeight: FontWeight.bold,
                                fontSize: 22,

                                ),
                              ),
                            ),

                            Expanded(
                              flex: 1,
                              child: Icon(
                                  (index == 1 ) ? Icons.done :
                                  (index == 2 ) ? Icons.notifications_active:
                                      Icons.notifications_none,
                                color: (index == 2 ) ? Theme.of(context).primaryColorDark : Colors.black,
                              )
                            ),



                          ],),


                          Row(children: <Widget>[

                            Expanded(
                              child: Container(
                                height: 3,
                                width: double.infinity,
                                margin: EdgeInsets.symmetric(vertical: 10),
                                color: Colors.black.withOpacity(.05),

                              )
                            ),
                          ],),


                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[

                              Expanded(
                                flex: 4,
                                child: Text(taskList[index-1].Subtitle,
                                  style: TextStyle(
                                    fontSize: kText,

                                  ),
                                ),
                              ),

                              Expanded(
                                  flex: 1,
                                  child: Icon(
                                    Icons.more_horiz,
                                    color: (index == 2 ) ? Theme.of(context).primaryColorDark : Colors.black,
                                  )
                              ),



                            ],),





                        ],),

                      )
                  ),


                ],) ;



              },
              itemCount: taskList.length + 2,/// +1 for Headings and +2 to append Extra space after last element for better accessibility

              separatorBuilder: (BuildContext context, int index){
                return SizedBox(height: kDefaultPadding,);
              },


            ),


          ],)


        ),


      ],),




    );
  }




}