# Online-Proctoring-System


Online Courses greatly expand the reach of todays educational institutions, both by provid-
ing a wider range of educational resources to enrolled students and by making educational
resources available to persons who cannot access a campus due to location or schedule con-
straints.  Exams are a critical component of any educational program, and online educational
programs are no exception.  In any exam, there is a possibility of cheating, and therefore its
detection and prevention is important.
According to a survey about 29% of the students admitted cheating.  When exams are
administered in a conventional and proctored classroom environment, the students are mon-
itored  by  a  human  proctor  throughout  the  exam.   The  overall  goal  of  this  system  is  to
maintain academic integrity of exams, by providing real-time proctoring to detect the ma-
jority of cheating behaviors of the test taker.  To achieve such goals, audio-visual observations
about the test takers are required to be able to detect any cheat behavior.
Our  system  monitors  some  signs  in  the  room  where  the  test  taker  resides,  using  two
cameras  and  a  microphone.   The  first  camera  is  the  webcam  of  laptop  itself.   The  other
camera can be a smartphone camera.  The microphone is the built in microphone of laptop,
So no extra hardware is required on behalf of student to give the exam.  Using such sensors,
we propose to detect the following cheat behaviors:
* cheat from text books/notes/papers,
* using a phone to call a friend,
* asking a friend in the test room, and
* having another person take the exam other than the test take


This project has the following features:
* Proposes an automated online exam proctoring system with visual and audio sensors
for the purpose of detecting cheating.
* Collects a multimedia dataset of images of student from both the cameras during exams
and also the dataset of anomalous behaviours of student.

# Insights

The functioning of each module in the project is as follows:

## Camera 1:

Camera 1 is the web-cam of the laptop itself.  It clicks the photo of the student after some
fixed interval of time, decided by admin. The photo clicked by this camera is sent to Microsoft
Face API as well as to the main server and a response from Microsoft API is received.  The
response contains the coordinates of a rectangle bounding the face and coordinates of pupil
and nose.  This response is checked against some predefined bounds and estimated result is
send to local server.

## Camera 2:

Camera  2  is  the  Mobile  camera.   This  works  through  an  Android  App.   The  student  is
required to download an app for this.  And before starting the exam, student needs to enter
his registration ID in the app and put phone in some place from where his photo can be
clicked.  This camera checks for the open books and mobile usage.  This app clicks the photo
after some regular interval of time and sends it to Microsoft API as well as to the main server
and receives the response.  Again this response is checked against some predefined conditions
and result is send to local server.

## Voice Recognition:

This is done through the microphone of the laptop.  The recorder records sound for every
three seconds and sends it to voice API. This is done through threading.  One thread records
the sound and other thread sends it voice API simultaneously.  Our sound testing module
compares this recorded sound with the previously recorded sounds using Bits In Harmony
voice API. And the result is send to local server.

##  Main Server:

This  is  our  main  web  application  developed  in  java  using  eclipse  IDE.  It  contains  entire
web server, chat server and database server.  Web server contains rich collection of servlets
which are accepting the request and generating the response in the form of jsp page.  Servlet
which are specific to administrator are well separated in packages.  When the user give some
inappropriate input appropriate response is generated using dynamic jsp pages. 

The Database is implemented using MySQL database and Chat-server is implemented
using Web-socket API. Currently no registration module for chat server the Administrator
has  to  send  a  message  ’REGISTER  ME’  on  opening  the  chat  interface  to  register  to  the
Chat server.

## Local Server:

This is basically collection of 3 servers each one accepting data from camera1, camera2 and
voice recognition system.  Local server keeps log of how many times each student has failed
in particular checking module and send the data to the main server as soon as student fails
in a particular checking module.

## Java Web Start:
You must be wondering how Local Server(java program) and Voice recognition(java program)
gets downloaded and run at client side.  This is through ’java web start’.
The Java Web Start software allows you to download and run Java applications from the
web.  The Java Web Start software:
* Provides an easy, one-click activation of applications
* Guarantees that you are always running the latest version of the application
* Eliminates complicated installation or upgrade procedures
