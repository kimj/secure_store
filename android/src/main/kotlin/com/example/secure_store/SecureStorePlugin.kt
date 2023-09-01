package com.example.secure_store

import androidx.annotation.NonNull
import io.flutter.Log

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

/** SecureStorePlugin */
class SecureStorePlugin: FlutterPlugin, MethodCallHandler {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private var secureStore : SecureStore? = TODO();
  var channel : MethodChannel? = null
  val TAG : String = "SECURE_STORE"
  private val CHANNEL = "com.example.secure_store/secure_store"

  override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    secureStore = SecureStore(flutterPluginBinding.applicationContext)

    channel = MethodChannel(flutterPluginBinding.binaryMessenger, CHANNEL)
    channel!!.setMethodCallHandler(this)
  }

  override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
    when (call.method){
      "read" -> {
        val key = call.argument<String>("key")!!
        if(secureStore?.contains(key) == true){
          val value = secureStore?.read(call.argument<String>("key")!!)
          result.success(value)
        }
        else {
          result.error("ReadFailure", "SecureStore: Key does not exist in secure_store instance.", null)
        }
      }
      "write" -> {
        val key = call.argument<String>("key")!!
        val value = call.argument<String>("value")!!
        if (!secureStore?.contains(key)!!){
          secureStore?.write(call.argument<String>("key")!!, call.argument<String>("value")!!)
          result.success(value)
        } else {
          result.error("WriteFailure", "SecureStore: Key already exists in secure_store instance.", null)
        }
      }
      "delete" -> {
        secureStore?.delete(call.argument<String>("key")!!)
        result.success(null)
      }
      "contains" -> {
        val contains = secureStore?.contains(call.argument<String>("key")!!)
        result.success(contains)
      }
      else -> result.error("InvalidMethodCall", "SecureStore: Invalid method call.", "An invalid method call made to SecureStore Plugin.")
    }
  }

  override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
    if (channel == null) {
      Log.wtf(TAG, "Already detached from the engine.");
      return;
    }

    channel!!.setMethodCallHandler(null)
    channel = null
    secureStore = null
  }
}
