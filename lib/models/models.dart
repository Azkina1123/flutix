import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'user.dart';
part 'movie.dart';
part 'ticket.dart';

// NANTI HAPUSSS
bool lightMode = true;
User1 login = User1(
  "user1",
  "user1@gmail.com",
  "user1 Nama",
  ["Action", "Comedy"],
  "Indonesia",
  990000,
);

Map<String, Color> colors = {
  "cinder": const Color.fromARGB(255, 21, 19, 24), // light: text
  "soapstone": const Color.fromARGB(255, 252, 252, 252), // dark: text
  "cerulean-blue": const Color.fromARGB(255, 63, 85, 198), // light&dark: button
  "red-brown": const Color.fromARGB(255, 164, 47, 49), // light&dark: danger
  "light-grey": const Color.fromARGB(
      255, 217, 217, 217), // light: background genre button abu-abu
  "dark-jungle-green": const Color.fromARGB(
      255, 33, 31, 36), // dark: background genre button, background text field
  "dove-grey":
      const Color.fromARGB(255, 110, 108, 109), // light&dark: logo genre
};
List<String> genres = [
  "Musical",
  "Horror",
  "Romance",
  "Thriller",
  "Action",
  "Drama"
];

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
      description: "Din, a working-class college student with big dreams but small means, and Long, a cynical but all-powerful dragon capable of granting wishes, set off on a hilarious adventure through modern day Shanghai in pursuit of Din's long-lost childhood friend, Lina. Their journey forces them to answer some of life's biggest questions – because when you can wish for anything, you have to decide what really matters.",
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
      description: "Din, a working-class college student with big dreams but small means, and Long, a cynical but all-powerful dragon capable of granting wishes, set off on a hilarious adventure through modern day Shanghai in pursuit of Din's long-lost childhood friend, Lina. Their journey forces them to answer some of life's biggest questions – because when you can wish for anything, you have to decide what really matters.",
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
      description: "Din, a working-class college student with big dreams but small means, and Long, a cynical but all-powerful dragon capable of granting wishes, set off on a hilarious adventure through modern day Shanghai in pursuit of Din's long-lost childhood friend, Lina. Their journey forces them to answer some of life's biggest questions – because when you can wish for anything, you have to decide what really matters.",
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
    description: "Din, a working-class college student with big dreams but small means, and Long, a cynical but all-powerful dragon capable of granting wishes, set off on a hilarious adventure through modern day Shanghai in pursuit of Din's long-lost childhood friend, Lina. Their journey forces them to answer some of life's biggest questions – because when you can wish for anything, you have to decide what really matters.",
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
    description: "Din, a working-class college student with big dreams but small means, and Long, a cynical but all-powerful dragon capable of granting wishes, set off on a hilarious adventure through modern day Shanghai in pursuit of Din's long-lost childhood friend, Lina. Their journey forces them to answer some of life's biggest questions – because when you can wish for anything, you have to decide what really matters.",
    casts: ["Actor1", "Actor2"],
    img: "",
  ),
];

List<Ticket> tickets = [
  Ticket(
    id: 1234567890,
    createdDate: DateTime.utc(2023, 10, 21),
    broadcastDate: DateTime.utc(2023, 10, 30),
    cinema: "Samarinda Square XXI",
    studio: "Studio 2",
    seats: ["D4, D5"],
    used: true,
    movieId: 1,
    userId: "user1",
  ),
  Ticket(
    id: 7826351906,
    createdDate: DateTime.utc(2023, 10, 21),
    broadcastDate: DateTime.utc(2023, 10, 30),
    cinema: "Samarinda Square XXI",
    studio: "Studio 2",
    seats: ["D4, D5"],
    used: true,
    movieId: 2,
    userId: "user1",
  ),
  Ticket(
    id: 3892017265,
    createdDate: DateTime.utc(2023, 10, 21),
    broadcastDate: DateTime.utc(2023, 10, 30),
    cinema: "Samarinda Square XXI",
    studio: "Studio 2",
    seats: ["D4, D5"],
    used: true,
    movieId: 3,
    userId: "user1",
  ),
  Ticket(
    id: 0192736281,
    createdDate: DateTime.utc(2023, 10, 21),
    broadcastDate: DateTime.utc(2023, 10, 30),
    cinema: "Samarinda Square XXI",
    studio: "Studio 2",
    seats: ["D4, D5"],
    used: false,
    movieId: 4,
    userId: "user2",
  ),
  Ticket(
    id: 37261829371,
    createdDate: DateTime.utc(2023, 10, 21),
    broadcastDate: DateTime.utc(2023, 10, 30),
    cinema: "Samarinda Square XXI",
    studio: "Studio 2",
    seats: ["D4, D5"],
    used: false,
    movieId: 5,
    userId: "user1",
  ),
  Ticket(
    id: 26718263745,
    createdDate: DateTime.utc(2023, 10, 21),
    broadcastDate: DateTime.utc(2023, 10, 30),
    cinema: "Samarinda Square XXI",
    studio: "Studio 2",
    seats: ["D4, D5"],
    used: false,
    movieId: 5,
    userId: "user1",
  ),
  Ticket(
    id: 1242256423,
    createdDate: DateTime.utc(2023, 10, 21),
    broadcastDate: DateTime.utc(2023, 10, 30),
    cinema: "Samarinda Square XXI",
    studio: "Studio 2",
    seats: ["D4, D5"],
    used: false,
    movieId: 5,
    userId: "user1",
  ),
  Ticket(
    id: 7534212344,
    createdDate: DateTime.utc(2023, 10, 21),
    broadcastDate: DateTime.utc(2023, 10, 30),
    cinema: "Samarinda Square XXI",
    studio: "Studio 2",
    seats: ["D4, D5"],
    used: false,
    movieId: 5,
    userId: "user2",
  ),
];
