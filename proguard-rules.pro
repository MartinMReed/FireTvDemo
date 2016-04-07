#
# Defaults will be pulled in from:
# ${env.ANDROID_HOME}/tools/proguard/proguard-android.txt
#

-dontskipnonpubliclibraryclassmembers

-keepattributes Signature,RuntimeVisibleAnnotations,AnnotationDefault,*Annotation*

# adding this in to preserve line numbers so that the stack traces can be remapped
-keepattributes SourceFile,LineNumberTable

# adding this to destroy the local variable names
-keepattributes !LocalVariableTable,!LocalVariableTypeTable

# adding this to fix gson type error: http://stackoverflow.com/a/17908466/2616171
-keepattributes EnclosingMethod

# workaround for Proguard bug: http://stackoverflow.com/a/9286733/873237
-dontoptimize

#-dontwarn com.google.common.collect.MinMaxPriorityQueue
#-dontwarn com.sun.jdi.**
#-dontwarn javax.annotation.**
#-dontwarn javax.inject.**
#-dontwarn javax.naming.**
#-dontwarn junit.textui.**
#-dontwarn org.slf4j.impl.**
#-dontwarn sun.misc.Unsafe
#-dontwarn com.google.android.gms.**

-keepnames public class * extends android.app.Activity
-keepnames public class * extends android.support.v4.app.Fragment
-keep public class * extends android.app.Application
-keep public class * extends android.app.Service
-keep public class * extends android.app.IntentService
-keep public class * extends android.content.BroadcastReceiver
-keep public class * extends android.content.ContentProvider
-keep public class * extends android.app.backup.BackupAgentHelper
-keep public class * extends android.preference.Preference

# keep all constructors because some may be used through reflection
-keepclassmembers class * {
    public <init>(...);
}

-keepclasseswithmembers class tv.fire.** implements java.io.Serializable { *; }

-assumenosideeffects class android.util.Log {
    public static boolean isLoggable(java.lang.String, int);
    public static int v(...);
    public static int i(...);
    public static int w(...);
    public static int d(...);
    public static int e(...);
}