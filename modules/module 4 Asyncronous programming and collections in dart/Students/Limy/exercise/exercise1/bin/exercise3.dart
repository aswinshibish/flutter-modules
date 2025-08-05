void main(){
  List<int>list1=([1,2,3,4,5,6,7,8,9,10]);
  print('list:${list1}');
  var sum =list1.reduce((a,b)=>a+b);
  print('sum:${sum}');}
