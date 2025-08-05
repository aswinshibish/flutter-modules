void main()async {
  print('task 1 complete');
 await Future.delayed(Duration(seconds: 2),(){
   print('task 2 complete');
});
    print('task 3 complete');
}
