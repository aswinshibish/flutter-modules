void main(){
  List<int>set1=([1,2,3,4,3,2,5,6,7,8,7,9,10]);
  print('original list:${set1}');
  Set<int>UniqueNumbers =Set<int>.from(set1);
  print('Unique element:${UniqueNumbers}');
  
}