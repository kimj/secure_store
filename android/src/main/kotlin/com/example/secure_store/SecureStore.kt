package com.example.secure_store

import android.content.Context
import android.content.SharedPreferences
import androidx.security.crypto.EncryptedSharedPreferences
import androidx.security.crypto.MasterKey

class SecureStore constructor(context: Context){

    var applicationContext : Context = context.applicationContext

    var masterKey: MasterKey = MasterKey.Builder(applicationContext)
        .setKeyScheme(MasterKey.KeyScheme.AES256_GCM)
        .build()

    var sharedPreferences: SharedPreferences = EncryptedSharedPreferences.create(
        applicationContext,
        "secret_shared_prefs",
        masterKey,
        EncryptedSharedPreferences.PrefKeyEncryptionScheme.AES256_SIV,
        EncryptedSharedPreferences.PrefValueEncryptionScheme.AES256_GCM
    )

    // use the shared preferences and editor as you normally would
    var editor: SharedPreferences.Editor = sharedPreferences.edit()

    fun write(key:String, value: String){
        editor.putString(key, value)
        editor.commit()

    }
    fun read(key:String) : String? {
        val token: String? = sharedPreferences.getString(key, "")
        return token
    }

    fun contains(key:String) : Boolean {
        return sharedPreferences.contains(key)
    }

    fun delete (key:String) {
        editor.remove(key);
        editor.apply();
    }
}