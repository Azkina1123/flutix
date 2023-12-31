part of 'extensions.dart';

// Deklarasi ekstensi dengan nama FirebaseUserExtension pada objek User
extension FirebaseUserExtension on User {
  // Fungsi convertToUser yang akan digunakan untuk mengubah objek User menjadi objek User1
  User1 convertToUser(
          {String docId =
              "No Id", // Parameter id doc dengan nilai default "No Id"
          String name =
              "No Name", // Parameter nama dengan nilai default "No Name"
          String email =
              "No Email", // Parameter email dengan nilai default "No Email"
          List<String> selectedGenres =
              const [], // Parameter selectedGenres dengan nilai default berupa list kosong
          String selectedLanguage =
              "English", // Parameter selectedLanguage dengan nilai default "English"
          int balance = 0,
          required String
              profilePicture}) => // Parameter balance dengan nilai default 0
      User1(docId, uid, email, name, selectedGenres, selectedLanguage, balance,
          profilePicture);
}
