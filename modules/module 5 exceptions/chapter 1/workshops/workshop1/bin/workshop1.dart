// ignore_for_file: deprecated_member_use

void main(List<String> args) {
  int x = ;
  int y = ;

  try {
    int xy = x ~/ y;
    print(xy);
  } on IntegerDivisionByZeroException catch (e) {
    print(e);
  }
}