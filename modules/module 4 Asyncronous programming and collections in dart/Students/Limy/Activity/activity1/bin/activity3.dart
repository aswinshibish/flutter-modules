void main(){
  List<List<int>> nestedList=[
    [1,2,3],
    [4,5,6],
    [7,8,9],
  ];
  print('complete nested list:');
  print(nestedList);
   print('first inner list:');
  print(nestedList[0]);
  
   print('second element of second inner list:');
  print(nestedList[1][1]);
  print('element in each inner list:');
   for(var innerList in nestedList){
  print(innerList);}

  print('individual elements:');
   for(var innerList in nestedList){
 for(var element in innerList){
  print(element);
 }}
  

   
  
}