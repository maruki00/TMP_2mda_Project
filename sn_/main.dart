import 'dart:mirrors';

class Parent {
  void getVariableNames(var d, var x) {
    ClassMirror classMirror = reflectClass(d);
    for (var attribute in classMirror.declarations.values) {
      if (attribute is VariableMirror) {
        var attributeName = MirrorSystem.getName(attribute.simpleName);
        print(x.attributeName);
      }
    }
  }
}

class child extends Parent {
  late var childage = "hello";
  late int val = 1;
  late int val1 = 1;
  late int val2 = 1;
  child(this.childage, this.val, this.val1, this.val2);
  void hell(var d) {
    getVariableNames(runtimeType, d);
  }
}

void main() {
  final fifteenAgo = new DateTime.now();
  print(fifteenAgo);
}
