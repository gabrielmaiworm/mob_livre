import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class MobLivreeFirebaseUser {
  MobLivreeFirebaseUser(this.user);
  User? user;
  bool get loggedIn => user != null;
}

MobLivreeFirebaseUser? currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<MobLivreeFirebaseUser> mobLivreeFirebaseUserStream() =>
    FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<MobLivreeFirebaseUser>(
      (user) {
        currentUser = MobLivreeFirebaseUser(user);
        return currentUser!;
      },
    );
