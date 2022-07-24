import 'package:rick_and_morti/features/domain/entities/character_entity.dart';

abstract class PersonRepository{
  Future<List<CharacterEntity>> getAllCharacters(int page);
  Future<List<CharacterEntity>> getSearchedCharacter(String name);
}