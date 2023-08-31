# secure_store

A new Flutter plugin for encrypted key-value pair storage.

## Getting Started

This project is a starting point for a Flutter
[plug-in package](https://flutter.dev/developing-packages/),
a specialized package that includes platform-specific implementation code for
Android and/or iOS.

For help getting started with Flutter development, view the
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

##Installation 

Once the secure_store plugin is imported into your Flutter project import this 

    import 'package:secure_store/secure_store_method_channel.dart';

	// initialize secure_store
    final _secureStore = SecureStore();

	// write a key-value pair into secure_store
    _secureStore.write(key: key, value: value);
	
	// read a value and store it in secure_store
	String value = _secureStore.read(key: key);
	
	// return a bool whether the key already exists in secure_store
	Boolean exists = _secureStore.contains(key: key);
	
	// remove a key-value pair from the datastore
	_secureStore.delete(key: key);
	

##Security Implications

It is highly recommended to avoid storing secrets in the app as plaintext. Flutter apps can be decompiled and thus any plain-text strings can be found. Secrets should also not be stored in any of the build configurations files as those will need to be checked into version control. 

### Android

On the Android the EncryptedSharedPreferences library from AndroidX security is backing the secure_store plugin. This library is compatible with Android 6.0 (API level 23) and above. This plugin has been designed so the user can focus on teh data being stored. This keystore is backed by hardware It is designed to handle most user facing apps on mobile including banking and other enterprise applications. This implementation uses the built in AES256 block cipher encrpytion algorithm to secure data. This algorithm is also ideal for data that is smaller which covers most of the cases where the suer is looking to store small bits of data such as a secure base url for http requests, user passwords, access keys, etc... 

### iOS

TBD

### Web

TBD

### Future

- User based secure_store
- Web/iOS implementations
- abilty to change the algorithm depeneding the type of data being stored. 
- more testing
- mbetter error handling. 
