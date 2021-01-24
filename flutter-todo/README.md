# Flutter todo app
Todo application developed in Flutter.
Due to being in the middle of my finals I've had limited time to look into best practices for Flutter, thus I've mostly 
applied some practical things I know from working with ReactNative such as component abstraction. 
This was the first time for me to develop an application in Flutter and i quite enjoyed it!

## Assignment
From the described assignment I've completed all the tasks described. However, there is room for improvement of course.
One of the first things I would improve is the API calls, because right now a GET request for todo items is made every 
time you navigate back to the homepage (not when using the back arrow). 
If you were to use an API that saves and updates data this would actually return an updated list of todos.

## Specifics
I've developed and tested the application in an Android Emulator.  
Parts of the styling of the application can be found in lib > src > styles.dart  
Here I've added common styles and colors to be used throughout the application, an improvement would be to further 
structure down on this and give the colors, textstyles etc their own sub class.

The todos are loaded into a todoList component that loads and maps the todos from an API request into todoItems.
The todoItems consist of an accordion component that has a checkbox for completing the todo instead of an arrow.
tapping the todoItem will expand the task and show its description. Furthermore, holding the todoItem will
take the user to the "todopage" where the task can be updated or deleted. This is the same page that is loaded when 
the user taps the "new todo" button on the homepage, but the difference is the task information being loaded into the
page or not.

The todopage has a custom button bar component at the bottom of the screen which can load 3 different buttons.
The buttons are shown only if a function is passed for the specific button. 
It has the option to load a pre-styled save, edit and delete button. the buttons will automatically use the full 
width available.

Lastly, any errors or problems in API calls are caught but are not handled yet so if an API request fails. It will 
log this in the terminal with the corresponding error message, but it will not show any visual information to the user.

That's it for the assignment! Please do provide me with some feedback as I'm always looking for improvements when
learning a new language and framework.
