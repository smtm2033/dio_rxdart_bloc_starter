class GlobalVariable {
  String title;
  int number;
  Map<dynamic, dynamic> pairs = {"first": 1, "second": 2};

  GlobalVariable(this.title, this.number);
}

var globalVar = GlobalVariable("title1", 5);
