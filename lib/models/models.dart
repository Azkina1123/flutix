import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'user.dart';
part 'movie.dart';

// NANTI HAPUSSS
bool lightMode = true;
Map<String, Color> colors = {
  "cinder": Color.fromARGB(255, 21, 19, 24),            // light: text 
  "soapstone": Color.fromARGB(255, 252, 252, 252),      // dark: text
  "cerulean-blue": Color.fromARGB(255, 63, 85, 198),    // light&dark: button
  "red-brown": Color.fromARGB(255, 164, 47, 49),        // light&dark: danger
  "light-grey": Color.fromARGB(255, 217, 217, 217),     // light: background genre button 
  "dark-jungle-green": Color.fromARGB(255, 33, 31, 36), // dark: background genre button, background text field
  "dove-grey": Color.fromARGB(255, 110, 108, 109),      // light&dark: logo genre 
};

List<Movie> movies = [
  Movie(
      id: 1,
      start: DateTime.utc(2023, 10, 1),
      finish: DateTime.utc(2023, 10, 10),
      title: "Midnight Runners",
      rating: "R15+",
      genres: ["Action", "Adventure", "Drama"],
      duration: 119,
      language: "Korean",
      description: "ini deskripsi panjang dan lebar",
      casts: ["Actor1", "Actor2"],
      img: "",
      rate: 8.6),
  Movie(
      id: 2,
      start: DateTime.utc(2023, 10, 1),
      finish: DateTime.utc(2023, 10, 10),
      title: "Suzume",
      rating: "R15+",
      genres: ["Action", "Adventure", "Drama"],
      duration: 119,
      language: "Korean",
      description: "ini deskripsi panjang dan lebar",
      casts: ["Actor1", "Actor2"],
      img: "",
      rate: 9.3),
  Movie(
      id: 3,
      start: DateTime.utc(2023, 10, 15),
      finish: DateTime.utc(2023, 10, 25),
      title: "The Childe",
      rating: "R15+",
      genres: ["Action", "Adventure", "Drama"],
      duration: 119,
      language: "Korean",
      description: "ini deskripsi panjang dan lebar",
      casts: ["Actor1", "Actor2"],
      img: "",
      rate: 8.8),
  Movie(
    id: 4,
    start: DateTime.utc(2023, 10, 15),
    finish: DateTime.utc(2023, 10, 25),
    title: "Ditto",
    rating: "R15+",
    genres: ["Action", "Adventure", "Drama"],
    duration: 119,
    language: "Korean",
    description: "ini deskripsi panjang dan lebar",
    casts: ["Actor1", "Actor2"],
    img: "",
  ),
  Movie(
    id: 5,
    start: DateTime.utc(2023, 10, 20),
    finish: DateTime.utc(2023, 10, 30),
    title: "Decibel",
    rating: "R15+",
    genres: ["Action", "Adventure", "Drama"],
    duration: 119,
    language: "Korean",
    description: "ini deskripsi panjang dan lebar",
    casts: ["Actor1", "Actor2"],
    img: "",
  ),
];

List<String> genres = [
  "Musical",
  "Horror",
  "Romance",
  "Thriller",
  "Action",
  "Drama"
];
