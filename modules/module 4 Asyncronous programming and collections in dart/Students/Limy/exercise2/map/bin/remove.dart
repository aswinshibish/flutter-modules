import 'dart:collection';

void main(){
  Queue QU=Queue();
  
  print('queue:${QU}');
  int A=QU.removeFirst();
  print('first elemwmy:${A}');
  int B= QU.removeFirst();
  print('second:${B}');
  int m=QU.removeLast();
  print('last:${m}');
  QU.clear();
  print('clear:${QU}');
  
  }