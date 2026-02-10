pluginManagement {
    fun findFlutterFromPath(): String? {
        val isWindows = System.getProperty("os.name").lowercase().contains("win")
        val executableNames = if (isWindows) listOf("flutter.bat", "flutter.cmd", "flutter") else listOf("flutter")
        val pathEntries = (System.getenv("PATH") ?: "").split(java.io.File.pathSeparator)

        for (entry in pathEntries) {
            for (name in executableNames) {
                val flutterExecutable = java.io.File(entry, name)
                if (flutterExecutable.exists() && flutterExecutable.canExecute()) {
                    return flutterExecutable.parentFile?.parent
                }
            }
        }
        return null
    }

    val flutterSdkPath =
        run {
            val properties = java.util.Properties()
            val localProperties = file("local.properties")
            if (localProperties.exists()) {
                localProperties.inputStream().use { properties.load(it) }
            }

            val flutterSdkPath =
                properties.getProperty("flutter.sdk")
                    ?: System.getenv("FLUTTER_ROOT")
                    ?: System.getenv("FLUTTER_HOME")
                    ?: findFlutterFromPath()

            require(flutterSdkPath != null) {
                "Flutter SDK not found. Set flutter.sdk in android/local.properties, set FLUTTER_ROOT/FLUTTER_HOME, or ensure flutter is available on PATH."
            }

            val flutterGradlePath = java.io.File(flutterSdkPath, "packages/flutter_tools/gradle")
            require(flutterGradlePath.exists()) {
                "Flutter SDK path is invalid: $flutterSdkPath (missing packages/flutter_tools/gradle)."
            }

            flutterSdkPath
        }

    includeBuild("$flutterSdkPath/packages/flutter_tools/gradle")

    repositories {
        google()
        mavenCentral()
        gradlePluginPortal()
    }
}

plugins {
    id("dev.flutter.flutter-plugin-loader") version "1.0.0"
    id("com.android.application") version "8.11.1" apply false
    id("org.jetbrains.kotlin.android") version "2.2.20" apply false
}

include(":app")
