#!/bin/bash

echo "Making native executable of the project"

PROJECT_PATH="$1"
MAIN_FILE="$2"
EXECUTABLE_NAME="$3"
CURRENT_PATH="$4"

if [[ -z "$PROJECT_PATH" || -z "$MAIN_FILE" || -z "$EXECUTABLE_NAME" ]]; then
    echo "Error: Missing arguments!"
    echo "Usage: ./nativeExecutableMaker.sh <PROJECT_PATH> <ANOTHER_VAR>"
    exit 1
fi

rm -f dartsdk-*.zip

scripts/bashScripts/dartSdkDownload.sh # Downloading dart-sdk for the correct architecture.

unzip -o dartsdk-*.zip
rm dartsdk-*.zip

rm -f "$PROJECT_PATH/pubspec.lock"

dart-sdk/bin/dart pub get --no-precompile --directory="$PROJECT_PATH"
dart-sdk/bin/dart run build_runner clean --directory="$PROJECT_PATH"

cd "$PROJECT_PATH"
# Found a bug where "--directory" does not work with "dart run build_runner"
#dart-sdk/bin/dart run build_runner build --delete-conflicting-outputs --directory="$PROJECT_PATH"
$CURRENT_PATH/dart-sdk/bin/dart run build_runner build --delete-conflicting-outputs
cd "$CURRENT_PATH"
dart-sdk/bin/dart compile exe "$PROJECT_PATH/$MAIN_FILE" -o "$EXECUTABLE_NAME"

rm -r dart-sdk/