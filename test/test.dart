import '../bin/Graph.dart';
import "package:test/test.dart";
import '../bin/Graph.dart';
import '../bin/UtilityClass.dart';
void main() {
  String? str1="asdasd";
  String? str2="asdad";
  Node A=Node("1","asd",{});
  Node B=Node("2","asd",{});
  Node C=Node("3","asd",{});
  Node D=Node("4","asd",{});
  Node E=Node("5","asd",{});
  Node F=Node("6","asd",{});
  group("Is Cycle Present Or Not",(){
    test("test1",(){
      expect(ifCycle({
        A:[B,C],
        B:[D,E],
        E:[F]
      }),false);
    });
    test("test2",(){
      expect(ifCycle({
        A:[B],
        B:[D,C],
        C:[A]
      }),true);
    });
    test("test3",(){
      expect(ifCycle({
        A:[B],
        B:[C],
        C:[A]
      }),true);
    });
  });
  group("Descendant",(){
    test("test4",(){
      expect(findDescendant(A,{
        A:[B],
        B:[C]
      }),[B,C]);
    });
    test("test5",(){
      expect(findDescendant(B,{
        A:[B],
        B:[C]
      }),[C]);
    });
    test("test6",(){
      expect(findDescendant(A,{
        A:[B,D],
        B:[C]
      }),[B,C,D]);
    });
  });
  group("Ancestor",(){
    test("test4",(){
      expect(findAncestor({
        A:[B],
        B:[C]
      },C),{A,B});
    });
    test("test5",(){
      expect(findAncestor({
        A:[B],
        B:[C]
      },B),{A});
    });

  });
}
