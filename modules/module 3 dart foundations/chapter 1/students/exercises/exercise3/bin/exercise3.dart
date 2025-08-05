

void main(List<String> arguments) {
 
 String name = "abc";
 String reversed ="";
 String value =name;
 for (int j = name.length -1; j >=0;j--){
  reversed = reversed + name[j];
 }
 if (value == reversed){
  print("string a palindrom");
 }else {
  print("string is not palindrom");
 }
}
