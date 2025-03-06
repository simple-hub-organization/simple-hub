///
//  Generated code. Do not modify.
//  source: cbj_hub_server.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'cbj_hub_server.pb.dart' as $0;
export 'cbj_hub_server.pb.dart';

class CbjHubClient extends $grpc.Client {
  static final _$clientTransferDevices =
      $grpc.ClientMethod<$0.ClientStatusRequests, $0.RequestsAndStatusFromHub>(
          '/CbjHub.CbjHub/ClientTransferDevices',
          ($0.ClientStatusRequests value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.RequestsAndStatusFromHub.fromBuffer(value));
  static final _$hubTransferDevices =
      $grpc.ClientMethod<$0.RequestsAndStatusFromHub, $0.ClientStatusRequests>(
          '/CbjHub.CbjHub/HubTransferDevices',
          ($0.RequestsAndStatusFromHub value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.ClientStatusRequests.fromBuffer(value));
  static final _$getCompHubInfo =
      $grpc.ClientMethod<$0.CompHubInfo, $0.CompHubInfo>(
          '/CbjHub.CbjHub/getCompHubInfo',
          ($0.CompHubInfo value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.CompHubInfo.fromBuffer(value));

  CbjHubClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseStream<$0.RequestsAndStatusFromHub> clientTransferDevices(
      $async.Stream<$0.ClientStatusRequests> request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(_$clientTransferDevices, request,
        options: options);
  }

  $grpc.ResponseStream<$0.ClientStatusRequests> hubTransferDevices(
      $async.Stream<$0.RequestsAndStatusFromHub> request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(_$hubTransferDevices, request,
        options: options);
  }

  $grpc.ResponseFuture<$0.CompHubInfo> getCompHubInfo($0.CompHubInfo request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getCompHubInfo, request, options: options);
  }
}

abstract class CbjHubServiceBase extends $grpc.Service {
  $core.String get $name => 'CbjHub.CbjHub';

  CbjHubServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.ClientStatusRequests,
            $0.RequestsAndStatusFromHub>(
        'ClientTransferDevices',
        clientTransferDevices,
        true,
        true,
        ($core.List<$core.int> value) =>
            $0.ClientStatusRequests.fromBuffer(value),
        ($0.RequestsAndStatusFromHub value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.RequestsAndStatusFromHub,
            $0.ClientStatusRequests>(
        'HubTransferDevices',
        hubTransferDevices,
        true,
        true,
        ($core.List<$core.int> value) =>
            $0.RequestsAndStatusFromHub.fromBuffer(value),
        ($0.ClientStatusRequests value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.CompHubInfo, $0.CompHubInfo>(
        'getCompHubInfo',
        getCompHubInfo_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.CompHubInfo.fromBuffer(value),
        ($0.CompHubInfo value) => value.writeToBuffer()));
  }

  $async.Future<$0.CompHubInfo> getCompHubInfo_Pre(
      $grpc.ServiceCall call, $async.Future<$0.CompHubInfo> request) async {
    return getCompHubInfo(call, await request);
  }

  $async.Stream<$0.RequestsAndStatusFromHub> clientTransferDevices(
      $grpc.ServiceCall call, $async.Stream<$0.ClientStatusRequests> request);
  $async.Stream<$0.ClientStatusRequests> hubTransferDevices(
      $grpc.ServiceCall call,
      $async.Stream<$0.RequestsAndStatusFromHub> request);
  $async.Future<$0.CompHubInfo> getCompHubInfo(
      $grpc.ServiceCall call, $0.CompHubInfo request);
}
