import 'dart:collection';

void main(){
  final queue=Queue<int>();
  print(queue.runtimeType);
  queue.addAll([1,2,3]);
  queue.addFirst(0);
  queue.addLast(10);
  print(queue);
  queue.removeFirst();
  queue.removeLast();
  print(queue);
}