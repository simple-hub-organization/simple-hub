#!/bin/bash

echo "Making native executable of the project"

scripts/bashScripts/dartSdkDownload.sh # Downloading dart-sdk for the correct architecture.

unzip dartsdk-*.zip
rm dartsdk-*.zip

dart-sdk/bin/pub get --no-precompile
dart-sdk/bin/dart run build_runner build --delete-conflicting-outputs


dart-sdk/bin/dart compile exe bin/main.dart -o Cbj-Smart-Device

rm -r dart-sdk/
