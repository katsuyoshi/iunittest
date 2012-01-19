iUnitTest
=
                                   ITO SOFT DESIGN Inc. http://www.itosoft.com/
                                   Katsuyoshi Ito <kito@itosoft.com>
                                   January 30, 2009

Introduction
=

iUnitTest is an unit testing framework for iPhone applications.
It provides Xcode templates of test application projects and test classes.
After creating your own iUnitTest application from the template
and adding target classes, test classes and test methods,
you just need to start the iUnitTest application and press the 'Start' button
to run your tests.  
In iUnitTest application, all methods whose name start with 'test'
in classes inherited from IUTTest will be run as test cases.

opencode:
-
opencode is a service to show a source code.  
If you run with opencode, when you touch the failure cell, iUnitTest send
a source code information to it. Then failure code appear on Xcode.
It works running on iPhone simulator.  

On the Xcode 4, it just open the file. it can’t select the line. If you know the way to select the line, please let me know.

Requirement
=

iPhone SDK for iOS 5 or later with the Xcode 4.  
When your target is before iOS5 with the Xcode 3, use sdk3.0 branch.  

Installation
=

Run 'sudo ./setup'.
Then the iUnitTest templates will be added to your Xcode.  

On the Xcode 4 the iUnitTest project template doesn’t work.  
Please use iut [(https://github.com/katsuyoshi/iut)](https://github.com/katsuyoshi/iut) instead of it.  

opencode:
See tools/opencode/Install.txt


Examples
=

See the examples in the 'tutorial' directory.  

There are two sample projects, 'Prefectures' and 'PrefecturesTest'.  
'Prefectures' project is the target project of testing.  
'PrefecturesTest' project is the test application project to test
'Prefectures', generated from the iUnitTest Application template.  


Acknowledgments
=

Thanks to everyone for giving me advise on release of iUnitTest.  
And I especillay appreciate nobon(http://blog.nobon.boo.jp/)'s offer of his cool icon  
and Yasuko OHBA(Everyleaf Corp. http://www.everyleaf.com) 's support  
for translating ReadMe in English.  

