import 'model/stat.dart';


abstract class StatRepository {
  Future<Stat> fetchStat(String memberName);
}

class FakeStatRepository implements StatRepository {
 Map<String, dynamic> myObject = {'Patrick':'Springboot','Philip':'Angular','Housely':'BigData','Nathan':'Swift','Quinn':'Docker','Moon':'PhP'} ;

  @override
  Future<Stat> fetchStat(String memberName) {
    // Simulate network delay
    return Future.delayed(
      Duration(seconds: 1),
      () {
        // Simulate some network error
        if (myObject.containsKey(memberName) == false) {
          throw NetworkError();
        } else {
        return Stat(
          memberName: memberName,
          memberSpecialty: myObject[memberName],
        );
        }
      },
    );
  }

}

class NetworkError extends Error {}
