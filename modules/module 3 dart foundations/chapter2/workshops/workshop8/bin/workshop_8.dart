void main(List<String> args) {
 Mobile();
}

abstract class Message {
  void text();
  void number();
}

abstract class Call {
  void call();
  void receiveCall();
}

class Mobile implements Message, Call {
  Mobile() {

  }

  @override
  void call() {
    // TODO: implement call
  }

  @override
  void number() {
    // TODO: implement number
  }

  @override
  void receiveCall() {
    // TODO: implement receiveCall
  }

  @override
  void text() {
    // TODO: implement text
  }
}
