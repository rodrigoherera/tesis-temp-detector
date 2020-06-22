///
//  Generated code. Do not modify.
//  source: service.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

class User extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('User', package: const $pb.PackageName('proto'), createEmptyInstance: create)
    ..aInt64(1, 'id')
    ..aOS(2, 'name')
    ..aOS(3, 'lastName')
    ..aOS(4, 'email')
    ..aOS(5, 'password')
    ..aOB(6, 'admin')
    ..hasRequiredFields = false
  ;

  User._() : super();
  factory User() => create();
  factory User.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory User.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  User clone() => User()..mergeFromMessage(this);
  User copyWith(void Function(User) updates) => super.copyWith((message) => updates(message as User));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static User create() => User._();
  User createEmptyInstance() => create();
  static $pb.PbList<User> createRepeated() => $pb.PbList<User>();
  @$core.pragma('dart2js:noInline')
  static User getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<User>(create);
  static User _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get lastName => $_getSZ(2);
  @$pb.TagNumber(3)
  set lastName($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasLastName() => $_has(2);
  @$pb.TagNumber(3)
  void clearLastName() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get email => $_getSZ(3);
  @$pb.TagNumber(4)
  set email($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasEmail() => $_has(3);
  @$pb.TagNumber(4)
  void clearEmail() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get password => $_getSZ(4);
  @$pb.TagNumber(5)
  set password($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasPassword() => $_has(4);
  @$pb.TagNumber(5)
  void clearPassword() => clearField(5);

  @$pb.TagNumber(6)
  $core.bool get admin => $_getBF(5);
  @$pb.TagNumber(6)
  set admin($core.bool v) { $_setBool(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasAdmin() => $_has(5);
  @$pb.TagNumber(6)
  void clearAdmin() => clearField(6);
}

class Temperature extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Temperature', package: const $pb.PackageName('proto'), createEmptyInstance: create)
    ..aInt64(1, 'userId')
    ..aOS(2, 'date')
    ..aOS(3, 'value')
    ..aOS(4, 'to')
    ..aOS(5, 'from')
    ..hasRequiredFields = false
  ;

  Temperature._() : super();
  factory Temperature() => create();
  factory Temperature.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Temperature.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  Temperature clone() => Temperature()..mergeFromMessage(this);
  Temperature copyWith(void Function(Temperature) updates) => super.copyWith((message) => updates(message as Temperature));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Temperature create() => Temperature._();
  Temperature createEmptyInstance() => create();
  static $pb.PbList<Temperature> createRepeated() => $pb.PbList<Temperature>();
  @$core.pragma('dart2js:noInline')
  static Temperature getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Temperature>(create);
  static Temperature _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get userId => $_getI64(0);
  @$pb.TagNumber(1)
  set userId($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get date => $_getSZ(1);
  @$pb.TagNumber(2)
  set date($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasDate() => $_has(1);
  @$pb.TagNumber(2)
  void clearDate() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get value => $_getSZ(2);
  @$pb.TagNumber(3)
  set value($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasValue() => $_has(2);
  @$pb.TagNumber(3)
  void clearValue() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get to => $_getSZ(3);
  @$pb.TagNumber(4)
  set to($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasTo() => $_has(3);
  @$pb.TagNumber(4)
  void clearTo() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get from => $_getSZ(4);
  @$pb.TagNumber(5)
  set from($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasFrom() => $_has(4);
  @$pb.TagNumber(5)
  void clearFrom() => clearField(5);
}

class GetUsers extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('GetUsers', package: const $pb.PackageName('proto'), createEmptyInstance: create)
    ..pc<User>(1, 'user', $pb.PbFieldType.PM, subBuilder: User.create)
    ..hasRequiredFields = false
  ;

  GetUsers._() : super();
  factory GetUsers() => create();
  factory GetUsers.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetUsers.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  GetUsers clone() => GetUsers()..mergeFromMessage(this);
  GetUsers copyWith(void Function(GetUsers) updates) => super.copyWith((message) => updates(message as GetUsers));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetUsers create() => GetUsers._();
  GetUsers createEmptyInstance() => create();
  static $pb.PbList<GetUsers> createRepeated() => $pb.PbList<GetUsers>();
  @$core.pragma('dart2js:noInline')
  static GetUsers getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetUsers>(create);
  static GetUsers _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<User> get user => $_getList(0);
}

class GetTemperatures extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('GetTemperatures', package: const $pb.PackageName('proto'), createEmptyInstance: create)
    ..pc<Temperature>(1, 'temperatures', $pb.PbFieldType.PM, subBuilder: Temperature.create)
    ..hasRequiredFields = false
  ;

  GetTemperatures._() : super();
  factory GetTemperatures() => create();
  factory GetTemperatures.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetTemperatures.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  GetTemperatures clone() => GetTemperatures()..mergeFromMessage(this);
  GetTemperatures copyWith(void Function(GetTemperatures) updates) => super.copyWith((message) => updates(message as GetTemperatures));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetTemperatures create() => GetTemperatures._();
  GetTemperatures createEmptyInstance() => create();
  static $pb.PbList<GetTemperatures> createRepeated() => $pb.PbList<GetTemperatures>();
  @$core.pragma('dart2js:noInline')
  static GetTemperatures getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetTemperatures>(create);
  static GetTemperatures _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<Temperature> get temperatures => $_getList(0);
}

class ServerResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('ServerResponse', package: const $pb.PackageName('proto'), createEmptyInstance: create)
    ..aOB(1, 'success')
    ..a<$core.List<$core.int>>(2, 'value', $pb.PbFieldType.OY)
    ..aOS(3, 'error')
    ..hasRequiredFields = false
  ;

  ServerResponse._() : super();
  factory ServerResponse() => create();
  factory ServerResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ServerResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  ServerResponse clone() => ServerResponse()..mergeFromMessage(this);
  ServerResponse copyWith(void Function(ServerResponse) updates) => super.copyWith((message) => updates(message as ServerResponse));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ServerResponse create() => ServerResponse._();
  ServerResponse createEmptyInstance() => create();
  static $pb.PbList<ServerResponse> createRepeated() => $pb.PbList<ServerResponse>();
  @$core.pragma('dart2js:noInline')
  static ServerResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ServerResponse>(create);
  static ServerResponse _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get value => $_getN(1);
  @$pb.TagNumber(2)
  set value($core.List<$core.int> v) { $_setBytes(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasValue() => $_has(1);
  @$pb.TagNumber(2)
  void clearValue() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get error => $_getSZ(2);
  @$pb.TagNumber(3)
  set error($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasError() => $_has(2);
  @$pb.TagNumber(3)
  void clearError() => clearField(3);
}

