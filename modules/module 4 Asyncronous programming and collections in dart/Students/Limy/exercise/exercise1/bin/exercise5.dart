
import 'dart:collection';

void main(){
  Queue<int>Qu=Queue();
  Qu.addAll({10,20,30,40,50});
  print('intial Queue:${Qu}');
  print('First element of the queue:${Qu.first}');
  print('Last element of the queue:${Qu.last}');
  int removedElement = Qu.removeFirst();
  print('removed element:${removedElement}');
  int removedElemen=Qu.removeFirst();
  print('removed element:${removedElemen}');
  int removedeleme =Qu.removeFirst();
  print('removed element:${removedeleme}');
  int removedelem =Qu.removeFirst();
  print('removed element:${removedelem}');
  int removedele =Qu.removeFirst();
  print('removed element:${removedele}');
  Qu.clear();
  print('queue after removel:${Qu}');

}
