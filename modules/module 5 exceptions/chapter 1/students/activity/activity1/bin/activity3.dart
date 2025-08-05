void main(){
  print('case1:');
  try{
    int result=10~/0;
    print('result is $result');
  }catch(e){
    print('the exception thrown is$e');
  }finally{
    print('this is finally clause');
  }
}