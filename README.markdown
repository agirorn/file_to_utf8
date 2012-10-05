
File To UTF-8
=============

From time to time you mite get a CSV/TEXT file from someone that you have
to work with in your ruby project and when you start to work withe it you
notice you notice that it you are just getting some garbage out.
And then you remember thatguy is using Windows and his PC is configured for
Icelandic so all hist text files as ISO-8859-15 og ISO-8859-1 hum or was it CP850.

That is where file_to_utf8 comes to the rescue. It helps you find out what
encoding can be used to open the file and to convert it to UTF-8.


Detect Encoding
---------------
To detect what encoding can be used to open the file run this command.

    file_to_utf8 -d badly_encoded_file.txt

It retuns a list of encodings like this:

    UTF-8
    ISO-8859-1
    ISO-8859-10
    ISO-8859-15
    KOI8-R
    KOI8-U
    Windows-1251
    CP850
    IBM860
    macCroatian
    macGreek

Converting a file to UTF-8
----------------------------
To convert the file from ISO-8859-15 to UTF-8 just run this command

    file_to_utf8 badly_encoded_file.txt utf-8_encodec_file.txt ISO-8859-15


