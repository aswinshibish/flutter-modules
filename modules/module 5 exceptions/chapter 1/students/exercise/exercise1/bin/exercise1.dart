void main(List<String> arguments) {
  try{
  var x='10';
  
  int y=2;
  int result = int.parse(x)~/y;
  if(result % 2 !=0 &&  result <5){
    throw LessThanFiveException('less than 5 exception');
  }
  else{
    print('RESULT is :$result');
  }}on FormatException catch(e){
    print('caughta format exception');
  }on IntegerDivisionByZeroException catch(e){
    print('catch an integer division by zero exception:$e');
  }on LessThanFiveException catch(e){
    print(e.str);
  } catch(e){
    print('caught an unknown exception:$e');
  } }
  class LessThanFiveException implements Exception{
    String str;
    LessThanFiveException(this.str);
  }
