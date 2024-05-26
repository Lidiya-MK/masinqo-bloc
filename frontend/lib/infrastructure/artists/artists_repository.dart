import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:masinqo/core.dart';
import 'package:http/http.dart' as http;
import 'package:masinqo/domain/artists/artists_repository_interface.dart';
import 'package:masinqo/infrastructure/artists/artists_data_source.dart';
import 'package:masinqo/infrastructure/artists/artists_dto.dart';
import 'package:masinqo/infrastructure/artists/artists_failure.dart';
import 'package:masinqo/infrastructure/artists/artists_success.dart';

class ArtistsRepository implements ArtistsRepositoryInterface {
  final String token;

  ArtistsRepository({required this.token});
  @override
  Future<Either<ArtistFailure, Success>> addAlbum(
      CreateAlbumDTO albumDto) async {
    Map<String, String> body = <String, String>{};
    if (albumDto.title.isNotEmpty) {
      body["title"] = albumDto.title;
    }

    if (albumDto.genre.isNotEmpty) {
      body["genre"] = albumDto.genre;
    }

    if (albumDto.description.isNotEmpty) {
      body["description"] = albumDto.description;
    }

    if (albumDto.type.isNotEmpty) {
      body["type"] = albumDto.type;
    } else {
      body["type"] = "Album";
    }

    http.StreamedResponse response =
        await ArtistsDataSource(token: token).addAlbum(
      body,
      albumDto.albumArt,
    );

    if (response.statusCode != 201) {
      return Left(ArtistFailure(message: response.statusCode.toString()));
    }

    return Right(ArtistsSuccess());
  }

  @override
  Future<Either<ArtistFailure, Success>> addSong() {
    // TODO: implement addSong
    throw UnimplementedError();
  }

  @override
  Future<Either<ArtistFailure, Success>> deleteAlbum(String albumId) async {
    http.Response response =
        await ArtistsDataSource(token: token).deleteAlbum(albumId);

    if (response.statusCode != 200) {
      return Left(ArtistFailure(message: response.body));
    }

    return Right(ArtistsSuccess());
  }

  @override
  Future<Either<ArtistFailure, GetAlbumsSuccess>> getAlbums() async {
    http.Response response = await ArtistsDataSource(token: token).getAlbums();

    if (response.statusCode != 200) {
      return Left(ArtistFailure(message: response.body));
    }

    return Right(GetAlbumsSuccess(albums: jsonDecode(response.body)));
  }

  @override
  Future<Either<ArtistFailure, Success>> getSong() {
    // TODO: implement getSong
    throw UnimplementedError();
  }

  @override
  Future<Either<ArtistFailure, Success>> removeSong() {
    // TODO: implement removeSong
    throw UnimplementedError();
  }

  @override
  Future<Either<ArtistFailure, Success>> updateAlbum(
      UpdateAlbumDTO updateDto) async {
    Map<String, String> body = <String, String>{};
    if (updateDto.title.isNotEmpty) {
      body["title"] = updateDto.title;
    }

    if (updateDto.genre.isNotEmpty) {
      body["genre"] = updateDto.genre;
    }

    if (updateDto.description.isNotEmpty) {
      body["description"] = updateDto.description;
    }

    http.Response response = await ArtistsDataSource(token: token)
        .updateAlbum(updateDto.albumId, body);

    if (response.statusCode != 201) {
      return Left(ArtistFailure(message: response.body));
    }

    return Right(ArtistsSuccess());
  }
}

void main() async {
  final ArtistsRepository artistRepo = ArtistsRepository(
      token:
          "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY2NTI5YzBmNTEwZTU4ZGRlYmJkYTk1MSIsInJvbGUiOjEsImlhdCI6MTcxNjY5OTM3MCwiZXhwIjoxNzE2Nzg1NzcwfQ.hptWAQD0UigjLi4yOtv4YpAte45If_UDNHhu1EHmyLE");

  // get albums
  final res = await artistRepo.getAlbums();
  res.fold((l) {
    print(l.message);
  }, (r) {
    print(r.albums);
  });

  // add albums
  // String albumArtPath = "./transformer.png";
  // final res = await artistRepo.addAlbum(CreateAlbumDTO(
  //     type: "Album",
  //     title: "That's a lie",
  //     genre: "Punk",
  //     description: "this is a description",
  //     albumArt: albumArtPath));

  // res.fold((l) {
  //   print(l.message);
  // }, (r) {
  //   print(r);
  // });

  // update albums
  // final res = await artistRepo.updateAlbum(UpdateAlbumDTO(
  //     albumId: "6652cbc78fed1d2eef050c47",
  //     title: "TRUTHTH",
  //     genre: "CULT MUSIC",
  //     description: ""));

  // res.fold((l) {
  //   print(l.message);
  // }, (r) {
  //   print(r);
  // });

  // // delete albums
  // final res = await artistRepo.deleteAlbum("6652cbc78fed1d2eef050c47");

  // res.fold((l) {
  //   print(l.message);
  // }, (r) {
  //   print(r);
  // });

  // 6652cdfe8fed1d2eef050c57
}
