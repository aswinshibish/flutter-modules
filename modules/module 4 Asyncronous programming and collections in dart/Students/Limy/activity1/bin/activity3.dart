void main()async{
  await for (var count in countStream(10)){
    print(count);
  }

}
Stream<int> countStream(int max)async*{
  for(int i=0;i<=max; i++){
    await Future.delayed(Duration(seconds:1));
    yield i;
    //yield is a editing thing
  }
}