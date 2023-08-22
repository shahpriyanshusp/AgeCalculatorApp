import 'package:age/age.dart';

class AgeCalculation{

  //Calculate Age of Person
 AgeDuration calculateAge(DateTime today, DateTime dob){
    AgeDuration age;
    age=Age.dateDifference(fromDate: dob , toDate: today , includeToDate: false);
  return age;
  }

  //Calculate Next Birthday
 AgeDuration nextBirthday(DateTime today, DateTime dob){
   DateTime temp=DateTime(today.year,dob.month,dob.day);
   DateTime nextBirthdayDate=temp.isBefore(today)? Age.add(date: temp, duration: AgeDuration(years: 1)):temp;
  AgeDuration nextBirthdayDuration =Age.dateDifference(fromDate: today , toDate: nextBirthdayDate , includeToDate: false);
  return nextBirthdayDuration;
 }

 //calculate Next Birthday Weekdays
 int nextBday(DateTime today, DateTime dob){
   DateTime temp=DateTime(today.year,dob.month,dob.day);
   DateTime nextBirthdayDate=temp.isBefore(today)? Age.add(date: temp, duration: AgeDuration(years: 1)):temp;
   return nextBirthdayDate.weekday;
 }
}