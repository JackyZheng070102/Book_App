// Top-level build file where you can add configuration options common to all sub-projects/modules.

buildscript {
    ext["kotlin_version"] = "1.7.10" // Use the latest Kotlin version

    repositories {
        google()
        mavenCentral()
    }

    dependencies {
        classpath("com.android.tools.build:gradle:7.0.4")
        classpath("org.jetbrains.kotlin:kotlin-gradle-plugin:${ext["kotlin_version"]}")
        // Google Services plugin
        classpath("com.google.gms:google-services:4.3.10")
    }
}

allprojects {
    repositories {
        google()
        mavenCentral()
    }
}

tasks.register("clean", Delete::class) {
    delete(rootProject.buildDir)
}
