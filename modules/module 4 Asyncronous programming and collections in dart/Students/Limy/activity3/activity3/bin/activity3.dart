Future<int> fetchUserAge()async{
  await Future.delayed(Duration(seconds: 2));
  return 35;
}



void main(List<String> arguments) {
  fetchUserAge().then((age)=>print('the user age is:$age'));
}
  
