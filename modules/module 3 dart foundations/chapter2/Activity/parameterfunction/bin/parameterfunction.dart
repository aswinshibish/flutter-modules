

void main(List<String> arguments) {
  positionedparameters('parameter 1','parameter 2');
   positionedparameters('parameter 1');
   print('');
   NamedParameters(two:'parameter 2',one:'parameter 2');
   print('');
   DefaultParameter('parameter 1');
   DefaultParameter('parameter 1',two:'parameter 2');
  
}
  void positionedparameters(String one,[String ?two]){
  print(one);
  print(two);
  } 
void NamedParameters({String? one,String ?two}){
print('parameter one:$one');
print('parameter two:$two');
}
void DefaultParameter(String one,{String two='hyy'}){
  print('parameter one :$one');
  print('parameter two :$two');
  
}