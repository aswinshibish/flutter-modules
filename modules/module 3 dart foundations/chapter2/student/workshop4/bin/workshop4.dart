void main()
{
  PositionedParameters('Parameter 1','parameter 2');
  PositionedParameters('Parameter 1');
  print('');
  NamedParameters(two:'parameter 2',one:'parameter 1');
  print('');
  DefaultParameters('parameter 1');
  DefaultParameters('parameter 1',two:'parameter 2');
  
}

void PositionedParameters(String ? one, [String ? two]) {
  print(one);
  print(two);
}

void NamedParameters({String ? one, String ? two}) {
  print('Parameter one : $one');
  print('parameter two : $two');
}
  void DefaultParameters(String one,{String two='hyy'}){
    print('Parameter one : $one');
  print('parameter two : $two');
  } 




