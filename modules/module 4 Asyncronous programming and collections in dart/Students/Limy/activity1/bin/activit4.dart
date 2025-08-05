mixin swimmable{
void swim(){
  print('swimming...');
}}
mixin flyable{
  void fly(){
    print('flying...');
  }
}
class Duck with swimmable,flyable{}
class Fish with swimmable{}
void main (){
  var duck=Duck();
  duck.swim();
  duck.fly();
  var fish=Fish();
  fish.swim();
}