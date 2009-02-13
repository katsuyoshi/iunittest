This is Japanese descripton.

iUnitTest

　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　有限会社伊藤ソフトデザイン http://www.itosoft.com/
　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　伊藤勝良 <kito@itosoft.com>
　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　2009/01/30

■イントロダクション

iUnitTestはiPhoneソフトのUnit Testを行なうためのフレームワークで、
Xcode用のiUnitTestアプリケーションテンプレートを提供します。
テンプレートから作成したプロジェクトに、テスト対象となるクラスを追加します。
テストを行うIUTTestクラスのサブクラスを作成し、testから始まるメソッドにテストコードを記述します。
アプリケーションを起動しStartボタンを押すとUnit Testを逐次実行します。


■必要な環境

iPhone SDK for iPhone OS 2.2以降


■インストール

Terminal.appで'sudo ./setup'を実行します。
iUnitTestアプリケーションのテンプレートと、テストクラス用のテンプレートファイルが追加されます。


■サンプル

tutorialフォルダにサンプルがあります。
'Prefectures'ブロジェクトと'PrefecturesTest'プロジェクトがあります。
'Prefectures'はテストされるプロジェクトで、あなたのアプリケーションに相当する物です。
'PrefecturesTest'は'Prefectures'にあるクラスをテストするためのプロジェクトで
iUnitTestアプリケーションテンプレートから作成した物です。


■謝辞
公開に際し、相談に乗って頂いた皆様大変ありがとうございました。
また、一つ返事でアイコンを提供していただいたnobonさん(http://blog.nobon.boo.jp/)、
快くReadMeの英訳を引き受けて頂いた株式会社万葉(http://www.everyleaf.com)の大場寧子さんには
特に感謝申し上げます。
