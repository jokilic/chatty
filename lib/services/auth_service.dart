import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../constants/routes.dart';
import 'logger_service.dart';

class AuthService extends GetxService {
  final logger = Get.find<LoggerService>();

  /// ------------------------
  /// VARIABLES
  /// ------------------------

  ///
  late final FirebaseAuth _auth;
  FirebaseAuth get auth => _auth;
  set auth(FirebaseAuth value) => _auth = value;

  ///
  User? _currentUser;
  User? get currentUser => _currentUser;
  set currentUser(User? value) => _currentUser = value;

  /// ------------------------
  /// INIT
  /// ------------------------

  @override
  void onInit() {
    super.onInit();
    auth = FirebaseAuth.instance;

    /// Listener which gets triggered whenever the the user change is detected
    auth.userChanges().listen(
      (user) {
        /// Store new user in the `currentUser` variable
        currentUser = user;
        logger
          ..v('AUTH SERVICE')
          ..v('--------------------')
          ..v('$user')
          ..v('--------------------\n');

        /// If there is a user, go to [ChatScreen]
        /// Else, go to [OnboardingScreen]
        Get.toNamed(
          user != null ? ChattyRoutes.chatScreen : ChattyRoutes.onboardingScreen,
        );
      },
    );
  }

  /// ------------------------
  /// METHODS
  /// ------------------------

  /// Updates current user's display name
  Future<void> updateDisplayName({required String newName}) async {
    await currentUser?.updateDisplayName(newName);

    logger
      ..v('AUTH SERVICE')
      ..v('--------------------')
      ..v('Display name updated')
      ..v(newName)
      ..v('--------------------\n');
  }

  /// Updates current user's photo
  Future<void> updatePhotoURL({required String newPhotoURL}) async {
    await currentUser?.updatePhotoURL(newPhotoURL);

    logger
      ..v('AUTH SERVICE')
      ..v('--------------------')
      ..v('PhotoURL updated')
      ..v(newPhotoURL)
      ..v('--------------------\n');
  }

  /// Updates current user's email
  Future<void> updateEmail({required String newEmail}) async {
    await currentUser?.updateEmail(newEmail);

    logger
      ..v('AUTH SERVICE')
      ..v('--------------------')
      ..v('Email updated')
      ..v(newEmail)
      ..v('--------------------\n');
  }

  /// Updates current user's password
  Future<void> updatePassword({required String newPassword}) async {
    await currentUser?.updatePassword(newPassword);

    logger
      ..v('AUTH SERVICE')
      ..v('--------------------')
      ..v('Password updated')
      ..v(newPassword)
      ..v('--------------------\n');
  }

  /// Sends password reset email to the current user
  Future<void> sendPasswordResetEmail() async {
    if (currentUser != null && currentUser?.email != null) {
      await auth.sendPasswordResetEmail(email: currentUser!.email!);

      logger
        ..v('AUTH SERVICE')
        ..v('--------------------')
        ..v('Password reset email sent')
        ..v('--------------------\n');

      return;
    }

    logger
      ..e('AUTH SERVICE')
      ..e('--------------------')
      ..e('Password reset email failed to send')
      ..e('--------------------\n');
  }

  /// Deletes current user
  Future<void> deleteUser() async {
    await currentUser?.delete();

    logger
      ..v('AUTH SERVICE')
      ..v('--------------------')
      ..v('User deleted')
      ..v('--------------------\n');
  }

  /// Register a new user
  Future<UserCredential?> registerUser({required String email, required String password}) async {
    try {
      final newUser = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      logger
        ..v('AUTH SERVICE')
        ..v('--------------------')
        ..v('User registered')
        ..v('--------------------\n');

      return newUser;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        logger
          ..e('AUTH SERVICE')
          ..e('--------------------')
          ..e('Password is too weak')
          ..e('--------------------\n');
      } else if (e.code == 'email-already-in-use') {
        logger
          ..e('AUTH SERVICE')
          ..e('--------------------')
          ..e('Account already exists')
          ..e('--------------------\n');
      }
    } catch (e) {
      logger
        ..e('AUTH SERVICE')
        ..e('--------------------')
        ..e('Generic register error: $e')
        ..e('--------------------\n');
    }
    return null;
  }

  /// Sign-in user
  Future<bool> signIn({required String email, required String password}) async {
    try {
      await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      logger
        ..v('AUTH SERVICE')
        ..v('--------------------')
        ..v('User signed in')
        ..v('--------------------\n');

      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        logger
          ..e('AUTH SERVICE')
          ..e('--------------------')
          ..e('User not found')
          ..e('--------------------\n');
      } else if (e.code == 'wrong-password') {
        logger
          ..e('AUTH SERVICE')
          ..e('--------------------')
          ..e('Wrong password')
          ..e('--------------------\n');
      }
    } catch (e) {
      logger
        ..e('AUTH SERVICE')
        ..e('--------------------')
        ..e('Generic sign-in error: $e')
        ..e('--------------------\n');
    }
    return false;
  }

  /// Sign-out current uset
  Future<void> signOut() async {
    await auth.signOut();

    logger
      ..v('AUTH SERVICE')
      ..v('--------------------')
      ..v('User signed out')
      ..v('--------------------\n');
  }

  /// Sign-in user with [Google]
  Future<void> signInGoogle() async {
    try {
      // Trigger the authentication flow
      final googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final googleAuth = await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Once signed in, return the UserCredential
      await auth.signInWithCredential(credential);

      logger
        ..v('AUTH SERVICE')
        ..v('--------------------')
        ..v('User signed in with Google')
        ..v('--------------------\n');
    } catch (e) {
      logger
        ..e('AUTH SERVICE')
        ..e('--------------------')
        ..e('Generic Google sign-in error: $e')
        ..e('--------------------\n');
    }
  }
}
