iUnitTest
                                   ITO SOFT DESIGN Inc. http://www.itosoft.com/
                                   Katsuyoshi Ito <kito@itosoft.com>
                                   January 30, 2009

* Introduction

iUnitTest is an unit testing framework for iPhone applications.
It provides Xcode templates of test application projects and test classes.
After creating your own iUnitTest application from the template
and adding target classes, test classes and test methods,
you just need to start the iUnitTest application and press the 'Start' button
to run your tests.
In iUnitTest application, all methods whose name start with 'test'
in classes inherited from IUTTest will be run as test cases.

opencode:
opencode is a service to show a source code.
If you run with opencode, when you touch the failure cell, iUnitTest send
a source code information to it. Then failure code appear on Xcode.
It works running on iPhone simulator.


* Requirement

iPhone SDK for iPhone OS 2.2 or later.


* Installation

Run 'sudo ./setup'.
Then the iUnitTest templates will be added to your Xcode.

opencode:
See tools/opencode/Install.txt


* Examples

See the examples in the 'tutorial' directory.

There are two sample projects, 'Prefectures' and 'PrefecturesTest'.
'Prefectures' project is the target project of testing.
'PrefecturesTest' project is the test application project to test
'Prefectures', generated from the iUnitTest Application template.


* Acknowledgments

Thanks to everyone for giving me advise on release of iUnitTest.
And I especillay appreciate nobon(http://blog.nobon.boo.jp/)'s offer of his cool icon
and Yasuko OHBA(Everyleaf Corp. http://www.everyleaf.com) 's support
for translating ReadMe in English.
