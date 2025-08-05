import 'dart:io';

void main(){
  var li=[];
  for(int i=0;i<=10;i++){
    li.add('index $i');
  }
  stdout.write('the full list:');
  f(li);
   stdout.write('the full removed:');
  li.removeLast();
  f(li);
   stdout.write('specific index(5)removed :');
   li.removeAt(5);
  f(li);
   stdout.write('added value (5)index:');
   li.insert(5,0000);
  f(li);

}
void f(li){
  print(li);
}