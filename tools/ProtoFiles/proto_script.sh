#!/bin/sh

# You mast have pub and protoc inside the path 
# Example PATH=$PATH:~/Programs/flutter/bin/cache/dart-sdk/bin

dart pub global activate protoc_plugin

export PATH="$PATH":"$HOME/.pub-cache/bin"


# Connection between App to Security Bear

mkdir protoc_as_dart

# TODO: Add check if protoc command is installed, if not that show to the user protoc
#  installations methods
#  The recommended one "sudo snap install protobuf --classic"
#  Didn't test and old version "sudo apt  install protobuf-compiler"
protoc --dart_out=grpc:protoc_as_dart/ -Iprotos protos/security_bear_connections.proto


rm -r ../security_bear/lib/infrastructure/gen/security_bear_server_d/protoc_as_dart
cp -r protoc_as_dart/ ../security_bear/lib/infrastructure/gen/security_bear_server_d # Copy to Security Bear protoc folder
date +"const securityBearServerProtocGenDate = '%d/%m/%y';">../security_bear/lib/infrastructure/gen/security_bear_server_d/proto_gen_date.dart

rm -r ../cbj_integrations_controller/lib/src/infrastructure/gen/security_bear_server_d/protoc_as_dart
cp -r -p protoc_as_dart/ ../cbj_integrations_controller/lib/src/infrastructure/gen/security_bear_server_d/	#   # copy to Integration controller protoc folder
date +"const securityBearServerProtocGenDate = '%d/%m/%y';">../cbj_integrations_controller/lib/src/infrastructure/gen/security_bear_server_d/proto_gen_date.dart


rm -r protoc_as_dart



# Connection between Security Bear to the App

mkdir protoc_as_dart

protoc --dart_out=grpc:protoc_as_dart/ -Iprotos protos/cbj_app_connections.proto



rm -r ../cbj_integrations_controller/lib/src/infrastructure/gen/cbj_app_server/protoc_as_dart
cp -r -p protoc_as_dart/ ../cbj_integrations_controller/lib/src/infrastructure/gen/cbj_app_server/	#   # copy to Integration controller protoc folder
date +"const appServerProtocGenDate = '%d/%m/%y';">../cbj_integrations_controller/lib/src/infrastructure/gen/cbj_app_server/proto_gen_date.dart

rm -r ../security_bear/lib/infrastructure/gen/cbj_app/protoc_as_dart
cp -r protoc_as_dart/ ../security_bear/lib/infrastructure/gen/cbj_app # Copy to Security Bear protoc folder
date +"const appServerProtocGenDate = '%d/%m/%y';">../security_bear/lib/infrastructure/gen/cbj_app/proto_gen_date.dart



rm -r protoc_as_dart


# Connection between Hub to the App and Remote Pipes and Remote Pipes Routing

mkdir protoc_as_dart

protoc --dart_out=grpc:protoc_as_dart/ -Iprotos protos/cbj_hub_server.proto




rm -r ../cbj_remote-pipes/lib/infrastructure/gen/cbj_hub_server/protoc_as_dart
cp -r -p protoc_as_dart/ ../cbj_remote-pipes/lib/infrastructure/gen/cbj_hub_server/	#   # copy to Remote-Pipes protoc folder
date +"const hubServerProtocGenDate = '%d/%m/%y';">../cbj_remote-pipes/lib/infrastructure/gen/cbj_hub_server/proto_gen_date.dart

rm -r ../cbj_integrations_controller/lib/src/infrastructure/gen/cbj_hub_server/protoc_as_dart
cp -r -p protoc_as_dart/ ../cbj_integrations_controller/lib/src/infrastructure/gen/cbj_hub_server/	#   # copy to Integration controller protoc folder
date +"const hubServerProtocGenDate = '%d/%m/%y';">../cbj_integrations_controller/lib/src/infrastructure/gen/cbj_hub_server/proto_gen_date.dart



rm -r protoc_as_dart





# Connection between Hub and ESPHome

mkdir protoc_as_dart


protoc --dart_out=protoc_as_dart/ -Iprotos  protos/aioesphomeapi/api.proto protos/aioesphomeapi/api_options.proto


rm -r ../cbj_integrations_controller/lib/src/infrastructure/gen/aioesphomeapi/protoc_as_dart
cp -r -p protoc_as_dart/ ../cbj_integrations_controller/lib/src/infrastructure/gen/aioesphomeapi/	#   # copy to Integration controller protoc folder
date +"const hubAioEspHomeApiClientProtocGenDate = '%d/%m/%y';">../cbj_integrations_controller/lib/src/infrastructure/gen/aioesphomeapi/proto_gen_date.dart

rm -r protoc_as_dart





# Connection between Hub to Smart Device

mkdir protoc_as_dart

protoc --dart_out=grpc:protoc_as_dart/ -Iprotos protos/cbj_smart_device_server.proto


rm -r ../cbj_integrations_controller/lib/src/infrastructure/gen/cbj_smart_device_server/protoc_as_dart
cp -r -p protoc_as_dart/ ../cbj_integrations_controller/lib/src/infrastructure/gen/cbj_smart_device_server/	#   # copy to Integration controller protoc folder
date +"const cbjSmartDeviceServerProtocGenDate = '%d/%m/%y';">../cbj_integrations_controller/lib/src/infrastructure/gen/cbj_smart_device_server/proto_gen_date.dart



rm -r protoc_as_dart
