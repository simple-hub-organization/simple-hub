//
//  Generated code. Do not modify.
//  source: cbj_smart_device_server.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'package:protobuf/protobuf.dart' as $pb;

import 'cbj_smart_device_server.pb.dart' as $0;

export 'cbj_smart_device_server.pb.dart';

@$pb.GrpcServiceName('CbjSmartDeviceConnections.CbjSmartDeviceConnections')
class CbjSmartDeviceConnectionsClient extends $grpc.Client {
  static final _$firstSetup = $grpc.ClientMethod<$0.CbjFirstSetupMessage, $0.CbjCommendStatus>(
      '/CbjSmartDeviceConnections.CbjSmartDeviceConnections/FirstSetup',
      ($0.CbjFirstSetupMessage value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.CbjCommendStatus.fromBuffer(value));
  static final _$getCompInfo = $grpc.ClientMethod<$0.CbjCommendStatus, $0.CbjCompSmartDeviceInfo>(
      '/CbjSmartDeviceConnections.CbjSmartDeviceConnections/GetCompInfo',
      ($0.CbjCommendStatus value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.CbjCompSmartDeviceInfo.fromBuffer(value));
  static final _$setCompInfo = $grpc.ClientMethod<$0.CbjCompSmartDeviceInfo, $0.CbjCommendStatus>(
      '/CbjSmartDeviceConnections.CbjSmartDeviceConnections/SetCompInfo',
      ($0.CbjCompSmartDeviceInfo value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.CbjCommendStatus.fromBuffer(value));
  static final _$setFirebaseAccountInformation = $grpc.ClientMethod<$0.CbjFirebaseAccountInformation, $0.CbjCommendStatus>(
      '/CbjSmartDeviceConnections.CbjSmartDeviceConnections/SetFirebaseAccountInformation',
      ($0.CbjFirebaseAccountInformation value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.CbjCommendStatus.fromBuffer(value));
  static final _$getStatus = $grpc.ClientMethod<$0.CbjSmartDeviceInfo, $0.CbjSmartDeviceStatus>(
      '/CbjSmartDeviceConnections.CbjSmartDeviceConnections/GetStatus',
      ($0.CbjSmartDeviceInfo value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.CbjSmartDeviceStatus.fromBuffer(value));
  static final _$updateDeviceName = $grpc.ClientMethod<$0.CbjSmartDeviceUpdateDetails, $0.CbjCommendStatus>(
      '/CbjSmartDeviceConnections.CbjSmartDeviceConnections/UpdateDeviceName',
      ($0.CbjSmartDeviceUpdateDetails value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.CbjCommendStatus.fromBuffer(value));
  static final _$setOnDevice = $grpc.ClientMethod<$0.CbjSmartDeviceInfo, $0.CbjCommendStatus>(
      '/CbjSmartDeviceConnections.CbjSmartDeviceConnections/SetOnDevice',
      ($0.CbjSmartDeviceInfo value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.CbjCommendStatus.fromBuffer(value));
  static final _$setOffDevice = $grpc.ClientMethod<$0.CbjSmartDeviceInfo, $0.CbjCommendStatus>(
      '/CbjSmartDeviceConnections.CbjSmartDeviceConnections/SetOffDevice',
      ($0.CbjSmartDeviceInfo value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.CbjCommendStatus.fromBuffer(value));
  static final _$setBlindsUp = $grpc.ClientMethod<$0.CbjSmartDeviceInfo, $0.CbjCommendStatus>(
      '/CbjSmartDeviceConnections.CbjSmartDeviceConnections/setBlindsUp',
      ($0.CbjSmartDeviceInfo value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.CbjCommendStatus.fromBuffer(value));
  static final _$setBlindsDown = $grpc.ClientMethod<$0.CbjSmartDeviceInfo, $0.CbjCommendStatus>(
      '/CbjSmartDeviceConnections.CbjSmartDeviceConnections/setBlindsDown',
      ($0.CbjSmartDeviceInfo value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.CbjCommendStatus.fromBuffer(value));
  static final _$setBlindsStop = $grpc.ClientMethod<$0.CbjSmartDeviceInfo, $0.CbjCommendStatus>(
      '/CbjSmartDeviceConnections.CbjSmartDeviceConnections/setBlindsStop',
      ($0.CbjSmartDeviceInfo value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.CbjCommendStatus.fromBuffer(value));
  static final _$registerClient = $grpc.ClientMethod<$0.CbjClientStatusRequests, $0.CbjRequestsAndStatusFromHub>(
      '/CbjSmartDeviceConnections.CbjSmartDeviceConnections/RegisterClient',
      ($0.CbjClientStatusRequests value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.CbjRequestsAndStatusFromHub.fromBuffer(value));
  static final _$registerHub = $grpc.ClientMethod<$0.CbjRequestsAndStatusFromHub, $0.CbjClientStatusRequests>(
      '/CbjSmartDeviceConnections.CbjSmartDeviceConnections/RegisterHub',
      ($0.CbjRequestsAndStatusFromHub value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.CbjClientStatusRequests.fromBuffer(value));
  static final _$suspendComputer = $grpc.ClientMethod<$0.CbjSmartDeviceInfo, $0.CbjCommendStatus>(
      '/CbjSmartDeviceConnections.CbjSmartDeviceConnections/suspendComputer',
      ($0.CbjSmartDeviceInfo value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.CbjCommendStatus.fromBuffer(value));
  static final _$shutdownComputer = $grpc.ClientMethod<$0.CbjSmartDeviceInfo, $0.CbjCommendStatus>(
      '/CbjSmartDeviceConnections.CbjSmartDeviceConnections/shutdownComputer',
      ($0.CbjSmartDeviceInfo value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.CbjCommendStatus.fromBuffer(value));

  CbjSmartDeviceConnectionsClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$0.CbjCommendStatus> firstSetup($0.CbjFirstSetupMessage request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$firstSetup, request, options: options);
  }

  $grpc.ResponseFuture<$0.CbjCompSmartDeviceInfo> getCompInfo($0.CbjCommendStatus request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getCompInfo, request, options: options);
  }

  $grpc.ResponseFuture<$0.CbjCommendStatus> setCompInfo($0.CbjCompSmartDeviceInfo request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$setCompInfo, request, options: options);
  }

  $grpc.ResponseFuture<$0.CbjCommendStatus> setFirebaseAccountInformation($0.CbjFirebaseAccountInformation request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$setFirebaseAccountInformation, request, options: options);
  }

  $grpc.ResponseFuture<$0.CbjSmartDeviceStatus> getStatus($0.CbjSmartDeviceInfo request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getStatus, request, options: options);
  }

  $grpc.ResponseFuture<$0.CbjCommendStatus> updateDeviceName($0.CbjSmartDeviceUpdateDetails request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updateDeviceName, request, options: options);
  }

  $grpc.ResponseFuture<$0.CbjCommendStatus> setOnDevice($0.CbjSmartDeviceInfo request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$setOnDevice, request, options: options);
  }

  $grpc.ResponseFuture<$0.CbjCommendStatus> setOffDevice($0.CbjSmartDeviceInfo request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$setOffDevice, request, options: options);
  }

  $grpc.ResponseFuture<$0.CbjCommendStatus> setBlindsUp($0.CbjSmartDeviceInfo request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$setBlindsUp, request, options: options);
  }

  $grpc.ResponseFuture<$0.CbjCommendStatus> setBlindsDown($0.CbjSmartDeviceInfo request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$setBlindsDown, request, options: options);
  }

  $grpc.ResponseFuture<$0.CbjCommendStatus> setBlindsStop($0.CbjSmartDeviceInfo request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$setBlindsStop, request, options: options);
  }

  $grpc.ResponseStream<$0.CbjRequestsAndStatusFromHub> registerClient($async.Stream<$0.CbjClientStatusRequests> request, {$grpc.CallOptions? options}) {
    return $createStreamingCall(_$registerClient, request, options: options);
  }

  $grpc.ResponseStream<$0.CbjClientStatusRequests> registerHub($async.Stream<$0.CbjRequestsAndStatusFromHub> request, {$grpc.CallOptions? options}) {
    return $createStreamingCall(_$registerHub, request, options: options);
  }

  $grpc.ResponseFuture<$0.CbjCommendStatus> suspendComputer($0.CbjSmartDeviceInfo request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$suspendComputer, request, options: options);
  }

  $grpc.ResponseFuture<$0.CbjCommendStatus> shutdownComputer($0.CbjSmartDeviceInfo request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$shutdownComputer, request, options: options);
  }
}

@$pb.GrpcServiceName('CbjSmartDeviceConnections.CbjSmartDeviceConnections')
abstract class CbjSmartDeviceConnectionsServiceBase extends $grpc.Service {
  $core.String get $name => 'CbjSmartDeviceConnections.CbjSmartDeviceConnections';

  CbjSmartDeviceConnectionsServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.CbjFirstSetupMessage, $0.CbjCommendStatus>(
        'FirstSetup',
        firstSetup_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.CbjFirstSetupMessage.fromBuffer(value),
        ($0.CbjCommendStatus value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.CbjCommendStatus, $0.CbjCompSmartDeviceInfo>(
        'GetCompInfo',
        getCompInfo_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.CbjCommendStatus.fromBuffer(value),
        ($0.CbjCompSmartDeviceInfo value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.CbjCompSmartDeviceInfo, $0.CbjCommendStatus>(
        'SetCompInfo',
        setCompInfo_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.CbjCompSmartDeviceInfo.fromBuffer(value),
        ($0.CbjCommendStatus value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.CbjFirebaseAccountInformation, $0.CbjCommendStatus>(
        'SetFirebaseAccountInformation',
        setFirebaseAccountInformation_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.CbjFirebaseAccountInformation.fromBuffer(value),
        ($0.CbjCommendStatus value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.CbjSmartDeviceInfo, $0.CbjSmartDeviceStatus>(
        'GetStatus',
        getStatus_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.CbjSmartDeviceInfo.fromBuffer(value),
        ($0.CbjSmartDeviceStatus value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.CbjSmartDeviceUpdateDetails, $0.CbjCommendStatus>(
        'UpdateDeviceName',
        updateDeviceName_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.CbjSmartDeviceUpdateDetails.fromBuffer(value),
        ($0.CbjCommendStatus value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.CbjSmartDeviceInfo, $0.CbjCommendStatus>(
        'SetOnDevice',
        setOnDevice_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.CbjSmartDeviceInfo.fromBuffer(value),
        ($0.CbjCommendStatus value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.CbjSmartDeviceInfo, $0.CbjCommendStatus>(
        'SetOffDevice',
        setOffDevice_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.CbjSmartDeviceInfo.fromBuffer(value),
        ($0.CbjCommendStatus value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.CbjSmartDeviceInfo, $0.CbjCommendStatus>(
        'setBlindsUp',
        setBlindsUp_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.CbjSmartDeviceInfo.fromBuffer(value),
        ($0.CbjCommendStatus value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.CbjSmartDeviceInfo, $0.CbjCommendStatus>(
        'setBlindsDown',
        setBlindsDown_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.CbjSmartDeviceInfo.fromBuffer(value),
        ($0.CbjCommendStatus value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.CbjSmartDeviceInfo, $0.CbjCommendStatus>(
        'setBlindsStop',
        setBlindsStop_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.CbjSmartDeviceInfo.fromBuffer(value),
        ($0.CbjCommendStatus value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.CbjClientStatusRequests, $0.CbjRequestsAndStatusFromHub>(
        'RegisterClient',
        registerClient,
        true,
        true,
        ($core.List<$core.int> value) => $0.CbjClientStatusRequests.fromBuffer(value),
        ($0.CbjRequestsAndStatusFromHub value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.CbjRequestsAndStatusFromHub, $0.CbjClientStatusRequests>(
        'RegisterHub',
        registerHub,
        true,
        true,
        ($core.List<$core.int> value) => $0.CbjRequestsAndStatusFromHub.fromBuffer(value),
        ($0.CbjClientStatusRequests value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.CbjSmartDeviceInfo, $0.CbjCommendStatus>(
        'suspendComputer',
        suspendComputer_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.CbjSmartDeviceInfo.fromBuffer(value),
        ($0.CbjCommendStatus value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.CbjSmartDeviceInfo, $0.CbjCommendStatus>(
        'shutdownComputer',
        shutdownComputer_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.CbjSmartDeviceInfo.fromBuffer(value),
        ($0.CbjCommendStatus value) => value.writeToBuffer()));
  }

  $async.Future<$0.CbjCommendStatus> firstSetup_Pre($grpc.ServiceCall call, $async.Future<$0.CbjFirstSetupMessage> request) async {
    return firstSetup(call, await request);
  }

  $async.Future<$0.CbjCompSmartDeviceInfo> getCompInfo_Pre($grpc.ServiceCall call, $async.Future<$0.CbjCommendStatus> request) async {
    return getCompInfo(call, await request);
  }

  $async.Future<$0.CbjCommendStatus> setCompInfo_Pre($grpc.ServiceCall call, $async.Future<$0.CbjCompSmartDeviceInfo> request) async {
    return setCompInfo(call, await request);
  }

  $async.Future<$0.CbjCommendStatus> setFirebaseAccountInformation_Pre($grpc.ServiceCall call, $async.Future<$0.CbjFirebaseAccountInformation> request) async {
    return setFirebaseAccountInformation(call, await request);
  }

  $async.Future<$0.CbjSmartDeviceStatus> getStatus_Pre($grpc.ServiceCall call, $async.Future<$0.CbjSmartDeviceInfo> request) async {
    return getStatus(call, await request);
  }

  $async.Future<$0.CbjCommendStatus> updateDeviceName_Pre($grpc.ServiceCall call, $async.Future<$0.CbjSmartDeviceUpdateDetails> request) async {
    return updateDeviceName(call, await request);
  }

  $async.Future<$0.CbjCommendStatus> setOnDevice_Pre($grpc.ServiceCall call, $async.Future<$0.CbjSmartDeviceInfo> request) async {
    return setOnDevice(call, await request);
  }

  $async.Future<$0.CbjCommendStatus> setOffDevice_Pre($grpc.ServiceCall call, $async.Future<$0.CbjSmartDeviceInfo> request) async {
    return setOffDevice(call, await request);
  }

  $async.Future<$0.CbjCommendStatus> setBlindsUp_Pre($grpc.ServiceCall call, $async.Future<$0.CbjSmartDeviceInfo> request) async {
    return setBlindsUp(call, await request);
  }

  $async.Future<$0.CbjCommendStatus> setBlindsDown_Pre($grpc.ServiceCall call, $async.Future<$0.CbjSmartDeviceInfo> request) async {
    return setBlindsDown(call, await request);
  }

  $async.Future<$0.CbjCommendStatus> setBlindsStop_Pre($grpc.ServiceCall call, $async.Future<$0.CbjSmartDeviceInfo> request) async {
    return setBlindsStop(call, await request);
  }

  $async.Future<$0.CbjCommendStatus> suspendComputer_Pre($grpc.ServiceCall call, $async.Future<$0.CbjSmartDeviceInfo> request) async {
    return suspendComputer(call, await request);
  }

  $async.Future<$0.CbjCommendStatus> shutdownComputer_Pre($grpc.ServiceCall call, $async.Future<$0.CbjSmartDeviceInfo> request) async {
    return shutdownComputer(call, await request);
  }

  $async.Future<$0.CbjCommendStatus> firstSetup($grpc.ServiceCall call, $0.CbjFirstSetupMessage request);
  $async.Future<$0.CbjCompSmartDeviceInfo> getCompInfo($grpc.ServiceCall call, $0.CbjCommendStatus request);
  $async.Future<$0.CbjCommendStatus> setCompInfo($grpc.ServiceCall call, $0.CbjCompSmartDeviceInfo request);
  $async.Future<$0.CbjCommendStatus> setFirebaseAccountInformation($grpc.ServiceCall call, $0.CbjFirebaseAccountInformation request);
  $async.Future<$0.CbjSmartDeviceStatus> getStatus($grpc.ServiceCall call, $0.CbjSmartDeviceInfo request);
  $async.Future<$0.CbjCommendStatus> updateDeviceName($grpc.ServiceCall call, $0.CbjSmartDeviceUpdateDetails request);
  $async.Future<$0.CbjCommendStatus> setOnDevice($grpc.ServiceCall call, $0.CbjSmartDeviceInfo request);
  $async.Future<$0.CbjCommendStatus> setOffDevice($grpc.ServiceCall call, $0.CbjSmartDeviceInfo request);
  $async.Future<$0.CbjCommendStatus> setBlindsUp($grpc.ServiceCall call, $0.CbjSmartDeviceInfo request);
  $async.Future<$0.CbjCommendStatus> setBlindsDown($grpc.ServiceCall call, $0.CbjSmartDeviceInfo request);
  $async.Future<$0.CbjCommendStatus> setBlindsStop($grpc.ServiceCall call, $0.CbjSmartDeviceInfo request);
  $async.Stream<$0.CbjRequestsAndStatusFromHub> registerClient($grpc.ServiceCall call, $async.Stream<$0.CbjClientStatusRequests> request);
  $async.Stream<$0.CbjClientStatusRequests> registerHub($grpc.ServiceCall call, $async.Stream<$0.CbjRequestsAndStatusFromHub> request);
  $async.Future<$0.CbjCommendStatus> suspendComputer($grpc.ServiceCall call, $0.CbjSmartDeviceInfo request);
  $async.Future<$0.CbjCommendStatus> shutdownComputer($grpc.ServiceCall call, $0.CbjSmartDeviceInfo request);
}
