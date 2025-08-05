void main(){
  var ac=[12,'limy',20.1];
  List<String>car =['bmw','audi','toyota','zen'];
  List<String>car2 =['bmw1','audi1','toyota1','zen1'];
  print(car.length);
  if(car.contains('zen')){
    print('available');
  }else{
    print('not availsble');
  }
  car.add('ford');
  print(car);
  car.removeAt(0);
  print(car);
  car.addAll(car2);
  print(car);
  print(car.join('**'));
  List nelist=[
    [1,2,3],
    [4,5,6]
  ];
  print(nelist[0]);
  print(nelist[0][1]);
}