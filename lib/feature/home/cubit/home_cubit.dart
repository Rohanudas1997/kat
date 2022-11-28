import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:kat_game/common/http/firebase_provider.dart';
import 'package:kat_game/feature/home/model/games.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({required this.firebaseProvider}) : super(HomeInitial());
  final FirebaseProvider firebaseProvider;

  fetchGames() async {
    final games = firebaseProvider.getData('games').snapshots().map((snapshot) {
      return snapshot.docs
          .map((doc) => Games.fromJson(doc.data() as Map<String, dynamic>))
          .toList();
    });
    emit(HomeDummyLoading());
    emit(HomeSuccess(games: games));

    // get().then(
    //   (QuerySnapshot querySnapshot) {
    //     querySnapshot.docs.forEach((element) {
    //       element;
    //       games.add(Games.fromJson(element.data() as Map<String, dynamic>));
    //     });

    //   },
    // );
  }
}
