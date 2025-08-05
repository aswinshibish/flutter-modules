void main(){
  print('case 1:');
  try{
    int result  =10~/0;
    print('the result is $result');

  }on IntegerDivisionByZeroException{
    print('cannot divide by zero');
  }
  print('');
  print('case2');
  try{
    int result  =10~/0;
    print('the result is $result');
  }catch(e){
    print('the exception trown is$e');
  }
}