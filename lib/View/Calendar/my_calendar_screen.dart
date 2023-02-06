import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../../Constants/module.dart';
import '../../Widgets/module.dart';
import 'package:jiffy/jiffy.dart';
import 'package:intl/intl.dart';
import 'package:flutter_event_calendar/flutter_event_calendar.dart';

class MyCalendarScreen extends StatefulWidget{
  MyCalendarScreen({Key? key}): super(key: key);

  @override
  MyCalendarScreenState createState()=> MyCalendarScreenState();
}

class MyCalendarScreenState extends State<MyCalendarScreen>{

  DateTime _currentDate=DateTime.now();
  List<bool> button_status=[];
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: AppConstants.primaryColor,
      appBar: AppBar(
        backgroundColor: AppConstants.primaryColor,
        elevation: 0,
        title: const Text('Book Appointment',style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w500),),
      ),
      body:  Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: AppConstants.primaryColor,
        child: Column(
          children: [
            Flexible(
              flex: 1,
              child: Container(
                color: Colors.transparent,
              ),
            ),
            Flexible(
              flex: 25,
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(20.0),topRight: Radius.circular(20.0))
                ),

                child:  Padding(
                  padding: EdgeInsets.only(top: 20.0,left: 10.0,right: 10.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 0.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                                padding: EdgeInsets.only(left: 0.0,right: 5.0),
                                child: Container(
                                    width: 150,
                                    height: 80,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(8.0)
                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(top: 5.0,left: 5.0),
                                          child: Text('Bumrugrand',style: TextStyle(color: Colors.lime.shade800,
                                              fontSize: 18,fontWeight: FontWeight.w600),),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(top: 5.0,left: 5.0),
                                          child: Text('International',style: TextStyle(color: Colors.lime.shade800,
                                              fontSize: 18,fontWeight: FontWeight.w600,decoration: TextDecoration.underline),),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(top: 5.0,left: 5.0),
                                          child: Text('Hospital',style: TextStyle(color: Colors.lime.shade800,
                                            fontSize: 18,fontWeight: FontWeight.w600,),),
                                        ),
                                      ],
                                    )
                                )
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 0.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(bottom: 5.0,top: 5.0),
                                    child: Text('Bumrugrand International \n Hospital',style: TextStyle(
                                      color: Colors.black,fontSize: 14,fontWeight: FontWeight.w500,
                                    ),),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 10.0),
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(top: 0.0),
                                          child: Icon(CupertinoIcons.location,color: AppConstants.primaryColor,
                                            size: 20,),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(top: 0.0),
                                          child: Text('Bangkok,Thailand',style: TextStyle(color: AppConstants.primaryColor,
                                              fontSize: 12,fontWeight: FontWeight.w500),),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Divider(color: Colors.grey.shade600,),
                      Padding(
                        padding: EdgeInsets.only(top: 5.0),
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 0.0),
                              child: Icon(
                                Icons.star,color: Colors.blue,size: 18,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 5.0),
                              child: Text('Has state-of-the-art laboratory and pathology \nfacilities providing accurate lab'
                                  'results',
                                style: TextStyle(color: Colors.black87,fontSize: 12,fontWeight: FontWeight.w500),),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10.0),
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 0.0),
                              child: Icon(
                                CupertinoIcons.checkmark_seal_fill,color: Colors.green,size: 18,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 5.0),
                              child: Text('JCI Accredited',
                                style: TextStyle(color: Colors.black87,fontSize: 12,fontWeight: FontWeight.w500),),
                            )
                          ],
                        ),
                      ),
                      CalendarDays(),
                      Padding(
                        padding: EdgeInsets.only(top: 10.0,left: 0.0,right: 0.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 48,
                          child: ElevatedButton(
                            child: Text('Proceed',style: TextStyle(color: Colors.white,fontSize: 14,
                                fontWeight: FontWeight.w400),),
                            onPressed: (){

                            },
                            style: ElevatedButton.styleFrom(
                                primary: AppConstants.primaryColor
                            ),
                          ),
                        ),
                      )


                    ],
                  ),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }

  createCalendar(){
    DateTime currentMonth=DateTime.now();

  }

  String getMonth(DateTime currentMonth){
    String month=Jiffy({
      "year":currentMonth.year,
      "month":currentMonth.month,
      "day":currentMonth.day,
    }).MMMM;

    print("The Month is " + month);
    return month;
  }

  Widget daysWidget(DateTime currentMonth){
    DateTime lastDay=DateTime(currentMonth.year,currentMonth.month + 1,0);
    button_status=List.filled(lastDay.day, false);

    int month_difference= DateTime.now().month == currentMonth.month ? DateTime.now().day : 1;
    return ListView.builder(
      itemCount: lastDay.day,
      padding: EdgeInsets.only(left: 20.0),
      scrollDirection: Axis.horizontal,
      itemBuilder: (context,index){
        if((index + 1) < month_difference){
          return SizedBox();
        }
         return Padding(
           padding: const EdgeInsets.only(right: 24.0,top: 10.0),
           child: GestureDetector(
             onTap: (){
                 setDayAppointment(index);

             },
             child: Container(
               width: 60,
               height: 70,
               decoration: BoxDecoration(
                   color: button_status[index + 1] ?
                   AppConstants.primaryColor : Colors.transparent,
                   borderRadius: BorderRadius.circular(8.0)
               ),
               child: Column(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   Text(
                     "${index + 1}",
                     style: TextStyle(color: checkCurrentDay(DateTime(currentMonth.year,currentMonth.month,index + 1 )) ?
                     Colors.white: Colors.black87,fontSize: 14,fontWeight: FontWeight.w500),
                   ),
                       (){
                     DateTime indexDate=lastDay.add(Duration(days: index + 1));
                     String indexDateName=DateFormat('E').format(indexDate);
                     return Text(indexDateName);
                   }()
                 ],
               ),
             ),
           )
         );
      },
    );
  }

  incrementMonth(){

    DateTime new_date=DateTime(_currentDate.year,_currentDate.month +1 ,1);
    setState(() {
      _currentDate=new_date;
    });
  }

  bool checkCurrentDay(DateTime calendarDay){
   // return DateTime.now().difference(calendarDay).inDays == 0;
    return DateTime.now().isSameDate(calendarDay);
  }

  setDayAppointment(int day){
    setState(() {
      button_status.asMap().forEach((index, element) {
        if(index==day){
          button_status[index]=true;
          print("Element set to " + element.toString() + index.toString() + ':' + day.toString());

        }

        else{
          button_status[index]=true;
          print("Element set to false:" + index.toString() + ':' + day.toString());

        }
      });
    });
  }
}