// Mocks generated by Mockito 5.4.4 from annotations
// in front/test/home/home_screen_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i8;
import 'dart:typed_data' as _i10;

import 'package:dio/dio.dart' as _i2;
import 'package:file/file.dart' as _i5;
import 'package:flutter_cache_manager/flutter_cache_manager.dart' as _i6;
import 'package:flutter_cache_manager/src/cache_store.dart' as _i3;
import 'package:flutter_cache_manager/src/web/web_helper.dart' as _i4;
import 'package:front/data/auth_repository.dart' as _i9;
import 'package:front/data/settings.dart' as _i7;
import 'package:mockito/mockito.dart' as _i1;

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

class _FakeDio_0 extends _i1.SmartFake implements _i2.Dio {
  _FakeDio_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeCacheStore_1 extends _i1.SmartFake implements _i3.CacheStore {
  _FakeCacheStore_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeWebHelper_2 extends _i1.SmartFake implements _i4.WebHelper {
  _FakeWebHelper_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeFile_3 extends _i1.SmartFake implements _i5.File {
  _FakeFile_3(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeFileInfo_4 extends _i1.SmartFake implements _i6.FileInfo {
  _FakeFileInfo_4(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [Settings].
///
/// See the documentation for Mockito's code generation for more information.
class MockSettings extends _i1.Mock implements _i7.Settings {
  MockSettings() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i8.Future<void> initialise() => (super.noSuchMethod(
        Invocation.method(
          #initialise,
          [],
        ),
        returnValue: _i8.Future<void>.value(),
        returnValueForMissingStub: _i8.Future<void>.value(),
      ) as _i8.Future<void>);

  @override
  void setFavorites(List<String>? value) => super.noSuchMethod(
        Invocation.method(
          #setFavorites,
          [value],
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i2.Dio provideDio() => (super.noSuchMethod(
        Invocation.method(
          #provideDio,
          [],
        ),
        returnValue: _FakeDio_0(
          this,
          Invocation.method(
            #provideDio,
            [],
          ),
        ),
      ) as _i2.Dio);

  @override
  void setApiKey(String? value) => super.noSuchMethod(
        Invocation.method(
          #setApiKey,
          [value],
        ),
        returnValueForMissingStub: null,
      );
}

/// A class which mocks [AuthService].
///
/// See the documentation for Mockito's code generation for more information.
class MockAuthService extends _i1.Mock implements _i9.AuthService {
  MockAuthService() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i8.Future<(String?, String?)> login(
    String? email,
    String? password,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #login,
          [
            email,
            password,
          ],
        ),
        returnValue: _i8.Future<(String?, String?)>.value((null, null)),
      ) as _i8.Future<(String?, String?)>);

  @override
  _i8.Future<(String?, String?)> signup(
    String? email,
    String? password,
    String? firstName,
    String? lastName,
    String? address,
    String? ssn,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #signup,
          [
            email,
            password,
            firstName,
            lastName,
            address,
            ssn,
          ],
        ),
        returnValue: _i8.Future<(String?, String?)>.value((null, null)),
      ) as _i8.Future<(String?, String?)>);
}

/// A class which mocks [DefaultCacheManager].
///
/// See the documentation for Mockito's code generation for more information.
class MockDefaultCacheManager extends _i1.Mock
    implements _i6.DefaultCacheManager {
  MockDefaultCacheManager() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.CacheStore get store => (super.noSuchMethod(
        Invocation.getter(#store),
        returnValue: _FakeCacheStore_1(
          this,
          Invocation.getter(#store),
        ),
      ) as _i3.CacheStore);

  @override
  _i4.WebHelper get webHelper => (super.noSuchMethod(
        Invocation.getter(#webHelper),
        returnValue: _FakeWebHelper_2(
          this,
          Invocation.getter(#webHelper),
        ),
      ) as _i4.WebHelper);

  @override
  _i8.Future<_i5.File> getSingleFile(
    String? url, {
    String? key,
    Map<String, String>? headers,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #getSingleFile,
          [url],
          {
            #key: key,
            #headers: headers,
          },
        ),
        returnValue: _i8.Future<_i5.File>.value(_FakeFile_3(
          this,
          Invocation.method(
            #getSingleFile,
            [url],
            {
              #key: key,
              #headers: headers,
            },
          ),
        )),
      ) as _i8.Future<_i5.File>);

  @override
  _i8.Stream<_i6.FileInfo> getFile(
    String? url, {
    String? key,
    Map<String, String>? headers,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #getFile,
          [url],
          {
            #key: key,
            #headers: headers,
          },
        ),
        returnValue: _i8.Stream<_i6.FileInfo>.empty(),
      ) as _i8.Stream<_i6.FileInfo>);

  @override
  _i8.Stream<_i6.FileResponse> getFileStream(
    String? url, {
    String? key,
    Map<String, String>? headers,
    bool? withProgress = false,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #getFileStream,
          [url],
          {
            #key: key,
            #headers: headers,
            #withProgress: withProgress,
          },
        ),
        returnValue: _i8.Stream<_i6.FileResponse>.empty(),
      ) as _i8.Stream<_i6.FileResponse>);

  @override
  _i8.Future<_i6.FileInfo> downloadFile(
    String? url, {
    String? key,
    Map<String, String>? authHeaders,
    bool? force = false,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #downloadFile,
          [url],
          {
            #key: key,
            #authHeaders: authHeaders,
            #force: force,
          },
        ),
        returnValue: _i8.Future<_i6.FileInfo>.value(_FakeFileInfo_4(
          this,
          Invocation.method(
            #downloadFile,
            [url],
            {
              #key: key,
              #authHeaders: authHeaders,
              #force: force,
            },
          ),
        )),
      ) as _i8.Future<_i6.FileInfo>);

  @override
  _i8.Future<_i6.FileInfo?> getFileFromCache(
    String? key, {
    bool? ignoreMemCache = false,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #getFileFromCache,
          [key],
          {#ignoreMemCache: ignoreMemCache},
        ),
        returnValue: _i8.Future<_i6.FileInfo?>.value(),
      ) as _i8.Future<_i6.FileInfo?>);

  @override
  _i8.Future<_i6.FileInfo?> getFileFromMemory(String? key) =>
      (super.noSuchMethod(
        Invocation.method(
          #getFileFromMemory,
          [key],
        ),
        returnValue: _i8.Future<_i6.FileInfo?>.value(),
      ) as _i8.Future<_i6.FileInfo?>);

  @override
  _i8.Future<_i5.File> putFile(
    String? url,
    _i10.Uint8List? fileBytes, {
    String? key,
    String? eTag,
    Duration? maxAge = const Duration(days: 30),
    String? fileExtension = r'file',
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #putFile,
          [
            url,
            fileBytes,
          ],
          {
            #key: key,
            #eTag: eTag,
            #maxAge: maxAge,
            #fileExtension: fileExtension,
          },
        ),
        returnValue: _i8.Future<_i5.File>.value(_FakeFile_3(
          this,
          Invocation.method(
            #putFile,
            [
              url,
              fileBytes,
            ],
            {
              #key: key,
              #eTag: eTag,
              #maxAge: maxAge,
              #fileExtension: fileExtension,
            },
          ),
        )),
      ) as _i8.Future<_i5.File>);

  @override
  _i8.Future<_i5.File> putFileStream(
    String? url,
    _i8.Stream<List<int>>? source, {
    String? key,
    String? eTag,
    Duration? maxAge = const Duration(days: 30),
    String? fileExtension = r'file',
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #putFileStream,
          [
            url,
            source,
          ],
          {
            #key: key,
            #eTag: eTag,
            #maxAge: maxAge,
            #fileExtension: fileExtension,
          },
        ),
        returnValue: _i8.Future<_i5.File>.value(_FakeFile_3(
          this,
          Invocation.method(
            #putFileStream,
            [
              url,
              source,
            ],
            {
              #key: key,
              #eTag: eTag,
              #maxAge: maxAge,
              #fileExtension: fileExtension,
            },
          ),
        )),
      ) as _i8.Future<_i5.File>);

  @override
  _i8.Future<void> removeFile(String? key) => (super.noSuchMethod(
        Invocation.method(
          #removeFile,
          [key],
        ),
        returnValue: _i8.Future<void>.value(),
        returnValueForMissingStub: _i8.Future<void>.value(),
      ) as _i8.Future<void>);

  @override
  _i8.Future<void> emptyCache() => (super.noSuchMethod(
        Invocation.method(
          #emptyCache,
          [],
        ),
        returnValue: _i8.Future<void>.value(),
        returnValueForMissingStub: _i8.Future<void>.value(),
      ) as _i8.Future<void>);

  @override
  _i8.Future<void> dispose() => (super.noSuchMethod(
        Invocation.method(
          #dispose,
          [],
        ),
        returnValue: _i8.Future<void>.value(),
        returnValueForMissingStub: _i8.Future<void>.value(),
      ) as _i8.Future<void>);

  @override
  _i8.Stream<_i6.FileResponse> getImageFile(
    String? url, {
    String? key,
    Map<String, String>? headers,
    bool? withProgress = false,
    int? maxHeight,
    int? maxWidth,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #getImageFile,
          [url],
          {
            #key: key,
            #headers: headers,
            #withProgress: withProgress,
            #maxHeight: maxHeight,
            #maxWidth: maxWidth,
          },
        ),
        returnValue: _i8.Stream<_i6.FileResponse>.empty(),
      ) as _i8.Stream<_i6.FileResponse>);
}
