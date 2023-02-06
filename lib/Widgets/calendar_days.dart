import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../Constants/module.dart';
import 'package:flutter/cupertino.dart';
import 'package:jiffy/jiffy.dart';

class CalendarDays extends StatefulWidget{
  CalendarDays({Key? key/*,required this.currentDate*/}): super(key: key);
  //DateTime currentDate;


  @override
  _CalendarDayState createState()=> _CalendarDayState();
}

class _CalendarDayState extends State<CalendarDays>{

  List<bool> button_status=[];
  int month_difference=0;
  late DateTime lastDay;
  DateTime currentDate=DateTime.now();
  List<String> services=["Select a service","Service 1","Service 2","Service3"];
  int? service_type_value=0;
  String? book_option='';


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    lastDay=DateTime(currentDate.year,currentDate.month + 1,0);
    initButtonStatus();
    month_difference= DateTime.now().month == currentDate.month ? DateTime.now().day : 1;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Padding(
      padding: EdgeInsets.only(top: 10.0,left: 2.0,right: 2.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.52,
        decoration: BoxDecoration(
            border: Border.all(color: AppConstants.primaryColor)
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 50,
              decoration: BoxDecoration(
                  color: AppConstants.primaryColor
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 0.0),
                    child: IconButton(
                      icon: Icon(CupertinoIcons.back,color: Colors.white,),
                      onPressed: (){
                       decrementMonth();
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 0.0),
                    child: Text(getMonth(currentDate),style: TextStyle(
                        color: Colors.white,fontSize: 15,fontWeight: FontWeight.w600
                    ),),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 0.0),
                    child: IconButton(
                      icon: Icon(CupertinoIcons.forward,color: Colors.white,),
                      onPressed: (){
                        setState(() {
                          incrementMonth();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width * 0.20,
              //      child: CalendarDays(currentDate: _currentDate,),
              child: ListView.builder(
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
                              color: button_status[index] ?
                              AppConstants.primaryColor : Colors.transparent,
                              borderRadius: BorderRadius.circular(8.0)
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                                  (){
                                DateTime indexDate=lastDay.add(Duration(days: index + 1));
                                String indexDateName=DateFormat('E').format(indexDate);
                                return Text(indexDateName,
                                  style: TextStyle(color: button_status[index]  ?
                                  Colors.white: Colors.black87,fontSize: 14,fontWeight: FontWeight.w400),);
                              }(),
                              Text(
                                "${index + 1}",
                                style: TextStyle(color: button_status[index]  ?
                                Colors.white: Colors.black87,fontSize: 14,fontWeight: FontWeight.w400),
                              ),

                            ],
                          ),
                        ),
                      )
                  );
                },
              )
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.0,right: 20.0,top: 10.0),
              child: Text('Select a Service',style: TextStyle(
                color: Colors.black54,fontSize: 14,fontWeight: FontWeight.w600
              ),),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.0,right: 20.0,top: 10.0),
              child: Text('Book a medical service with Bumrungrad\nInternational Hospital',style: TextStyle(
                  color: Colors.black54,fontSize: 14,fontWeight: FontWeight.w600
              ),),
            ),

            Padding(
              padding: EdgeInsets.only(left: 20.0,right: 20.0,top: 20.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 52,
                child: FormField(
                    builder: (FormFieldState state){
                      return InputDecorator(

                          decoration:  InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(horizontal: 5.0),
                            //     labelStyle: textStyle,
                            errorStyle: const TextStyle(color: Colors.redAccent,fontSize: 14.0),
                            hintText: 'Select a Service',
                            hintStyle: TextStyle(color: Colors.grey,fontSize: 12,fontWeight: FontWeight.w500,),
                            filled: true,
                            fillColor: Colors.transparent,
                            border: OutlineInputBorder(
                              // borderRadius: BorderRadius.circular(8.0),
                                borderSide: BorderSide(color: Colors.grey.shade400)
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                                borderSide: BorderSide(color: Colors.grey.shade400)
                            ),
                            // labelText:'Select Bank',
                          ),
                          child:DropdownButtonHideUnderline(
                              child:DropdownButton(
                                value: service_type_value,
                                isDense: true,
                                hint:  Text("Select A Service",style: TextStyle(color: Colors.grey.shade600,fontSize: 14,fontWeight: FontWeight.w400),),

                                onChanged: (int? newValue){
                                  service_type_value=newValue;
                                  state.didChange(newValue);
                                },
                                //  icon: null,
                                icon: const Icon(Icons.arrow_drop_down),
                                items:services.asMap().map((index,value){
                                  return MapEntry(index,DropdownMenuItem(
                                    value: services.indexOf(value),
                                    child:Text(value,style: TextStyle(color: Colors.grey.shade600,
                                        fontSize: 14,fontWeight: FontWeight.w600),),
                                  ));
                                }).values.toList(),
                              )
                          )
                      );

                    }
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.0,right: 20.0,top: 10.0),
              child: Text('Select appointment type',style: TextStyle(
                  color: Colors.black,fontSize: 14,fontWeight: FontWeight.w600
              ),),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.0,right: 20.0,top: 10.0),
              child: Column(
                children: [
                  RadioListTile(
                  title: const Text(
                    'Book with the doctor',style: TextStyle(
                    color: Colors.black87,fontSize: 12,fontWeight: FontWeight.w500,

                  ),
                  ),
                  value: 'doctor',
                activeColor: AppConstants.primaryColor,
                groupValue: book_option,
                      onChanged: (text){
                    setState(() {
                      book_option=text.toString();
                    });
                      }),
                  RadioListTile(
                      title:const Text(
                        'Request for booking assistance',style: TextStyle(
                        color: Colors.black87,fontSize: 12,fontWeight: FontWeight.w500,

                      ),
                      ),
                      activeColor: AppConstants.primaryColor,
                      value: 'assistance', groupValue: book_option,
                      onChanged: (text){
                        setState(() {
                          book_option=text.toString();
                        });
                      }),

                ],
              ),
            )
          ],
        ),
      ),
    );

  }


  incrementMonth(){

    DateTime new_date=DateTime(currentDate.year,currentDate.month +1 ,1);
    setState(() {
      currentDate=new_date;
      lastDay=DateTime(currentDate.year,currentDate.month + 1,0);
      button_status=List.filled(lastDay.day, false);

      month_difference= DateTime.now().month == currentDate.month ? DateTime.now().day : 1;
    });
  }

  decrementMonth(){
    DateTime new_date=DateTime(currentDate.year,currentDate.month -1 ,1);
    setState(() {
      currentDate=new_date;
      lastDay=DateTime(currentDate.year,currentDate.month - 1,0);
      button_status=List.filled(lastDay.day, false);

      month_difference= DateTime.now().month == currentDate.month ? DateTime.now().day : 1;
    });
  }

  DateTime getCurrentDate(){
    return currentDate;
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
          button_status[index]=false;
          print("Element set to false:" + index.toString() + ':' + day.toString());

        }
      });
    });
  }

  initButtonStatus(){
    button_status=List.filled(lastDay.day, false);
    button_status.asMap().forEach((index, element) {
      if(index + 1==DateTime.now().day && DateTime.now().isSameDate(currentDate)){
        setState(() {
          button_status[index]=true;
        });
      }
    });
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
}