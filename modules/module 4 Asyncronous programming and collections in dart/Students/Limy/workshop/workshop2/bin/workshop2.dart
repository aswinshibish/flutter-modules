void main() {
  // Define two sets of integers
  Set<int> set1 = {1, 8, 3, 4, 5};
  Set<int> set2 = {2, 4, 5, 6, 7};

  // Print the sets
  print('Set 1: $set1');
  print('Set 2: $set2');

  // Union of the sets
  Set<int> union = set1.union(set2);
  print('Union of sets: $union');

  // Intersection of the sets
  Set<int> intersection = set1.intersection(set2);
  print('Intersection of sets: $intersection');

  Set<int>Difference=set1.difference(set2);
  print('Differenceof the sets(Set 1-Set 2):${Difference}');



  // Difference of the sets
  
}
