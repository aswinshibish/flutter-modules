
void main(List<String> arguments) {
  function1();
  print(function2());
  function3('This is from main function');
  
}
void function1()
{
  print("its just a function");
}
String function2()
{
  return 'this is return string';
}
void function3(String str)
{
  print(str);
}