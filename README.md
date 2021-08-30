# flutter_intro

Flutter Intro - Technical Session

```
flutter pub get
```


## Installation

[Full Instructions](https://flutter.dev/docs/get-started/install/windows)

Unzip [flutter_windows](https://storage.googleapis.com/flutter_infra_release/releases/stable/windows/flutter_windows_2.2.3-stable.zip)
somewhere (not in c:\program files)

Update path to add `c:\where\unzipped\flutter\bin` so that it appears BEFORE the dart-sdk\bin folder from previous session.

After reloading the CLI process, check if path is correct with:

```ps1
CMD> where flutter dart
POWERSHELL> where.exe flutter dart

# Should result in
C:\dev\src\flutter\bin\flutter
C:\dev\src\flutter\bin\flutter.bat
C:\dev\src\flutter\bin\dart
C:\dev\src\flutter\bin\dart.bat
C:\dev\src\dart-sdk\bin\dart.exe
```

Then run `flutter doctor` after each step until the doctor says it's ok!  
Once the doctor gives the OK, do the [Test Drive](https://flutter.dev/docs/get-started/test-drive?tab=androidstudio)


### Accepting Licenses

```
flutter doctor --android-licenses  # From elevated prompt
```

If you get something like the error below, install Java SDK (see below)

```
Exception in thread "main" java.lang.NoClassDefFoundError: javax/xml/bind/annotation/XmlSchema
        at com.android.repository.api.SchemaModule$SchemaModuleVersion.<init>(SchemaModule.java:156)
```


### Android Studio

```
choco install -y androidstudio
```

Additional installation will begin once started.

If HAXM failed, go to "Turn Windows features on or off" and disable Hyper-V


File > Settings > Dart > Dart SDK path

AVD Manager (Icon right top) > Setup a device and run it
SDK Manager (Icon right top) > Android SDK > SDK Tools > Android SDK Platform-tools

If `flutter doctor` cannot detect Android Studio even if it has been installed, you can use `flutter config --android-studio-dir=c:\android\studio`


Links

- [Failed to install HAXM during Android Studio installation](https://stackoverflow.com/questions/32795704/failed-to-install-haxm-during-android-studio-installation)
- [“unable to locate adb” using Android Studio](https://stackoverflow.com/questions/39036796/unable-to-locate-adb-using-android-studio)


### Java SDK

```
choco install -y jdk8
```

Need environment variables: `%JAVA_HOME%` and add `%JAVA_HOME%\bin` to PATH.

