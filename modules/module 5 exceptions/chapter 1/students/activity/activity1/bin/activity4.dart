void main(){
  try{
    throwException();
  }on msi catch(e){
    print(e.msg);
  }
}
void throwException(){
  throw msi ('this is my custom exception');
}
class msi implements Exception{
  String msg;
  msi(this.msg);
}