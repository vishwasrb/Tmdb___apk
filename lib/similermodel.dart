// import 'dart:convert';

// class Similarmodel {
//   bool adult;
//   String backdropPath;
//   dynamic belongsToCollection;
//   int budget;
//   List<Genre> genres;
//   String homepage;
//   int id;
//   String imdbId;
//   String originalLanguage;
//   String originalTitle;
//   String overview;
//   double popularity;
//   String posterPath;
//   List<ProductionCompany> productionCompanies;
//   List<ProductionCountry> productionCountries;
//   DateTime releaseDate;
//   int revenue;
//   int runtime;
//   List<SpokenLanguage> spokenLanguages;
//   String status;
//   String tagline;
//   String title;
//   bool video;
//   double voteAverage;
//   int voteCount;

//   Similarmodel({
//     required this.adult,
//     required this.backdropPath,
//     required this.belongsToCollection,
//     required this.budget,
//     required this.genres,
//     required this.homepage,
//     required this.id,
//     required this.imdbId,
//     required this.originalLanguage,
//     required this.originalTitle,
//     required this.overview,
//     required this.popularity,
//     required this.posterPath,
//     required this.productionCompanies,
//     required this.productionCountries,
//     required this.releaseDate,
//     required this.revenue,
//     required this.runtime,
//     required this.spokenLanguages,
//     required this.status,
//     required this.tagline,
//     required this.title,
//     required this.video,
//     required this.voteAverage,
//     required this.voteCount,
//   });

//   Similarmodel copyWith({
//     bool? adult,
//     String? backdropPath,
//     dynamic belongsToCollection,
//     int? budget,
//     List<Genre>? genres,
//     String? homepage,
//     int? id,
//     String? imdbId,
//     String? originalLanguage,
//     String? originalTitle,
//     String? overview,
//     double? popularity,
//     String? posterPath,
//     List<ProductionCompany>? productionCompanies,
//     List<ProductionCountry>? productionCountries,
//     DateTime? releaseDate,
//     int? revenue,
//     int? runtime,
//     List<SpokenLanguage>? spokenLanguages,
//     String? status,
//     String? tagline,
//     String? title,
//     bool? video,
//     double? voteAverage,
//     int? voteCount,
//   }) =>
//       Similarmodel(
//         adult: adult ?? this.adult,
//         backdropPath: backdropPath ?? this.backdropPath,
//         belongsToCollection: belongsToCollection ?? this.belongsToCollection,
//         budget: budget ?? this.budget,
//         genres: genres ?? this.genres,
//         homepage: homepage ?? this.homepage,
//         id: id ?? this.id,
//         imdbId: imdbId ?? this.imdbId,
//         originalLanguage: originalLanguage ?? this.originalLanguage,
//         originalTitle: originalTitle ?? this.originalTitle,
//         overview: overview ?? this.overview,
//         popularity: popularity ?? this.popularity,
//         posterPath: posterPath ?? this.posterPath,
//         productionCompanies: productionCompanies ?? this.productionCompanies,
//         productionCountries: productionCountries ?? this.productionCountries,
//         releaseDate: releaseDate ?? this.releaseDate,
//         revenue: revenue ?? this.revenue,
//         runtime: runtime ?? this.runtime,
//         spokenLanguages: spokenLanguages ?? this.spokenLanguages,
//         status: status ?? this.status,
//         tagline: tagline ?? this.tagline,
//         title: title ?? this.title,
//         video: video ?? this.video,
//         voteAverage: voteAverage ?? this.voteAverage,
//         voteCount: voteCount ?? this.voteCount,
//       );

//   factory Similarmodel.fromRawJson(String str) =>
//       Similarmodel.fromJson(json.decode(str));

//   static fromJson(decode) {}
// }

// class Genre {
//   int id;
//   String name;

//   Genre({
//     required this.id,
//     required this.name,
//   });

//   Genre copyWith({
//     int? id,
//     String? name,
//   }) =>
//       Genre(
//         id: id ?? this.id,
//         name: name ?? this.name,
//       );
// }

// class ProductionCompany {
//   int id;
//   String? logoPath;
//   String name;
//   String originCountry;

//   ProductionCompany({
//     required this.id,
//     required this.logoPath,
//     required this.name,
//     required this.originCountry,
//   });

//   ProductionCompany copyWith({
//     int? id,
//     String? logoPath,
//     String? name,
//     String? originCountry,
//   }) =>
//       ProductionCompany(
//         id: id ?? this.id,
//         logoPath: logoPath ?? this.logoPath,
//         name: name ?? this.name,
//         originCountry: originCountry ?? this.originCountry,
//       );
// }

// class ProductionCountry {
//   String iso31661;
//   String name;

//   ProductionCountry({
//     required this.iso31661,
//     required this.name,
//   });

//   ProductionCountry copyWith({
//     String? iso31661,
//     String? name,
//   }) =>
//       ProductionCountry(
//         iso31661: iso31661 ?? this.iso31661,
//         name: name ?? this.name,
//       );
// }

// class SpokenLanguage {
//   String englishName;
//   String iso6391;
//   String name;

//   SpokenLanguage({
//     required this.englishName,
//     required this.iso6391,
//     required this.name,
//   });

//   SpokenLanguage copyWith({
//     String? englishName,
//     String? iso6391,
//     String? name,
//   }) =>
//       SpokenLanguage(
//         englishName: englishName ?? this.englishName,
//         iso6391: iso6391 ?? this.iso6391,
//         name: name ?? this.name,
//       );
// }
