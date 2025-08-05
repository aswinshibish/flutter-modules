
void main(List<String> arguments) {
  var li=[1,'kk',330];
  print(li);
  var li1=[];
  li1.add('one');
  li1.add('two');
  print(li1);
  var li2 =List.filled(5, 1,);
  li2[3]=6;
  print(li2);
  var li3=[];
  for (var i =0; i <5; i++){
    li3.add('the current $i');
  }
  for(var x in li3){
    print(x);
  }
}
