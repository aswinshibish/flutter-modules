

void main(List<String> arguments) {
  var x=4;
  var y=0;
  try{
    var xy=x ~/y;
    print(xy);

  }catch(e){
    print('error :cannot divided by zero');
  }
}
