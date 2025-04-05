///
//  Generated code. Do not modify.
//  source: cbj_app_connections.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'cbj_app_connections.pb.dart' as $0;
export 'cbj_app_connections.pb.dart';

class CyBearJinniAppClient extends $grpc.Client {
  static final _$cBJAppGetSmartDeviceInformation =
      $grpc.ClientMethod<$0.CompInfoSB, $0.CBJCommendStatus>(
          '/CBJAppConnections.CyBearJinniApp/CBJAppGetSmartDeviceInformation',
          ($0.CompInfoSB value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.CBJCommendStatus.fromBuffer(value));
  static final _$getCompAppInfo =
      $grpc.ClientMethod<$0.CompAppInfo, $0.CompAppInfo>(
          '/CBJAppConnections.CyBearJinniApp/getCompAppInfo',
          ($0.CompAppInfo value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.CompAppInfo.fromBuffer(value));

  CyBearJinniAppClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.CBJCommendStatus> cBJAppGetSmartDeviceInformation(
      $0.CompInfoSB request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$cBJAppGetSmartDeviceInformation, request,
        options: options);
  }

  $grpc.ResponseFuture<$0.CompAppInfo> getCompAppInfo($0.CompAppInfo request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getCompAppInfo, request, options: options);
  }
}

abstract class CyBearJinniAppServiceBase extends $grpc.Service {
  $core.String get $name => 'CBJAppConnections.CyBearJinniApp';

  CyBearJinniAppServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.CompInfoSB, $0.CBJCommendStatus>(
        'CBJAppGetSmartDeviceInformation',
        cBJAppGetSmartDeviceInformation_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.CompInfoSB.fromBuffer(value),
        ($0.CBJCommendStatus value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.CompAppInfo, $0.CompAppInfo>(
        'getCompAppInfo',
        getCompAppInfo_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.CompAppInfo.fromBuffer(value),
        ($0.CompAppInfo value) => value.writeToBuffer()));
  }

  $async.Future<$0.CBJCommendStatus> cBJAppGetSmartDeviceInformation_Pre(
      $grpc.ServiceCall call, $async.Future<$0.CompInfoSB> request) async {
    return cBJAppGetSmartDeviceInformation(call, await request);
  }

  $async.Future<$0.CompAppInfo> getCompAppInfo_Pre(
      $grpc.ServiceCall call, $async.Future<$0.CompAppInfo> request) async {
    return getCompAppInfo(call, await request);
  }

  $async.Future<$0.CBJCommendStatus> cBJAppGetSmartDeviceInformation(
      $grpc.ServiceCall call, $0.CompInfoSB request);
  $async.Future<$0.CompAppInfo> getCompAppInfo(
      $grpc.ServiceCall call, $0.CompAppInfo request);
}
