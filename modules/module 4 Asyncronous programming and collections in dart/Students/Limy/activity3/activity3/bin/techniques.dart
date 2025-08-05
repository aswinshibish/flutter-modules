mixin LoggingMixin{
  void logMessage(String message){
    print('Log:$message');
  }
}
class myclass with LoggingMixin{
  void performAction(bool shouldLog){
    if (shouldLog){
      logMessage('action jjj');

    }else{
      print('action mmm');
    }
  }
}
void main(){
  myclass myObject=myclass();
  myObject.performAction(true);
  myObject.performAction(false);
}