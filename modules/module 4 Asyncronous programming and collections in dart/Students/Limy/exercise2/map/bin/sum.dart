void main(){
  List<int>jj=[20,8,4];
  print('list:${jj}');
  var sum=jj.reduce((a,b)=>a+b);
  print('sum:${sum}');
}