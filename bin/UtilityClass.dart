import 'dart:collection';
import 'dart:io';
import 'ExceptionHandling.dart';

class PrimitiveWrapper {
  late Map<dynamic, bool> visited;
  late Map<dynamic, bool> recStack;
  late List<dynamic> descendant;

  PrimitiveWrapper(this.visited, this.recStack, this.descendant);
}
//isNumceric
bool isNumeric(String s) {
  if (s == null) {
    return false;
  }
  return double.tryParse(s) != null;
}
//Cycle check function
bool ifCycle(Map<dynamic, dynamic> graph) {
  var data = PrimitiveWrapper({}, {}, []);
  graph.forEach((key, value) {
    data.visited[key] = false;
    data.recStack[key] = false;
    for (var element in value) {
      data.visited[element] = false;
      data.recStack[element] = false;
    }
  });
  bool result = false;
  data.visited.forEach((key, value) {
    if (data.visited[key] == false && ifCycleUtil(key, graph, data) == true) {
      result = true;
    }
  });
  return result;
}
//Cycle check help function
bool ifCycleUtil(
    dynamic key, Map<dynamic, dynamic> graph, PrimitiveWrapper data) {
  if (data.visited[key] == false) {
    data.visited[key] = true;
    data.recStack[key] = true;
    if (graph[key] != null) {
      for (var element in graph[key]) {
        if (data.visited[element] == false &&
            ifCycleUtil(element, graph, data) == true) {
          return true;
        } else if (data.recStack[element] == true) {
          return true;
        }
      }
    }
  }
  data.recStack[key] = false;

  return false;
}
//Display graph function
void graphDisplay(Map<dynamic, dynamic> graph) {
  try {
    if (graph.isEmpty) {
      throw ValueException();
    }
    int count=0;
    graph.forEach((key, value) {
      if (value.length != 0) {
        count=1;
        stdout.write(key);
        stdout.write('-->');

        for(int i=0;i<value.length;i++){
          stdout.write(value[i]);
          stdout.write("  ");
        }
        print('\n');
      }
      try {
        if (count == 0) {
          throw ValueException();
        }
      }
      catch(e){
        print(ValueException().dependencyNotFound());
      }
    });
  } catch (e) {
    print(ValueException().dependencyNotFound());
  }
}
//Find Descendant using BFS
Set<dynamic> findDescendant(dynamic nodeId, Map<dynamic, dynamic> graph) {
  Set<dynamic> descendant = {};
  Queue<dynamic> pq = Queue();
  pq.add(nodeId);
  while (pq.isEmpty == false) {
    dynamic top = pq.first;
    pq.removeFirst();
    if(graph[top]!=null) {
      for (var element in graph[top]) {
        pq.add(element);
        descendant.add(element);
      }
    }
  }
  return descendant;
}
//Find Ancestor using BFS
Set<dynamic> findAncestor(Map<dynamic, dynamic> graph, dynamic nodeId) {
  Set<dynamic> ancestor = {};
  Queue<dynamic> pq = Queue();
  pq.add(nodeId);
  while (pq.isEmpty == false) {
    dynamic top = pq.first;
    pq.removeFirst();
    graph.forEach((key, value) {
      if (value.contains(top)) {
        pq.add(key);
        ancestor.add(key);
      }
    });
  }
  return ancestor;

}
