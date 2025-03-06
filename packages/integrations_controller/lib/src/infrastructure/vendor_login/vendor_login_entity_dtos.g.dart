// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vendor_login_entity_dtos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VendorLoginEntityDtosImpl _$$VendorLoginEntityDtosImplFromJson(
        Map<String, dynamic> json) =>
    _$VendorLoginEntityDtosImpl(
      vendor: json['vendor'] as String,
      credentials: json['credentials'] as Map<String, dynamic>,
    );

Map<String, dynamic> _$$VendorLoginEntityDtosImplToJson(
        _$VendorLoginEntityDtosImpl instance) =>
    <String, dynamic>{
      'vendor': instance.vendor,
      'credentials': instance.credentials,
    };
