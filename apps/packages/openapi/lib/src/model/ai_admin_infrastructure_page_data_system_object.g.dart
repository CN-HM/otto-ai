// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_admin_infrastructure_page_data_system_object.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AiAdminInfrastructurePageDataSystemObject
    extends AiAdminInfrastructurePageDataSystemObject {
  @override
  final int? total;
  @override
  final BuiltList<JsonObject?>? list;

  factory _$AiAdminInfrastructurePageDataSystemObject(
          [void Function(AiAdminInfrastructurePageDataSystemObjectBuilder)?
              updates]) =>
      (AiAdminInfrastructurePageDataSystemObjectBuilder()..update(updates))
          ._build();

  _$AiAdminInfrastructurePageDataSystemObject._({this.total, this.list})
      : super._();
  @override
  AiAdminInfrastructurePageDataSystemObject rebuild(
          void Function(AiAdminInfrastructurePageDataSystemObjectBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AiAdminInfrastructurePageDataSystemObjectBuilder toBuilder() =>
      AiAdminInfrastructurePageDataSystemObjectBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AiAdminInfrastructurePageDataSystemObject &&
        total == other.total &&
        list == other.list;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, total.hashCode);
    _$hash = $jc(_$hash, list.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'AiAdminInfrastructurePageDataSystemObject')
          ..add('total', total)
          ..add('list', list))
        .toString();
  }
}

class AiAdminInfrastructurePageDataSystemObjectBuilder
    implements
        Builder<AiAdminInfrastructurePageDataSystemObject,
            AiAdminInfrastructurePageDataSystemObjectBuilder> {
  _$AiAdminInfrastructurePageDataSystemObject? _$v;

  int? _total;
  int? get total => _$this._total;
  set total(int? total) => _$this._total = total;

  ListBuilder<JsonObject?>? _list;
  ListBuilder<JsonObject?> get list =>
      _$this._list ??= ListBuilder<JsonObject?>();
  set list(ListBuilder<JsonObject?>? list) => _$this._list = list;

  AiAdminInfrastructurePageDataSystemObjectBuilder() {
    AiAdminInfrastructurePageDataSystemObject._defaults(this);
  }

  AiAdminInfrastructurePageDataSystemObjectBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _total = $v.total;
      _list = $v.list?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AiAdminInfrastructurePageDataSystemObject other) {
    _$v = other as _$AiAdminInfrastructurePageDataSystemObject;
  }

  @override
  void update(
      void Function(AiAdminInfrastructurePageDataSystemObjectBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  AiAdminInfrastructurePageDataSystemObject build() => _build();

  _$AiAdminInfrastructurePageDataSystemObject _build() {
    _$AiAdminInfrastructurePageDataSystemObject _$result;
    try {
      _$result = _$v ??
          _$AiAdminInfrastructurePageDataSystemObject._(
            total: total,
            list: _list?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'list';
        _list?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'AiAdminInfrastructurePageDataSystemObject',
            _$failedField,
            e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
