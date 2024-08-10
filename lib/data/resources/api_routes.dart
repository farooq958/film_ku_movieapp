class ApiRoutes{


  static const String baseUrl = 'https://api.themoviedb.org/3/movie';
  static const String apiBearer = 'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI3Y2E0NzVkYzZhYjQzNTZhZTA4OTRmNzUxYjk4YTQyYyIsIm5iZiI6MTcyMzIwMjA0NS41MzkwMSwic3ViIjoiNjZiNWYwZDc2YzU4YTJlYjVjYTc2NTQ5Iiwic2NvcGVzIjpbImFwaV9yZWFkIl0sInZlcnNpb24iOjF9.W5-oraBuiHbT2rhXWCgs-qLPQETsDrt8Wc8isNSihLI';
  static const String imageBaseUrl = 'https://image.tmdb.org/t/p/w500';
  static String getMovie = '$baseUrl/';
static String getGenre = 'https://api.themoviedb.org/3/genre/movie/list';
  static const String nowPlaying = "$baseUrl/now_playing?language=en-US&page=";
  static const String popular = "$baseUrl/popular?language=en-US&page=";

}