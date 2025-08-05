

void main(){
  Map car={
    'brand':'bmw',
    'model':'x5',
    'color':'black',
  };print('values:');
  car.forEach((key,value){
    print(value);
  });
  print('key and value togther:');
  car.forEach((key, value) {
    print('$key:$value');
  },);
  print('keys:');
  car.forEach((key, value){
    print(key);
  });
  
}