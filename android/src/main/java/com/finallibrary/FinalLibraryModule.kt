package com.finallibrary

import com.facebook.react.bridge.ReactApplicationContext
import com.facebook.react.bridge.ReactMethod
import com.facebook.react.bridge.Promise

class FinalLibraryModule internal constructor(context: ReactApplicationContext) :
  FinalLibrarySpec(context) {

  override fun getName(): String {
    return NAME
  }

  // Example method
  // See https://reactnative.dev/docs/native-modules-android
  @ReactMethod
  override fun multiply(a: Double, b: Double, promise: Promise) {
    promise.resolve(a * b)
  }

  @ReactMethod
  override fun revertString(s: String, promise: Promise) {
    promise.resolve(s.reversed())
  }

  companion object {
    const val NAME = "FinalLibrary"
  }
}
