import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';


enum AuthStatus {
  splash, 
  newUser,
  authenticated, 
  authenticating,
  unauthenticated, 
  error           
}
ValueNotifier<AuthProvider> authService= ValueNotifier(AuthProvider()); 

class AuthProvider with ChangeNotifier {

  final FirebaseAuth _auth = FirebaseAuth.instance;
  
  AuthStatus _status = AuthStatus.splash;
  User? _user;
  String? _errorMessage;

  // Getters to use in your UI
  AuthStatus get status => _status;
  User? get user => _user;
  String? get errorMessage => _errorMessage;

  AuthProvider() {
    // This looks at Firebase as soon as the app starts
    _initApp();
    // _auth.authStateChanges().listen(_onAuthStateChanged);
  }

  Future<void> _initApp() async {
    // Check if the user is already logged in
     await Future.delayed(const Duration(seconds: 2));

     final prefs = await SharedPreferences.getInstance();
    bool finishedOnboarding = prefs.getBool('finishedOnboarding') ?? false;

    if (!finishedOnboarding) {
      _status = AuthStatus.newUser; // Show onboarding if not finished
    } else {
      // 3. If they finished onboarding, check Firebase Login
      _auth.authStateChanges().listen(_onAuthStateChanged);
    }
    notifyListeners();
  }

  // 1. Monitor Auth Changes (Persistence)
  void _onAuthStateChanged(User? firebaseUser) {
    if (firebaseUser == null) {
      _status = AuthStatus.unauthenticated;
    } else {
      _user = firebaseUser;
      _status = AuthStatus.authenticated;
    }
    notifyListeners(); // This tells the UI to rebuild
  }

  // Call this when the user clicks "Get Started" on your intro pages
  Future<void> completeOnboarding() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('finishedOnboarding', true);
    _status = AuthStatus.unauthenticated;
    notifyListeners();
  }

  // 2. Sign Up (For new apartment seekers)
  Future<bool> signUp(
    String email, 
    String password, 
    String username
    ) async {
    try {
      _status = AuthStatus.authenticating;
      notifyListeners();

      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
          email: email.trim(), 
          password: password.trim()
          );

      // Update Firebase Profile with their Name
      await userCredential.user?.updateDisplayName(username);
      await userCredential.user?.reload();

    _user = _auth.currentUser;
    _status = AuthStatus.authenticated; 
    notifyListeners();
      return true;
    } on FirebaseAuthException catch (e) {
      _status = AuthStatus.unauthenticated;
      _errorMessage = e.message;
      notifyListeners();
      return false;
    }
  }

  // 3. Login
  Future<bool> login(
    String email, 
    String password
    ) async {
    try {
      _status = AuthStatus.authenticating;
      notifyListeners();

      await _auth.signInWithEmailAndPassword(
        email: email.trim(), 
        password: password.trim());
        
      return true;
    } on FirebaseAuthException catch (e) {
      _status = AuthStatus.unauthenticated;
      _errorMessage = e.message;
      notifyListeners();
      return false;
    }
  }

  // 4. Logout
  Future<void> logout() async {
    await _auth.signOut();
    _status = AuthStatus.unauthenticated;
    notifyListeners();
  }
}