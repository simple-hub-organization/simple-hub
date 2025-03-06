//
//  Generated code. Do not modify.
//  source: aioesphomeapi/api.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'api.pb.dart' as $1;
import 'api.pbjson.dart';
import 'api_options.pb.dart' as $0;

export 'api.pb.dart';

abstract class APIConnectionServiceBase extends $pb.GeneratedService {
  $async.Future<$1.HelloResponse> hello($pb.ServerContext ctx, $1.HelloRequest request);
  $async.Future<$1.ConnectResponse> connect($pb.ServerContext ctx, $1.ConnectRequest request);
  $async.Future<$1.DisconnectResponse> disconnect($pb.ServerContext ctx, $1.DisconnectRequest request);
  $async.Future<$1.PingResponse> ping($pb.ServerContext ctx, $1.PingRequest request);
  $async.Future<$1.DeviceInfoResponse> device_info($pb.ServerContext ctx, $1.DeviceInfoRequest request);
  $async.Future<$0.void_> list_entities($pb.ServerContext ctx, $1.ListEntitiesRequest request);
  $async.Future<$0.void_> subscribe_states($pb.ServerContext ctx, $1.SubscribeStatesRequest request);
  $async.Future<$0.void_> subscribe_logs($pb.ServerContext ctx, $1.SubscribeLogsRequest request);
  $async.Future<$0.void_> subscribe_homeassistant_services($pb.ServerContext ctx, $1.SubscribeHomeassistantServicesRequest request);
  $async.Future<$0.void_> subscribe_home_assistant_states($pb.ServerContext ctx, $1.SubscribeHomeAssistantStatesRequest request);
  $async.Future<$1.GetTimeResponse> get_time($pb.ServerContext ctx, $1.GetTimeRequest request);
  $async.Future<$0.void_> execute_service($pb.ServerContext ctx, $1.ExecuteServiceRequest request);
  $async.Future<$0.void_> cover_command($pb.ServerContext ctx, $1.CoverCommandRequest request);
  $async.Future<$0.void_> fan_command($pb.ServerContext ctx, $1.FanCommandRequest request);
  $async.Future<$0.void_> light_command($pb.ServerContext ctx, $1.LightCommandRequest request);
  $async.Future<$0.void_> switch_command($pb.ServerContext ctx, $1.SwitchCommandRequest request);
  $async.Future<$0.void_> camera_image($pb.ServerContext ctx, $1.CameraImageRequest request);
  $async.Future<$0.void_> climate_command($pb.ServerContext ctx, $1.ClimateCommandRequest request);
  $async.Future<$0.void_> number_command($pb.ServerContext ctx, $1.NumberCommandRequest request);

  $pb.GeneratedMessage createRequest($core.String methodName) {
    switch (methodName) {
      case 'hello': return $1.HelloRequest();
      case 'connect': return $1.ConnectRequest();
      case 'disconnect': return $1.DisconnectRequest();
      case 'ping': return $1.PingRequest();
      case 'device_info': return $1.DeviceInfoRequest();
      case 'list_entities': return $1.ListEntitiesRequest();
      case 'subscribe_states': return $1.SubscribeStatesRequest();
      case 'subscribe_logs': return $1.SubscribeLogsRequest();
      case 'subscribe_homeassistant_services': return $1.SubscribeHomeassistantServicesRequest();
      case 'subscribe_home_assistant_states': return $1.SubscribeHomeAssistantStatesRequest();
      case 'get_time': return $1.GetTimeRequest();
      case 'execute_service': return $1.ExecuteServiceRequest();
      case 'cover_command': return $1.CoverCommandRequest();
      case 'fan_command': return $1.FanCommandRequest();
      case 'light_command': return $1.LightCommandRequest();
      case 'switch_command': return $1.SwitchCommandRequest();
      case 'camera_image': return $1.CameraImageRequest();
      case 'climate_command': return $1.ClimateCommandRequest();
      case 'number_command': return $1.NumberCommandRequest();
      default: throw $core.ArgumentError('Unknown method: $methodName');
    }
  }

  $async.Future<$pb.GeneratedMessage> handleCall($pb.ServerContext ctx, $core.String methodName, $pb.GeneratedMessage request) {
    switch (methodName) {
      case 'hello': return this.hello(ctx, request as $1.HelloRequest);
      case 'connect': return this.connect(ctx, request as $1.ConnectRequest);
      case 'disconnect': return this.disconnect(ctx, request as $1.DisconnectRequest);
      case 'ping': return this.ping(ctx, request as $1.PingRequest);
      case 'device_info': return this.device_info(ctx, request as $1.DeviceInfoRequest);
      case 'list_entities': return this.list_entities(ctx, request as $1.ListEntitiesRequest);
      case 'subscribe_states': return this.subscribe_states(ctx, request as $1.SubscribeStatesRequest);
      case 'subscribe_logs': return this.subscribe_logs(ctx, request as $1.SubscribeLogsRequest);
      case 'subscribe_homeassistant_services': return this.subscribe_homeassistant_services(ctx, request as $1.SubscribeHomeassistantServicesRequest);
      case 'subscribe_home_assistant_states': return this.subscribe_home_assistant_states(ctx, request as $1.SubscribeHomeAssistantStatesRequest);
      case 'get_time': return this.get_time(ctx, request as $1.GetTimeRequest);
      case 'execute_service': return this.execute_service(ctx, request as $1.ExecuteServiceRequest);
      case 'cover_command': return this.cover_command(ctx, request as $1.CoverCommandRequest);
      case 'fan_command': return this.fan_command(ctx, request as $1.FanCommandRequest);
      case 'light_command': return this.light_command(ctx, request as $1.LightCommandRequest);
      case 'switch_command': return this.switch_command(ctx, request as $1.SwitchCommandRequest);
      case 'camera_image': return this.camera_image(ctx, request as $1.CameraImageRequest);
      case 'climate_command': return this.climate_command(ctx, request as $1.ClimateCommandRequest);
      case 'number_command': return this.number_command(ctx, request as $1.NumberCommandRequest);
      default: throw $core.ArgumentError('Unknown method: $methodName');
    }
  }

  $core.Map<$core.String, $core.dynamic> get $json => APIConnectionServiceBase$json;
  $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>> get $messageJson => APIConnectionServiceBase$messageJson;
}

