import 'package:equatable/equatable.dart';

class CharacterEntity extends Equatable {
  final int id;
  final String name;
  final String status;
  final String species;
  final String type;
  final String gender;
  final String origin;
  final Location location;
  final String image;
  final List<String> episodes;
  final String url;
  final DateTime created;

  const CharacterEntity(
      {required this.id,
      required this.name,
      required this.status,
      required this.species,
      required this.type,
      required this.gender,
      required this.origin,
      required this.location,
      required this.image,
      required this.episodes,
      required this.url,
      required this.created});

  @override
  List<Object?> get props => [
        id,
        name,
        status,
        species,
        type,
        gender,
        origin,
        location,
        image,
        episodes,
        url,
        created,
      ];
}

class Location {
  final String name;
  final String location;

  Location({required this.name, required this.location});
}
