import 'dart:io';

void main(){
  print(''); print(''); print(''); print('');
   print('enter the time:');
   var t = stdin.readLineSync();
   var item=items();
   item.Time=t!;
   print('time is ${item.Time}');

   main();
}
class items{
  late String time;
  set Time(String time){
    this.time=time;
  }
  String get Time{
    return time;
  }
}