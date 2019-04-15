package com.pycampers.keyboard_example

import android.os.Bundle
import com.pycampers.keyboard.KeyboardPluginActivity
import io.flutter.plugins.GeneratedPluginRegistrant

class MainActivity : KeyboardPluginActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        GeneratedPluginRegistrant.registerWith(this)
    }
}
