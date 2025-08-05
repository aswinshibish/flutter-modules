void main(List<String> args) {

var x = 'Empetz';


try{
  int xy = int.parse(x);
  print(xy);
} on FormatException catch(e){
  print('caught FormatException:$e');
}

}