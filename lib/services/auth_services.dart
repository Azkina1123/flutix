part of 'services.dart';

// Kelas AutServices adalah kelas yang menyediakan layanan untuk otentikasi pengguna.
class AutServices {
  // Variabel statis _auth digunakan untuk mengakses instance FirebaseAuth.
  static FirebaseAuth _auth = FirebaseAuth.instance;

  // Variabel user1 adalah variabel statis yang tampaknya belum diinisialisasi (bernilai null).
  static get user1 => null;

  // Metode signUp digunakan untuk mendaftarkan pengguna baru.
  static Future<void> signUp(String email, String password, String name,
      List<String> selectedGenres, String selectedLanguage) async {
    try {
      // Mencoba membuat pengguna baru dengan email dan password.
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      // Mengonversi objek User hasil pendaftaran ke objek User1
      // dengan mengatur properti seperti nama, genre yang dipilih, dan bahasa yang dipilih.
      User1 user1 = result.user!.convertToUser(
          name: name,
          selectedGenres: selectedGenres,
          selectedLanguage: selectedLanguage);

      // Memperbarui informasi pengguna ke layanan UserService.
      await UserService.updateUser(user1);
    } catch (e) {
      // Menangani kesalahan yang mungkin terjadi saat pendaftaran.
    }
  }

  // Metode signIn digunakan untuk mengotentikasi pengguna yang sudah terdaftar.
  static Future<User1?> signIn(String email, String password) async {

    try {
      // Mencoba untuk masuk (sign in) dengan email dan password yang diberikan.
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      
      final User1 user1 = result.user!.convertToUser();

      return user1;
    } on FirebaseAuthException catch (e) {

      // Email tidak ditemukan
      if (e.code == 'user-not-found') {

      // Password Salah
      } else if (e.code == 'wrong-password') {

      }
    }

    return null;
  }
}

// Kelas SignInSignUpResult digunakan untuk menyimpan hasil sign-in atau sign-up.
class SignInSignUpResult {
  final User1 user1; // Objek User1 yang mewakili pengguna.
  final String message; // Pesan informasi.

  // Konstruktor untuk membuat objek SignInSignUpResult dengan parameter yang diperlukan.
  SignInSignUpResult({required this.user1, required this.message});
}
