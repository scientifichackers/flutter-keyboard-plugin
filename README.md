# Flutter Keyboard Plugin

A Flutter plugin to detect keyboard events on Android. Useful for non-touchscreen devices.

[![Sponsor](https://img.shields.io/badge/Sponsor-jaaga_labs-red.svg?style=for-the-badge)](https://www.jaaga.in/labs)

## Example

The example app can show detected events in a `ListView`.

It's present in the usual `example` directory.

```
$ git clone https://github.com/devxpy/flutter-keyboard-plugin.git
$ cd flutter-keyboard-plugin/example
$ flutter run
```

## Installation

Since flutter plugins don't have access to the regular `Activity` events,
you also, need to make a small change to the
`android/app/src/main/kotlin/.../MainActivity.kt` file.

Just replace `FlutterActivity()` by `KeyboardPluginActivity()`.

Here's what it should look like:-

```kotlin
import android.os.Bundle
import com.pycampers.keyboard.KeyboardPluginActivity
import io.flutter.plugins.GeneratedPluginRegistrant

class MainActivity : KeyboardPluginActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        GeneratedPluginRegistrant.registerWith(this)
    }
}
```