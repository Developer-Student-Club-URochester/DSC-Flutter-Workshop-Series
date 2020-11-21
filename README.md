# DSC-Flutter-Workshop-Series

Project code for each workshop are handled in different branches. To see other projects for each workshop, move to a different branch.
![top](https://raw.githubusercontent.com/Developer-Student-Club-URochester/DSC-Flutter-Workshop-Series/main/install-guide-images/gitbranch-1.png)
![expand](https://raw.githubusercontent.com/Developer-Student-Club-URochester/DSC-Flutter-Workshop-Series/main/install-guide-images/gitbranch-2.png)


## **<span style="text-decoration:underline;">Flutter Installation Guide</span>**

[Installation Guide](https://docs.google.com/document/d/12AzryX11YazzTNcqQe6Dk4pxRP7GqzPINY_4wUU1fIY/edit?usp=sharing)

# Table of Contents
* [Windows](#windows)
  * [Pre-req requirement](#pre-req-requirement)
  * [Download Flutter](#download-flutter)
  * [Download Android Studio](#download-android-studio)
  * [Accept Agreement](#accept-agreement)
  * [Start a new Flutter project](#start-a-new-flutter-project)
  * [Get Emulator](#get-emulator)
  
* [MacOS](#macos)
  * [Step1: Go to macOS install](#step-1-go-to-macos-install)
  * [Step 2: System requirements](#step-2-system-requirements)
    * [System Requirements](#system-requirements)
    * [Homebrew Requirements](#homebrew-requirements)
  * [Step 3: Get the Flutter SDK](#step-3-get-the-flutter-sdk)
    * [Update your path](#update-your-path)
  * [Step 4: Run Flutter Doctor](#step-4-run-flutter-doctor)
  
* [Set Up An Editor](#set-up-an-editor)
  * [Android Studio](#android-studio)
    * [Install Android Studio if you haven’t already](#1-install-android-studio-if-you-havent-already-install)
    * [Install the Flutter and Dart plugins](#2-install-the-flutter-and-dart-plugins)
  * [Visual Studio Code](#visual-studio-code)
    * [Install VS Code](#1-install-vs-code)
    * [Install the Flutter and Dart plugins](#2-install-the-flutter-and-dart-plugins)
    
* [Platform setup](#platform-setup)
  * [iOS setup](#ios-setup)
    * [Set up the iOS simulator](#set-up-the-ios-simulator)
    * [Deploy to iOS devices](#deploy-to-ios-devices)
  * [Android setup](#android-setup)
    * [Install Android Studio](#install-android-studio)
    * [Set up the Android emulator](#set-up-the-android-emulator)
    
* [Create and run a simple Flutter app](#create-and-run-a-simple-flutter-app)
  * [From Command Line](#from-command-line)
  * [From Visual Studio Code](#from-vscode)
  * [From Android Studio](#from-android-studio)


# **Windows:**


### **Pre-req requirement:**

**Step1:** Start with this link: [Flutter Installation](https://flutter.dev/docs/get-started/install)

**Step 2:** Click on Windows and you will see system requirements, more tools to install, get the Flutter SDK, updating paths, etc. However, we will show you step by step. 

**Step 3:** Check for System requirements. Especially the **Operating System** and **Disk Space.** It won’t be a problem since most of the newer computers easily meet the requirements. 

**Step 4:** Check if you already have the required tools: 

![required tools](https://raw.githubusercontent.com/Developer-Student-Club-URochester/DSC-Flutter-Workshop-Series/main/install-guide-images/windows-1.png)

Note: As it says if you already have Windows 10 then PowerShell 5.0 or above should be installed already. If not you can click this [link](https://docs.microsoft.com/en-us/powershell/scripting/install/installing-powershell-core-on-windows?view=powershell-7.1) and easily follow the steps. 

**Step 5:** If you don’t have Git for Windows 2.x installed, so follow this [link](https://git-scm.com/download/win). After downloading Git, open it, and follow the steps. 

Note: I recommend to follow the default settings unless you know what you are going for. So keep pressing next and finally install. (Sometimes there is no install button and keep installing after last next). 

Yay! We can finally start with Flutter now. (If you already have Git and Powershell start following from here) 


### **Download Flutter:**

**Step 6:** To download flutter SDK, just click on the blue button at this [link](https://flutter.dev/docs/get-started/install/windows). 

![flutter download](https://raw.githubusercontent.com/Developer-Student-Club-URochester/DSC-Flutter-Workshop-Series/main/install-guide-images/windows-2.png)


**Step 7:** We have to extract the file 

![extract flutter](https://raw.githubusercontent.com/Developer-Student-Club-URochester/DSC-Flutter-Workshop-Series/main/install-guide-images/windows-3.png)

Note: **When you are extracting make sure you choose:** C:\flutter\



![choose C:\\flutter\\](https://raw.githubusercontent.com/Developer-Student-Club-URochester/DSC-Flutter-Workshop-Series/main/install-guide-images/windows-4.png)



You should be able to see the flutter folder in your C drive. 

**Step 8:** Please follow these instructions very carefully. Go to your flutter folder in C. Then, select the bin folder. You should see this. Click on where I circled with a red pen. 

![select bin](https://raw.githubusercontent.com/Developer-Student-Club-URochester/DSC-Flutter-Workshop-Series/main/install-guide-images/windows-5.png)



**Step 9:** After clicking you should have something like this. C:\flutter\flutter\bin (It may not be exactly like this). 

**Step 10:** Go to your computer search bar and type “environment”. You should be able to find the “Edit the System environment variable”

![Edit the System environment variable](https://raw.githubusercontent.com/Developer-Student-Club-URochester/DSC-Flutter-Workshop-Series/main/install-guide-images/windows-6.png)



**Step 11:** After opening it. Click on the Environment Variables... 

![Click on the Environment Variables](https://raw.githubusercontent.com/Developer-Student-Club-URochester/DSC-Flutter-Workshop-Series/main/install-guide-images/windows-7.png)


**Step11:** Double click on path

![Double click on path](https://raw.githubusercontent.com/Developer-Student-Club-URochester/DSC-Flutter-Workshop-Series/main/install-guide-images/windows-8.png)


**You should see this page:**

![You should see this page](https://raw.githubusercontent.com/Developer-Student-Club-URochester/DSC-Flutter-Workshop-Series/main/install-guide-images/windows-9.png)



**Click new and then add.**

**Step 12:** In the text option paste whatever you copied in **step 8.** Mine was C:\flutter\flutter\bin. (Could be a little bit different for you. Maybe just C:\flutter\bin)

**Step 13:** Keep pressing ok after done pasting to save it. 

![Keep pressing ok after done pasting to save it.](https://raw.githubusercontent.com/Developer-Student-Club-URochester/DSC-Flutter-Workshop-Series/main/install-guide-images/windows-10.png)


**Step 14:** Go to the **command prompt** or **Power shell**. Type flutter doctor. It may load for a minute or 2. You should see the check green sign to see if it was added to our environment variable. 

![flutter doctor 1](https://raw.githubusercontent.com/Developer-Student-Club-URochester/DSC-Flutter-Workshop-Series/main/install-guide-images/windows-11.png)



### **Download android studio:**

**Step 15:** You won’t be able to set up the ios environment, because you need Mac. So, we will just set up an android environment. For this, we need to download the android studio. Follow this link: [Android Studio](https://developer.android.com/studio)**. **

Select the term and condition and download it. 

**Step 16:** Click on the downloaded folder and you should be able to see this: Keep clicking next, next, I agree and keep clicking next, until you see the install. After installation is complete, click finish. 

![android terms and conditions](https://raw.githubusercontent.com/Developer-Student-Club-URochester/DSC-Flutter-Workshop-Series/main/install-guide-images/windows-12.png)



I recommend selecting “do not import any settings”.  

You should be on this page when it opens, automatically. 

![You should be on this page when it opens, automatically.](https://raw.githubusercontent.com/Developer-Student-Club-URochester/DSC-Flutter-Workshop-Series/main/install-guide-images/windows-13.png)


Keep clicking next. Choose your preferred UI. I personally like dark mode better. 

Lastly, you will be in this page: 

![Lastly, you will be in this page](https://raw.githubusercontent.com/Developer-Student-Club-URochester/DSC-Flutter-Workshop-Series/main/install-guide-images/windows-14.png)
 

Make sure you click finish and it will download all those SDK components. It should open your android studio. 

![It should open your android studio](https://raw.githubusercontent.com/Developer-Student-Club-URochester/DSC-Flutter-Workshop-Series/main/install-guide-images/windows-15.png)


Note: If it doesn’t auto open, go to your computer search bar at the bottom right and search for an android studio to open. It should look like the above screenshot. 

**Step 17:** We have to install flutter plugins and dart plugins in our android studio. So, click on the configures  -> plugins , where I circled it red. 

![configures -> plugins](https://raw.githubusercontent.com/Developer-Student-Club-URochester/DSC-Flutter-Workshop-Series/main/install-guide-images/windows-16.png)


**Step 18:** After clicking on plugins you should see that you are in a marketplace. 

![marketplace](https://raw.githubusercontent.com/Developer-Student-Club-URochester/DSC-Flutter-Workshop-Series/main/install-guide-images/windows-17.png)


Search for flutter (as it showed) and isntall. 

Search for dart and install. 

**Step 19:** Make sure you select restart IDE. 

![restart IDE](https://raw.githubusercontent.com/Developer-Student-Club-URochester/DSC-Flutter-Workshop-Series/main/install-guide-images/windows-18.png)



Note: You should be able to see this change. “Start a new Flutter Project”

![Start a new Flutter Project](https://raw.githubusercontent.com/Developer-Student-Club-URochester/DSC-Flutter-Workshop-Series/main/install-guide-images/windows-19.png)



**Step 20:** Go to Command Prompt or power shell and type flutter doctor again to check if our android studio is working. If you see a green check, we have installed the plugins properly and ready to roll. 

![flutter doctor 2](https://raw.githubusercontent.com/Developer-Student-Club-URochester/DSC-Flutter-Workshop-Series/main/install-guide-images/windows-20.png)


Note: Do not worry about the VS Code since we have installed Android Studio. 


### **Accept Agreement:**

**Step 21:** If you look at the 2nd checkpoint, it has a [ ! ], so we have to accept the android studio. Copy where I boxed it with a red and paste into the red-underlined portion. 

![accept flutter android sdk agreements](https://raw.githubusercontent.com/Developer-Student-Club-URochester/DSC-Flutter-Workshop-Series/main/install-guide-images/windows-21.png)



**Step 22:** Keep pressing “y” to accept the agreement. 

**Step 23:** Run “flutter doctor” one more time to make sure you have successfully accepted the agreement. If everything went well, you should see a green check sign, in all first 3 checkpoints. 

![first 3 checkpoints](https://raw.githubusercontent.com/Developer-Student-Club-URochester/DSC-Flutter-Workshop-Series/main/install-guide-images/windows-22.png)


**We are almost done!!**


### **Start a new Flutter project**

**Step 24:** Go back to Android Studio and select start a new flutter project. 

![new flutter project](https://raw.githubusercontent.com/Developer-Student-Club-URochester/DSC-Flutter-Workshop-Series/main/install-guide-images/windows-23.png)



**Step 25:** Select flutter application. 

*   **Project name: **You can put any name you want. 
*   **Flutter SDK path: **You can create any folder and choose that path or just choose C:\src\flutter
*   **Company Domain name: **Doesn’t really matter what you put. 
*   **Click Finish**

### **Get Emulator:**

**Step 26:** If you look at the top in the device section, it will say no device because we haven’t downloaded it yet. 

![device section](https://raw.githubusercontent.com/Developer-Student-Club-URochester/DSC-Flutter-Workshop-Series/main/install-guide-images/windows-24.png)



**Step 27:** Click on “Tools” on the options menu. Select AVD Manager. New window will pop up and select create virtual devices. You can select any phone device.

![tools](https://raw.githubusercontent.com/Developer-Student-Club-URochester/DSC-Flutter-Workshop-Series/main/install-guide-images/windows-25.png)

 

**Step 28:** After choosing the device. Click **next**. You should be in this page or something similar to this. 

![choose device](https://raw.githubusercontent.com/Developer-Student-Club-URochester/DSC-Flutter-Workshop-Series/main/install-guide-images/windows-26.png)



I don’t think it matters which one you choose. I chose the first one and clicked download. 

Downloading it may take awhile. After download is complete, press finish. 

**Step 29:** Go to tools again. Select AVD manager. You will see your new Android virtual device. Click run button 

![avd manager](https://raw.githubusercontent.com/Developer-Student-Club-URochester/DSC-Flutter-Workshop-Series/main/install-guide-images/windows-27.png)



Note: It may run properly or could ask you to download some more stuff. Follow the instructions and download it. I recommend staying with the default settings. 

**Step 30:** After downloading additional files. Press the run button again. You should be able to see the emulator, which is a phone bar. 

**Yes, we have everything we need. **

**Step 31:** Lastly, go back to your android studio. You will in the device section, you have the name of the device that’s connected. 

![device section connected](https://raw.githubusercontent.com/Developer-Student-Club-URochester/DSC-Flutter-Workshop-Series/main/install-guide-images/windows-28.png)


Click the green run button to see what’s the code in main.dart folder returns. You should see the default app. 

![green run button](https://raw.githubusercontent.com/Developer-Student-Club-URochester/DSC-Flutter-Workshop-Series/main/install-guide-images/windows-29.png)


**Important:** Emulator and Android studio are really heavy applications. Make sure everything else is not in use. If it still doesn’t work. You have the option to connect your android phone only. 

I personally have an iphone so I am sharing a good youtube tutorial that shows how to connect your android device to your android studio. Click this [link](https://www.youtube.com/watch?v=p2oHD-06YcM). 

**Hope you enjoyed and everything works well.** 

<br></br>
<br></br>
<br></br>

# **MacOS:**


### **Step 1:** Go to [macOS install](https://flutter.dev/docs/get-started/install/macos) 


### **Step 2:** System requirements


#### **System Requirements:**



*   Operating Systems: macOS (64-bit)
*   Disk Space: 2.8 GB (does not include disk space for IDE/tools).
*   Tools: Flutter depends on these command-line tools being available in your environment.
*   bash
*   curl
*   git 2.x
*   mkdir
*   rm
*   unzip
*   which

To make sure everything is installed correctly, I suggest first installing [homebrew](https://brew.sh/) for macOS. Homebrew installs the stuff you need that Apple (or your Linux system) didn’t.


#### 	**Homebrew Requirements:**



*   A 64-bit Intel CPU*
*   macOS High Sierra (10.13) (or higher)*
*   Command Line Tools (CLT) for Xcode: xcode-select --install, developer.apple.com/downloads or Xcode 
    *   I would suggest also downloading Xcode as this also allows you to install iOS Simulators easily.
*   A Bourne-compatible shell for installation (e.g. bash or zsh)*

    *See [https://docs.brew.sh/Installation](https://docs.brew.sh/Installation) if you don’t meet all of the homebrew requirements


    Run 


    ```/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"``` 


    in the terminal. This command executes the installer script provided by the Homebrew team.


    Now, installing additional packages is very easy. If you don’t already have git, run ```brew install git``` in the terminal.


    The other requirements should already be pre-installed on macOS.



### 


### **Step 3:** Get the Flutter SDK

Download the latest Flutter SDK from the [macOS install](https://flutter.dev/docs/get-started/install/macos). As of November 15, 2020, the version is 1.22.4 and the file is called flutter_macos_1.22.4-stable.zip.

Unzip the zip archive in a desired location. For example: 

```
cd ~/development
unzip ~/Downloads/flutter_macos_1.22.4-stable.zip
```

Then, add the flutter tool to your path with:

```
export PATH="$PATH:`pwd`/flutter/bin"
```

This will set the PATH variable for the _current _terminal window only. You will then also probably want to permanently add Flutter to your path.


#### [Update your path](https://flutter.dev/docs/get-started/install/macos#update-your-path)

Updating your path permanently is machine specific, see [Update your path](https://flutter.dev/docs/get-started/install/macos#update-your-path) for more details.

In general:



1. Determine the directory where you placed the Flutter SDK. You need this in Step 3.
2.  Determine which shell you are using and which &lt;rc file> to edit. Typing ```echo $SHELL``` in your Terminal tells you which shell you’re using.
    *   If you’re using Bash, edit $HOME/.bash_profile or $HOME/.bashrc.
    *   If you’re using Z shell, edit $HOME/.zshrc.
    *   If you’re using a different shell, the file path and filename will be different on your machine.
3. Add the following line to be the path where you cloned Flutter’s git repo:

```export PATH="$PATH:[PATH_TO_FLUTTER_GIT_DIRECTORY]/flutter/bin"```



4. Run source $HOME/.&lt;rc file> to refresh the current window, or open a new terminal window to automatically source the file.
5. Verify that the flutter/bin directory is now in your PATH by running:

```echo $PATH```

6. Verify that the flutter command is available by running:

```which flutter```



### **Step 4:** Run Flutter Doctor

```flutter doctor```


This command checks your environment and displays a report to the terminal window. The Dart SDK is bundled with Flutter; it is not necessary to install Dart separately. Check the output carefully for other software you might need to install or further tasks to perform (shown in bold text).

<br></br>
<br></br>
<br></br>
# [Set Up An Editor](https://flutter.dev/docs/get-started/editor?tab=androidstudio)


### [Android Studio](https://flutter.dev/docs/get-started/editor?tab=androidstudio)

See steps 
[Download Android Studio](#download-android-studio) 
in Windows Installation for more details. The process should be extremely similar. 



#### 1. Install Android Studio if you haven’t already: [Install](https://developer.android.com/studio).
    *   Alternatively, you can use IntelliJ:
        *   [IntelliJ](https://www.jetbrains.com/idea/download/#section=mac), version 2017.1 or later
#### 2. Install the Flutter and Dart plugins
    *   Start Android Studio.
    *   Open plugin preferences (**Configure > Plugins **as of v3.6.3.0 or later).
        *   Note: must close any open projects first
    *   Select the Flutter plugin and click **Install**.
    *   Click **Yes** when prompted to install the Dart plugin.
    *   Click **Restart** when prompted.


### [Visual Studio Code](https://flutter.dev/docs/get-started/editor?tab=vscode)



#### 1. Install VS Code

VS Code is a lightweight editor with Flutter app execution and debug support.

[VS Code](https://code.visualstudio.com/), latest stable version



#### 2. Install the Flutter and Dart plugins
1. Start VS Code.
2. Invoke **View > Command Palette**…
    *   [Shortcuts: Cmd + Shift + P (mac) or Ctrl + Shift + P (Windows, linux, chromebook)]
    *   Alternatively: There should be a tab on the sidebar to navigate to the Extension marketplace. Skip to Step d.

![vscode extension marketplace](https://raw.githubusercontent.com/Developer-Student-Club-URochester/DSC-Flutter-Workshop-Series/main/install-guide-images/macOS-1.png)



3. Type “install”, and select **Extensions: Install Extensions**.
4. Type “flutter” in the extensions search field, select **Flutter** in the list, and click **Install**. This also installs the required Dart plugin.
5. Verify setup with Flutter Doctor
    *   Invoke **View > Command Palette**… [Cmd + Shift + P (mac) or Ctrl + Shift + P (Windows)]
    *   Type “doctor”, and select the **Flutter: Run Flutter Doctor**.
    *   Review the output in the **OUTPUT** pane for any issues. Make sure to select Flutter from the dropdown in the different Output Options.


###

<br></br>
<br></br>
<br></br>
# **Platform setup**

(see [Platform setup](https://flutter.dev/docs/get-started/install/macos#platform-setup) for more details)


    macOS supports developing Flutter apps in iOS, Android, and the web (technical preview release). Complete at least one of the platform setup steps now, to be able to build and run your first Flutter app.


### [iOS setup](https://flutter.dev/docs/get-started/install/macos#ios-setup)

(NOTE: You cannot use Xcode as an editor. You must either use Android Studio / IntelliJ or Visual Studio Code. I personally use VSCode for Flutter, however, you must download Android Studio to set up Android Environments and SDK’s).

To develop Flutter apps for iOS, you need a Mac with Xcode installed.



1. Install the latest stable version of Xcode (using web download or the Mac App Store). You probably should have downloaded Xcode already to install homebrew.
2. Configure the Xcode command-line tools to use the newly-installed version of Xcode by running the following from the command line:

```
sudo xcode-select --switch /Applications/Xcode.app/Contents/Developer
sudo xcodebuild -runFirstLaunch
```

This is the correct path for most cases, when you want to use the latest version of Xcode. If you need to use a different version, specify that path instead.



3. Make sure the Xcode license agreement is signed by either opening Xcode once and confirming or running ```sudo xcodebuild -license``` from the command line.

Versions older than the latest stable version may still work, but are not recommended for Flutter development. Using old versions of Xcode to target bitcode is not supported, and is likely not to work.

With Xcode, you’ll be able to run Flutter apps on an iOS device or on the simulator.


#### Set up the iOS simulator



1. On your Mac, find the Simulator via Spotlight or by using the following command:

```open -a Simulator```



2. Make sure your simulator is using a 64-bit device (iPhone 5s or later) by checking the settings in the simulator’s Hardware > Device menu.
3. Depending on your development machine’s screen size, simulated high-screen-density iOS devices might overflow your screen. Grab the corner of the simulator and drag it to change the scale. You can also use the Window > Physical Size or Window > Pixel Accurate options if your computer’s resolution is high enough.
    *   If you are using a version of Xcode older than 9.1, you should instead set the device scale in the Window > Scale menu.


#### Deploy to iOS devices

(NOTE: This is only needed right now to show you how to Deploy to a physical iOS device. It is probably best to revisit this and Deploy to iOS devices after setting up an editor.)

See [Deploy to iOS devices](https://flutter.dev/docs/get-started/install/macos#deploy-to-ios-devices) for more details




### [Android setup](https://flutter.dev/docs/get-started/install/macos#android-setup) 


#### Install Android Studio



1. Download and install [Android Studio](https://developer.android.com/studio) if you haven’t already.
2. Start Android Studio, and go through the ‘Android Studio Setup Wizard’. This installs the latest Android SDK, Android SDK Command-line Tools, and Android SDK Build-Tools, which are required by Flutter when developing for Android.


#### Set up the Android emulator

For more information: see [Set up the Android emulator](https://flutter.dev/docs/get-started/install/macos#set-up-the-android-emulator). 

Also see [Get Emulator](#get-emulator)


1. Enable [VM acceleration](https://developer.android.com/studio/run/emulator-acceleration) on your machine. 
2. Launch **Android Studio**, click the** AVD Manager** icon, and select **Create Virtual Device**…
    *   In older versions of Android Studio, you should instead launch **Android Studio** > **Tools** > **Android** > **AVD Manager** and select **Create Virtual Device**…. (The **Android** submenu is only present when inside an Android project.)
    *   If you do not have a project open, you can choose **Configure > AVD Manager** and select **Create Virtual Device**…
3. Choose a device definition and select **Next**.
4. Select one or more system images for the Android versions you want to emulate, and select **Next**. An _x86 or x86_64_ image is recommended.
5. Under Emulated Performance, select **Hardware - GLES 2.0 **to enable [hardware acceleration](https://developer.android.com/studio/run/emulator-acceleration).
6. Verify the AVD configuration is correct, and select **Finish**.
7. In Android Virtual Device Manager, click **Run** in the toolbar. The emulator starts up and displays the default canvas for your selected OS version and device.
8. Verify the virtual device is correctly available to flutter by running: 

```flutter doctor```

    [✓] Flutter (Channel stable, 1.22.3, on Mac OS X 10.15.7 19H2, locale en-US)
    
    [✓] Android toolchain - develop for Android devices (Android SDK version 30.0.2)
    [✓] Xcode - develop for iOS and macOS (Xcode 11.5)
    [!] Android Studio (version 4.1)
    **    ✗ Flutter plugin not installed; this adds Flutter specific functionality.**
    **    ✗ Dart plugin not installed; this adds Dart specific functionality.**
    [✓] VS Code (version 1.51.0)
    [✓] Connected device (2 available)

(I have both an iOS simulator and Android Virtual Device open)

<br></br>
<br></br>
<br></br>
# Create and run a simple Flutter app

See [Create and run a simple Flutter app](https://flutter.dev/docs/get-started/install/macos#create-and-run-a-simple-flutter-app) for more details

### From Command Line

1. Create a new Flutter app by running the following from the command line:

```flutter create my_app```

2. A my_app directory is created, containing Flutter’s starter app. Enter this directory:

```cd my_app```

3. To launch the app in the Simulator, ensure that the Simulator is running and enter:

```flutter run```

* To hot-reload: enter ```r```
* To hot-reset: enter ```R```

### From VSCode

1. **View > Command Palette** [Cmd + Shift + P (mac) or Ctrl + Shift + P (windows)]

2. Type "flutter" and select **Flutter: New Project**

3. Enter a project name and select a folder to create the project in. (this will basically run steps 1 and 2 from the command line and open it in VSCode).

4. To launch the app in a Emulator:
    *   Make sure VSCode detects an emulator. It will say which emulator is currently connected at the bottom of the IDE:
    
    ![Bottom of IDE](https://raw.githubusercontent.com/Developer-Student-Club-URochester/DSC-Flutter-Workshop-Series/main/install-guide-images/create-run-1.png)
    
    *   Navigate and open "main.dart". At the top of the file above ```void main(){``` should be two links to ```Run | Debug```. Click either one to run/debug on the emulator.
    
    ![Run Debug](https://raw.githubusercontent.com/Developer-Student-Club-URochester/DSC-Flutter-Workshop-Series/main/install-guide-images/create-run-2.png)
    
    at the top of VSCode will be a toolbar of options.
    
    ![Toolbar](https://raw.githubusercontent.com/Developer-Student-Club-URochester/DSC-Flutter-Workshop-Series/main/install-guide-images/create-run-3.png)
    
    *    To hot-reload: Yellow lightning is hot-reload. [cmd + f5 (mac) or crtl + f5 (windows)]
    *    To hot-reset: Green reset button is for hot-reset [SHIFT + cmd + f5 (mac) or SHIFT + crtl + f5 (windows)]
    *   Alternatively, use the built-terminal (crtl + \` or **Terminal > New Terminal**) or an external terminal (from command line) and type:
    
    ```flutter run```
    
      *   To hot-reload: enter ```r```
      *   To hot-reset: enter ```R```
    


### From Android Studio

1. Create New Flutter Project
    *   Exit all open Android Studio Projects until you see the "Welcome to Android Studio" screen.
    *   In the middle, you can select **Create New Flutter Project**
    
    or
    
    *   If you already have another project open, you can select **File > New > New Flutter Project...**

2. Follow prompts to create a new flutter project.

3. To launch the app in a Emulator:
    (see [Get Emulator](#get-emulator))
    *   At the top, it should show a connected device and a big green run button. If an emulator is set up correctly (works with iOS emulator), then you can run the file.
    
    ![Android Top Bar](https://raw.githubusercontent.com/Developer-Student-Club-URochester/DSC-Flutter-Workshop-Series/main/install-guide-images/create-run-4.png)
    
    at the bottom of Android Studio will be an open "Run" window. If this window is not open, navigate to the bottom to open it.
    
    ![Android Run Console](https://raw.githubusercontent.com/Developer-Student-Club-URochester/DSC-Flutter-Workshop-Series/main/install-guide-images/create-run-5.png)
    
    *    To hot-reload: Yellow lightning is hot-reload. [cmd + \ (mac) or crtl + \ (windows)]
    *    To hot-reset: Green reset button is for hot-reset [SHIFT + cmd + \ (mac) or SHIFT + crtl + \ (windows)]
