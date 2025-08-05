import 'dart:collection';

void main() {
  // Creating a queue
  Queue<int> myQueue = Queue();

  // Adding elements to the queue
  myQueue.addAll([10, 20, 30, 40]);
  
  

  // Printing the queue
  print('Queue: $myQueue');


print('first element:${myQueue.first}');


print('last element:${myQueue.last}');
int removedElement = myQueue.removeFirst();
print('removed element:${removedElement}');




  // Accessing elements from the queue
  

  // Removing elements from the queue
  

  // Printing the updated queue
  print('Updated queue: $myQueue');

  // Checking if the queue is empty
  print('Is queue empty? ${myQueue.isEmpty}');

  
  // Clearing the queue
  myQueue.clear();
  print('queue after clearing:${myQueue}');
  
}
