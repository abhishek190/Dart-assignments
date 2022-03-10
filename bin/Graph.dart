class Node {
  late String id;
  late String name;
  late Map<String?, String?> info;
  Node(this.id, this.name, this.info);
  void display(){
    print('$id   $name');
  }
}
