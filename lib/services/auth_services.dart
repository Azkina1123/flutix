part of 'services.dart';

// Kelas AutServices adalah kelas yang menyediakan layanan untuk otentikasi pengguna.
class AutServices {
  // Variabel statis _auth digunakan untuk mengakses instance FirebaseAuth.
  static FirebaseAuth _auth = FirebaseAuth.instance;

  // Variabel user1 adalah variabel statis yang tampaknya belum diinisialisasi (bernilai null).
  static get user1 => null;

  // Metode signUp digunakan untuk mendaftarkan pengguna baru.
  static Future<void> signUp(
      String email,
      String password,
      String name,
      List<String> selectedGenres,
      String selectedLanguage,
      String profilePicture) async {
    try {
      // Mencoba membuat pengguna baru dengan email dan password.
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      // Mengonversi objek User hasil pendaftaran ke objek User1
      // dengan mengatur properti seperti nama, genre yang dipilih, dan bahasa yang dipilih.
      User1 user1 = result.user!.convertToUser(
          email: email,
          name: name,
          // password: password,
          selectedGenres: selectedGenres,
          selectedLanguage: selectedLanguage,
          profilePicture: profilePicture);

      // Memperbarui informasi pengguna ke layanan UserService.
      await UserService.updateUser(user1);
    } catch (e) {
      // Menangani kesalahan yang mungkin terjadi saat pendaftaran.
    }
  }

  static Future<String> signIn(String email, String password) async {
    // Mencoba untuk masuk (sign in) dengan email dan password yang diberikan.
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      print(e.code);
      if (e.code == "invalid-credential") {
        return "Your Email or Password is Incorrect.";
      } else if(e.code == "too-many-requests"){
        return "Too Many Login Attempt, Try Again Later.";
      } else if(e.code == "invalid-email") {
        return "Invalid Email Format.";
      } else {
        return "An Unknown Error Occurred, Try Again Later.";
      }
    }
    return "";
  }

  /*
  // Metode signIn digunakan untuk mengotentikasi pengguna yang sudah terdaftar.
  static Future<User1?> signIn(String email, String password) async {
    try {
      // Mencoba untuk masuk (sign in) dengan email dan password yang diberikan.
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);

      final User1 user1 = result.user!.convertToUser(profilePicture: '');

      return user1;
    } on FirebaseAuthException catch (e) {
      // Email tidak ditemukan
      print(e.code);
      if (e.code == 'invalid-credential') {
        print("test");
      
      } else if (e.code == 'wrong-password') {


      }
    }

    return null;
  }
  */
}

// Kelas SignInSignUpResult digunakan untuk menyimpan hasil sign-in atau sign-up.
class SignInSignUpResult {
  final User1 user1; // Objek User1 yang mewakili pengguna.
  final String message; // Pesan informasi.

  // Konstruktor untuk membuat objek SignInSignUpResult dengan parameter yang diperlukan.
  SignInSignUpResult({required this.user1, required this.message});
}
