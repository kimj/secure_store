package com.example.secure_store

class SecureStore {
    var masterKey: MasterKey = Builder(context)
        .setKeyScheme(MasterKey.KeyScheme.AES256_GCM)
        .build()

    var sharedPreferences: EncryptedSharedPreferences = EncryptedSharedPreferences.create(
        context,
        "secret_shared_prefs",
        masterKey,
        EncryptedSharedPreferences.PrefKeyEncryptionScheme.AES256_SIV,
        EncryptedSharedPreferences.PrefValueEncryptionScheme.AES256_GCM
    )

    // use the shared preferences and editor as you normally would
    var editor: SharedPreferences.Editor = sharedPreferences.edit()

    fun write(key:String, value: String){
        val encryption
        editor.putString(key, encryption.encryptOrNull(value))
        editor.commit()

    }
    fun read(key:String) : Any {
        val token: Any = encryption.decryptOrNull(sharedPreferences.getString(key, ""))
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