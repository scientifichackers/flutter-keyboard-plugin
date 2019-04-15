package com.pycampers.keyboard

import android.view.KeyEvent
import io.flutter.app.FlutterActivity
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.PluginRegistry.Registrar

var channel: MethodChannel? = null

class KeyboardPlugin {
    companion object {
        @JvmStatic
        fun registerWith(registrar: Registrar) {
            channel = MethodChannel(registrar.messenger(), "com.pycampers.keyboard")
        }
    }
}

fun serializeEvent(event: KeyEvent): List<*> {
    return listOf(
            event.deviceId,
            event.source,
            event.metaState,
            event.action,
            event.keyCode,
            event.scanCode,
            event.repeatCount,
            event.flags,
            event.downTime,
            event.eventTime,
            event.characters
    )
}

open class KeyboardPluginActivity : FlutterActivity() {
    override fun onKeyDown(keyCode: Int, event: KeyEvent): Boolean {
        channel?.invokeMethod("onKeyDown", listOf(keyCode, serializeEvent(event)))
        return super.onKeyDown(keyCode, event)
    }
}