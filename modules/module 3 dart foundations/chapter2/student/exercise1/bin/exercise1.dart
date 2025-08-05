
void main(List<String> arguments) {
  String number ="54545";
  String reversed ="";
  String value=number;
  for (int j =number.length -1;j>=0;j--){
    reversed =reversed+ number[j];
  }
  if (value==reversed){
    print("string is palindrom");

  }else{
    print("string is not palindrom");
  }
}
