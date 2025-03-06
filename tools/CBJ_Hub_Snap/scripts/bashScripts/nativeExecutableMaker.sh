#!/bin/bash

echo "Making native executable of the project"

scripts/bashScripts/dartSdkDownload.sh # Downloading dart-sdk for the correct architecture.

unzip dartsdk-*.zip
rm dartsdk-*.zip

dart-sdk/bin/dart pub get --no-precompile
dart-sdk/bin/dart run build_runner build --delete-conflicting-outputs

#chmod -R +rx dart-sdk/
dart-sdk/bin/dart compile exe bin/cbj_hub.dart -o CyBear-Jinni_Hub
# sudo dart-sdk/bin/dart bin/cbj_hub.dart .

rm -r dart-sdk/
