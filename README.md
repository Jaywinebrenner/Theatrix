# The Path RPG

## By **Jay Winebrenner and Jaime Gensler**

### Description

A Ruby-Rails based Web app

### Setup/Installation Requirements

![enter image description here](https://i.imgur.com/KW12jKc.jpg "read")

## Opening the App
 1. Click the link shown in the above photo and download the file.
 2. Unzip the file and navigate to the folder via your terminal or command line application.
 3. Type $ // Bundle // to install all the gems used in the project.
 4. Type $ // rake db:create // to create a database, followed by // rake db:migrate // to migrate the database.
 4. Type $ // rails s  // to start the server, which will be available on your computer at localhost:3000.
 5. For purposes of these instructions, anything inside of // is what is to be typed in the terminal. If the instruction says // hello // for example, you'd type just the word hello in the terminal.

## Assigning Admin privileges
1. Go to the web app in your browser found at localhost:3000 after following the above 5 steps.
2. Click Sign Up at the top nav bar to make an account. Enter email and password / password confirmation.
3. Now we will make this account have admin privileges by first typing // rails c // into the terminal to open the rails console.
4. Type // @user = User.first // to target your newly made account.
5. Type // @user.admin = true // to turn on your admin status.
6. Type // @user.save // to save your new admin status.
7. Your account will now have admin privileges - including adding, editing and deleting products and editing, updating, and deleting reviews.

### Technologies Used

 - Ruby
 - Rails
 - CSS
 - Bootstrap

### Support and Contact

If you have any questions about anything at all, please don't hesitate to get in touch. jaywinebrenner@gmail.com


### License

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

Copyright (c) 2019 **Jay Winebrenner**
