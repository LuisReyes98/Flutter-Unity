# Flutter with Unity Game

Drawer Navigation added for easy test



## How to use Unity and Flutter for Android Together

(Unity to Android by David Beloosesky)[https://medium.com/@davidbeloosesky/embedded-unity-within-android-app-7061f4f473a] 

- 1 Create a Unity Project

- 2 (Optional) Support Android Back Button

Add an object, and attach the next script to it. In unity the back android button is not supported by default. So we add a script for it.

```
public class SupportBackScript : MonoBehaviour {
 void FixedUpdate(){
  if (Application.platform == RuntimePlatform.Android)
  {
   if (Input.GetKey(KeyCode.Escape))
   {
    Application.Quit();
   }
  }
 }
}
```

- 3  Export your Project

    File → Build Settings

    Select your scene

    In platform section select Android

    Change Texture to ETC2

    Change Build System to Gradle

    Compress With Lz4 (Only for Development, heavier file but faster compilation )

    Click on player setting button → In Inspector tab → other setting add your package name 
    
    Mark Export and export


- 4 : Import this project to Android Studio
File → New → Import project → Select your export folder from step 3.
If Android Studio is asking about change the project to gradle select yes.    

- 5 : Convert this project to a Library project
Open the manifest and remove/comment out the intent code, we don’t want this application to act like an app, just as library.
```
<!--<intent-filter>-->
  <!--<action android:name="android.intent.action.MAIN" />-->
  <!--<category android:name="android.intent.category.LAUNCHER"/>-->
  <!--<category android:name="android.intent.category.LEANBACK_LAUNCHER" />-->
<!--</intent-filter>-->
```
Open the module gradle file ```build.gradle``` , locate next line:

```apply plugin: 'com.android.application'```
And change to:

```apply plugin: 'com.android.library'```
you can also put it in the beging of the file for better organization

Note:
  If you get the error message ``` Bundle() not found ``` or similar find this section and comment it:
```
  /*bundle {
        language {
            enableSplit = false
        }
        density {
            enableSplit = false
        }
        abi {
            enableSplit = true
        }
    }*/
```

Save the file and click File > Sync Project with Gradle Files.
That's it. The entire structure of the module remains the same, but it now operates as an Android library and the build will now create an AAR file instead of an APK.


When you want to build the AAR file, select the library module in the Project window and then click Build > Build APK.

or the hammer button with the tool tip "Make Project"


