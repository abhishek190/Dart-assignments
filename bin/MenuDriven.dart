import 'dart:io';
import 'ExceptionHandling.dart';
import 'Graph.dart';
import 'UtilityClass.dart';
void main(){
  String? flag='n';
  Map<String,Node?> addNewNode={};
  Map<dynamic, dynamic> graph={};
  do {
    print("1: Immediate parents of node\n2: Immediate children of node\n3: Ancestors of a node\n4: Descendants of a node");
    print("5: Delete dependency from tree\n6: Delete node from tree\n7: Add new dependency\n8: Add new Node\n9: Check all dependency");
    int type=int.parse(stdin.readLineSync()!);
    switch (type) {
      case 1:

        print("Enter Node Id");
        String? nodeId=stdin.readLineSync();
        try{
          if(graph.containsKey(addNewNode[nodeId])==false && addNewNode.containsKey(nodeId)==false){
            throw ValueException;
          }
          List<dynamic>immediateParent=[];
          graph.forEach((key, value) {
            if(value.contains(addNewNode[nodeId])){
              immediateParent.add(key);
            }
          });
          try {
            if (immediateParent.isEmpty==false) {
              for (var element in immediateParent) {
                element.display();
              }
            }
            else{
              throw ValueException;
            }
          }
          catch(e){
            print(ValueException().parentNotFound());
          }
        }
        catch(e){
          print(ValueException().invalidNode());
        }
        break;
      case 2:
        print("Enter Node Id");
        String? nodeId=stdin.readLineSync();
        try{
          if(graph.containsKey(addNewNode[nodeId])==false && addNewNode.containsKey(nodeId)==false){
            throw ValueException;
          }
          try{
            List<dynamic> children=graph[addNewNode[nodeId]];
            if(children.isEmpty){
              throw ValueException;
            }
            for(var element in children){
              element.display();
            }
          }
          catch(e){
            print(ValueException().childNodeNotFound());
          }
        }
        catch(e){
          print(ValueException().invalidNode());
        }
        break;
      case 3:
        print("Enter Node Id");
        String? nodeId=stdin.readLineSync();
        try{
          if(graph.containsKey(addNewNode[nodeId])==false && addNewNode.containsKey(nodeId)==false){
            throw ValueException;
          }

          Set<dynamic> ancestor=findAncestor(graph,addNewNode[nodeId]);
          if (ancestor.isEmpty) {
            print("Ancestor not found");
          }
          for (var element in ancestor) {
            element.display();
          }
        }
        catch(e){
          print(ValueException().invalidNode());
        }
        break;
      case 4:
        print("Enter Node Id");
        String? nodeId=stdin.readLineSync();
        try{
          if(graph.containsKey(addNewNode[nodeId])==false && addNewNode.containsKey(nodeId)==false){
            throw ValueException;
          }
          List<dynamic> descendant=findDescendant(addNewNode[nodeId],graph);
          if(descendant.isNotEmpty) {
            for (int i = 1; i < descendant.length; i++) {
              descendant[i].display();
            }
          }
          else{
            print("Descendant Not Found");
          }
        }
        catch(e){
          print(ValueException().invalidNode());
        }
        break;
      case 5:
        print("Enter Parent Id");
        String? parentId=stdin.readLineSync();
        print("Enter child Node Id");
        String? childNodeId=stdin.readLineSync();

        try {
          if (graph.containsKey(addNewNode[parentId])==false ) {
              throw ValueException;
          }
          List<dynamic>check=graph[addNewNode[parentId]];
          try {
            if(check.contains(addNewNode[childNodeId])==false){
              throw ValueException();
            }
            graph[addNewNode[parentId]].remove(addNewNode[childNodeId]);
          }
          catch(e){
            print(ValueException().childNodeNotFound());
          }
        }
        catch(e){
          print(ValueException().invalidParentNode());
        }


        break;
      case 6:
        print("Enter Node id");
        String? nodeId=stdin.readLineSync();
        if(graph.containsKey(addNewNode[nodeId])){
          graph.remove(addNewNode[nodeId]);
        }
        else{
          print("Node not present");
        }
        break;
      case 7:
        print("Enter Parent Id");
        String? parentId=stdin.readLineSync();
        print("Enter Node Id");
        String? childId=stdin.readLineSync();
        try {
          if (addNewNode.containsKey(parentId)==false ) {
            throw ValueException;
          }
          try {
            if(addNewNode.containsKey(childId)==false){
              throw ValueException();
            }
            List<Node?> obj=[];
            if(graph.containsKey(addNewNode[parentId])){
              obj=graph[addNewNode[parentId]];
            }
            obj.add(addNewNode[childId]);
            graph[addNewNode[parentId]]=obj;
            if(ifCycle(graph)==true){
              print("Cycle dependency found");
              obj.removeLast();
              graph[addNewNode[parentId]]=obj;
            }
          }
          catch(e){
            print(ValueException().childNodeNotFound());
          }
        }
        catch(e){
          print(ValueException().invalidParentNode());
        }

        break;
      case 8:
          print("Add Node Id");
          String? id=stdin.readLineSync();
          print("Add Node Name");
          String? name=stdin.readLineSync();
          print("Add additional Info in key-value pair");
          String? key=stdin.readLineSync();
          String? value=stdin.readLineSync();
          Node newNode=Node(id!,name!,{key:value});
          addNewNode[id]=newNode;

          addNewNode.forEach((key, value) {
            print(key);
            value?.display();

          });
        break;
      case 9:
        graphDisplay(graph);
        break;
      default:
        print("Wrong option");
    }
    print("Want to continue(y/n)");
    flag=stdin.readLineSync();
    flag=flag?.toLowerCase();
    try {
      if (flag != 'y' && flag != 'n') {
        throw ValueException();
      }
    } catch (e) {
      print(ValueException().iOException());
    }
  }while(flag=='y');
}