
void main(List<String> arguments) {
  var obj =name();
  print('calling a field from main method------- ${obj.str}!');
  obj.print_str();
}

class name{
  String str ="skashy";
  void print_str()
  {
    print('excuting a function from initialised class-------$str');
  }
}