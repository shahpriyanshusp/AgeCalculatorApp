import 'package:age/age.dart';
import 'package:agecalculator/Services/Age_Calculator.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime todayDate=DateTime.now();
  DateTime dob=DateTime(2001,7,26);
  AgeDuration? _ageDuration;
  AgeDuration? _nextBirthdayDuration;
  int? _nextBdayWeekDay;

  List<String> _month=['Months',
    'January','February','March','April','May','June','July','Augest','September','Octomber','November','December'];

  List<String> _weeks=['Months',
    'MONDAY','TUESDAY','WENSDAY','THURSDAY','FRIDAY','SATURDAY','SUNDAY',];


  Future<Null>  _selectedTodayDate(BuildContext context)async{
    final DateTime? picked =await showDatePicker(context: context, initialDate: todayDate, firstDate: dob, lastDate: DateTime(2101));
    if(picked != null && picked != todayDate){
      setState(() {
        todayDate=picked;
        _ageDuration= AgeCalculation().calculateAge(todayDate, dob);
        _nextBirthdayDuration = AgeCalculation().calculateAge(todayDate, dob);
        _nextBdayWeekDay = AgeCalculation().nextBday(todayDate, dob);
      });
    }
  }
  Future<Null>  _selectedDOBDate(BuildContext context)async{
    final DateTime? picked =await showDatePicker(context: context, initialDate: dob, firstDate: DateTime(1900), lastDate: todayDate);
    if(picked != null && picked != todayDate){
      setState(() {
      dob=picked;
      _ageDuration= AgeCalculation().calculateAge(todayDate, dob);
      _nextBirthdayDuration = AgeCalculation().calculateAge(todayDate, dob);
      _nextBdayWeekDay = AgeCalculation().nextBday(todayDate, dob);
      });
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   _ageDuration= AgeCalculation().calculateAge(todayDate, dob);
   _nextBirthdayDuration = AgeCalculation().calculateAge(todayDate, dob);
   _nextBdayWeekDay = AgeCalculation().nextBday(todayDate, dob);
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.black,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              children: [
                SizedBox(
                  height: 30,
                  width: double.maxFinite
                ),
                Text("Age Calculator",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700,fontSize: 28),),
                SizedBox(height: 40,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Today",style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.w400),),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: Row(
                        children: [
                          Text("${todayDate.day} ${_month[todayDate.month]} ${todayDate.year}",style: TextStyle(fontSize: 22,color: Color(0XFFCDDC39),fontWeight: FontWeight.w700),),
                          SizedBox(width: 10,),
                          GestureDetector(
                              onTap: (){_selectedTodayDate(context);},
                              child: Icon(Icons.calendar_today,color: Colors.white,))
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(height: 30,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Date Of Birth",style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.w400),),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: Row(
                        children: [
                          Text("${dob.day} ${_month[dob.month]} ${dob.year}",style: TextStyle(fontSize: 22,color: Color(0XFFCDDC39),fontWeight: FontWeight.w700),),
                          SizedBox(width: 10,),
                      GestureDetector(
                        onTap: (){_selectedDOBDate(context);},
                        child: Icon(Icons.calendar_today,color: Colors.white,))
                        ],
                      ),
                    )
                  ],
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 40),
                  width: double.infinity,
                  // height: 400,
                  decoration: BoxDecoration(
                    color: Color(0xff333333),
                    borderRadius: BorderRadius.circular(15)
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            height: 200,
                            padding: EdgeInsets.symmetric(
                              vertical: 20
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("AGE",style: TextStyle(fontSize: 18,color: Colors.white,fontWeight: FontWeight.w700),),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text("${_ageDuration?.years}",style: TextStyle(fontSize: 76,color: Color(0XFFCDDC39),fontWeight: FontWeight.w700),),
                                    Padding(padding: EdgeInsets.only(bottom: 13)),
                                    Text("YEARS",style: TextStyle(fontSize: 22,color: Colors.white,fontWeight: FontWeight.w700),),
                                  ],
                                ),
                                Text("${_ageDuration?.months} months | ${_ageDuration?.days} days",style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.w400),),
                              ],
                            ),
                          ),
                          Container(
                            width: 1,
                            height: 170,
                            color: Color(0xff999999),
                          ),
                          Container(
                            height: 200,
                            padding: EdgeInsets.symmetric(
                                vertical: 20
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("NEXT BIRTHDAY",style: TextStyle(fontSize: 18,color: Colors.white,fontWeight: FontWeight.w700),),
                                Icon(Icons.cake,color: Color(0XFFCDDC39),size: 40,),
                                Text("${_weeks[_nextBdayWeekDay ?? 0]}",style: TextStyle(fontSize: 22,color: Colors.white,fontWeight: FontWeight.w700),),
                                Text("${_nextBirthdayDuration?.months} months | ${_nextBirthdayDuration?.days} days",style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.w400),),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Container(
                       height: 1,
                       width: double.maxFinite,
                        color: Color(0xff9999999),
                        margin: EdgeInsets.symmetric(horizontal: 15,),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20.0),
                        child: Text("SUMMARY",style: TextStyle(fontSize: 18,color: Color(0XFFCDDC39),fontWeight: FontWeight.w700),),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 35.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Text("YEARS",style: TextStyle(fontSize: 14,color: Colors.white,fontWeight: FontWeight.w400),),
                                SizedBox(height: 5,),
                                Text("${_ageDuration?.years}",style: TextStyle(fontSize: 28,color: Colors.white,fontWeight: FontWeight.w400),),
                              ],
                            ),
                            Column(
                              children: [
                                Text("MONTHS",style: TextStyle(fontSize: 14,color: Colors.white,fontWeight: FontWeight.w400),),
                                SizedBox(height: 5,),
                                Text("${(((_ageDuration?.years)! *12) + (_ageDuration!.months) )}",style: TextStyle(fontSize: 28,color: Colors.white,fontWeight: FontWeight.w400),),
                              ],
                            ),
                            Column(
                              children: [
                                Text("WEKS",style: TextStyle(fontSize: 14,color: Colors.white,fontWeight: FontWeight.w400),),
                                SizedBox(height: 5,),
                                Text("${(todayDate.difference(dob).inDays / 7).floor()}",style: TextStyle(fontSize: 28,color: Colors.white,fontWeight: FontWeight.w400),),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 35.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Text("DAYS",style: TextStyle(fontSize: 14,color: Colors.white,fontWeight: FontWeight.w400),),
                                SizedBox(height: 5,),
                                Text("${todayDate.difference(dob).inDays }",style: TextStyle(fontSize: 18,color: Colors.white,fontWeight: FontWeight.w400),),
                              ],
                            ),
                            Column(
                              children: [
                                Text("HOURS",style: TextStyle(fontSize: 14,color: Colors.white,fontWeight: FontWeight.w400),),
                                SizedBox(height: 5,),
                                Text("${todayDate.difference(dob).inHours }",style: TextStyle(fontSize: 18,color: Colors.white,fontWeight: FontWeight.w400),),
                              ],
                            ),
                            Column(
                              children: [
                                Text("MINUTES",style: TextStyle(fontSize: 14,color: Colors.white,fontWeight: FontWeight.w400),),
                                SizedBox(height: 5,),
                                Text("${todayDate.difference(dob).inMinutes }",style: TextStyle(fontSize: 18,color: Colors.white,fontWeight: FontWeight.w400),),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20,)


                    ],
                  ),
                )
              ],
            ),
          ),
    ));
  }
}
