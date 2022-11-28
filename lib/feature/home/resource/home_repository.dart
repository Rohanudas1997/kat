import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kat_game/common/http/firebase_provider.dart';
import 'package:kat_game/common/http/response.dart';
import 'package:kat_game/feature/home/model/games.dart';

class HomeRepository {
  HomeRepository({
    required this.firebaseProvider,
  });
  final FirebaseProvider firebaseProvider;

  Future<DataResponse<List<Games>>> fetchGames() async {
    List<Games> games = <Games>[];
    try {
      firebaseProvider.getData('games').get().then(
        (QuerySnapshot querySnapshot) {
          querySnapshot.docs.forEach((element) {
            element;
            games.add(Games.fromJson(element.data() as Map<String, dynamic>));
          });
        },
      );
      return DataResponse.success(games);
    } on FirebaseException catch (e) {
      return DataResponse.error(e.message);
    } catch (e) {
      return DataResponse.error(e.toString());
    }
  }
}
