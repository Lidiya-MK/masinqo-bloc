// Mocks generated by Mockito 5.4.4 from annotations
// in masinqo/test/unit_tests/domain/listener_album_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:masinqo/domain/entities/albums.dart' as _i5;
import 'package:masinqo/infrastructure/listener/listener_album/listener_album_repository.dart'
    as _i6;
import 'package:masinqo/infrastructure/listener/listener_album/listener_album_service.dart'
    as _i2;
import 'package:mockito/mockito.dart' as _i1;
import 'package:mockito/src/dummies.dart' as _i3;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeListenerAlbumService_0 extends _i1.SmartFake
    implements _i2.ListenerAlbumService {
  _FakeListenerAlbumService_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [ListenerAlbumService].
///
/// See the documentation for Mockito's code generation for more information.
class MockListenerAlbumService extends _i1.Mock
    implements _i2.ListenerAlbumService {
  MockListenerAlbumService() {
    _i1.throwOnMissingStub(this);
  }

  @override
  String get baseUrl => (super.noSuchMethod(
        Invocation.getter(#baseUrl),
        returnValue: _i3.dummyValue<String>(
          this,
          Invocation.getter(#baseUrl),
        ),
      ) as String);

  @override
  _i4.Future<List<_i5.Album>> getAlbums() => (super.noSuchMethod(
        Invocation.method(
          #getAlbums,
          [],
        ),
        returnValue: _i4.Future<List<_i5.Album>>.value(<_i5.Album>[]),
      ) as _i4.Future<List<_i5.Album>>);
}

/// A class which mocks [ListenerAlbumRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockListenerAlbumRepository extends _i1.Mock
    implements _i6.ListenerAlbumRepository {
  MockListenerAlbumRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.ListenerAlbumService get listenerAlbumService => (super.noSuchMethod(
        Invocation.getter(#listenerAlbumService),
        returnValue: _FakeListenerAlbumService_0(
          this,
          Invocation.getter(#listenerAlbumService),
        ),
      ) as _i2.ListenerAlbumService);

  @override
  _i4.Future<List<_i5.Album>> getAlbums() => (super.noSuchMethod(
        Invocation.method(
          #getAlbums,
          [],
        ),
        returnValue: _i4.Future<List<_i5.Album>>.value(<_i5.Album>[]),
      ) as _i4.Future<List<_i5.Album>>);
}
