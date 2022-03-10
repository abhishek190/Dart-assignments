import 'dart:collection';
import 'ExceptionHandling.dart';

class PrimitiveWrapper {
  late Map<dynamic, bool> visited;
  late Map<dynamic, bool> recStack;
  late List<dynamic> descendant;

  PrimitiveWrapper(this.visited, this.recStack, this.descendant);
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
    graph.forEach((key, value) {
      if (value.length != 0) {
        key.display();
        print("---->");
        for (var element in value) {
          element.display();
        }
        print('\n');
      }
    });
  } catch (e) {
    print(ValueException().dependencyNotFound());
  }
}
//Find Descendant
List<dynamic> findDescendant(dynamic nodeId, Map<dynamic, dynamic> graph) {
  var data = PrimitiveWrapper({}, {}, []);
  if (graph.isEmpty) {
    print("Descendant Not Found");
  }
  graph.forEach((key, value) {
    data.visited[key] = false;
    for (var element in value) {
      data.visited[element] = false;
    }
  });
  dfs(nodeId, graph, data);
  return data.descendant;

}
//Find Descendant function using DFS
void dfs(dynamic nodeId, Map<dynamic, dynamic> graph, PrimitiveWrapper data) {
  data.visited[nodeId] = true;
  if (graph[nodeId] != null) {
    for (var element in graph[nodeId]) {
      if (data.visited[element] == false) {
        data.descendant.add(element);
        dfs(element, graph, data);
      }
    }
  }
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
