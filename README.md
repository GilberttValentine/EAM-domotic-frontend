# EAM-domotic-frontend

Flutter base project

## Getting Started
On Windows: 
  1. Download flutter SKD at https://docs.flutter.dev/get-started/install
  2. Extract the zip file in the desired installation location for the Flutter (Do not install flutter in directories that requires elevated privileges)
  3. Update path variable:
   - From the Start search bar, enter ‘env’ and select Edit environment variables for your account.
   - Under User variables check if there is an entry called Path:
     - If the entry exists, append the full path to flutter\bin using ; as a separator from existing values.
     - If the entry doesn’t exist, create a new user variable named Path with the full path to flutter\bin as its value.
     ![image](https://user-images.githubusercontent.com/69517323/194771103-6d86023c-232a-4e73-9bad-7378308047ee.png)

  4. From a console that has configured Flutter in the path, run ***flutter doctor***
  ![image](https://user-images.githubusercontent.com/69517323/194771030-cc27bd84-2883-4655-98f1-63e3f88fa65e.png)
  
  5. To solve the flutter doctor errors take a look to the following guide: https://docs.flutter.dev/get-started/install/windows#android-setup
 
If you are going to work with Android Studio you already have all the requirements to run the project but if you are going to work with Visual Studio Code please continue with the following steps:

  6. On visual studio go to the extensions section shearch ***Flutter*** and download the one developed by Dart Code, this Flutter extension adds support for effectively editing, refactoring, running, and reloading Flutter mobile apps. It depends on (and will automatically install) the Dart extension for support for the Dart programming language.
  
  ![image](https://user-images.githubusercontent.com/69517323/194771124-83ea6c34-2be9-4e9b-aeeb-234ae6f517bc.png)

  7. When you already had the project open press ***crtl + shift + p*** and shearch ***Flutter: Select Device***
  ![image](https://user-images.githubusercontent.com/69517323/194771218-675b9b00-fb76-4055-b437-5b08430dfb80.png)
  8. Select an Android device and this will open the Android AVD
  ![image](https://user-images.githubusercontent.com/69517323/194771260-2ea38836-2764-4428-907e-3265b47a96e9.png)
  ![image](https://user-images.githubusercontent.com/69517323/194771274-a41c672a-36d4-45c4-ae99-1307eabff88f.png)
  9. On Visual Studio press ***f5***, this will run the project and after it starts it will open the application on the android AVD.
  ![image](https://user-images.githubusercontent.com/69517323/194771378-6a930a61-8a33-4633-b1af-bf63de2fada8.png)
  ![image](https://user-images.githubusercontent.com/69517323/194771398-f8778857-2ea7-4f73-bcdc-2a2dfad1f898.png)

