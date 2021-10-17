package io.flutter.plugins;

import io.flutter.plugin.common.PluginRegistry;
import io.flutter.plugins.firebase.auth.FlutterFirebaseAuthPlugin;
import me.amryousef.apple.auth.firebase_auth_oauth.FirebaseAuthOAuthPlugin;
import io.flutter.plugins.firebase.core.FlutterFirebaseCorePlugin;
import io.flutter.plugins.googlesignin.GoogleSignInPlugin;
import io.flutter.plugins.pathprovider.PathProviderPlugin;

/**
 * Generated file. Do not edit.
 */
public final class GeneratedPluginRegistrant {
  public static void registerWith(PluginRegistry registry) {
    if (alreadyRegisteredWith(registry)) {
      return;
    }
    FlutterFirebaseAuthPlugin.registerWith(registry.registrarFor("io.flutter.plugins.firebase.auth.FlutterFirebaseAuthPlugin"));
    FirebaseAuthOAuthPlugin.registerWith(registry.registrarFor("me.amryousef.apple.auth.firebase_auth_oauth.FirebaseAuthOAuthPlugin"));
    FlutterFirebaseCorePlugin.registerWith(registry.registrarFor("io.flutter.plugins.firebase.core.FlutterFirebaseCorePlugin"));
    GoogleSignInPlugin.registerWith(registry.registrarFor("io.flutter.plugins.googlesignin.GoogleSignInPlugin"));
    PathProviderPlugin.registerWith(registry.registrarFor("io.flutter.plugins.pathprovider.PathProviderPlugin"));
  }

  private static boolean alreadyRegisteredWith(PluginRegistry registry) {
    final String key = GeneratedPluginRegistrant.class.getCanonicalName();
    if (registry.hasPlugin(key)) {
      return true;
    }
    registry.registrarFor(key);
    return false;
  }
}
