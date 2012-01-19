This is Japanese descripton.

iUnitTest
=
　　　　　　　　　　　　　　　　　　有限会社伊藤ソフトデザイン  
　　　　　　　　　　　　　　　　　　　http://www.itosoft.com/  
　　　　　　　　　　　　　　　　　　　　　　　　　　伊藤勝良  
　　　　　　　　　　　　　　　　　　　 　　<kito@itosoft.com>  
　　　　　　　　　　　　　　　　　　　　　　　　　　2009/01/30  

イントロダクション
=

iUnitTestはiPhoneソフトのUnit Testを行なうためのフレームワークで、
Xcode用のiUnitTestアプリケーションテンプレートを提供します。
テンプレートから作成したプロジェクトに、テスト対象となるクラスを追加します。  
テストを行うIUTTestクラスのサブクラスを作成し、testから始まるメソッドにテストコードを記述します。  
アプリケーションを起動しStartボタンを押すとUnit Testを逐次実行します。  

opencode:
-
opencodeはソースコードをXcodeで表示するためのサービスです。  
opencodeを用いると、iPhone simulatorでiUnitTestを実行した時に、
失敗した行をクリックすると、該当するソースコードをXcodeで表示する事が出来ます。  
Xcode 4ではファイルを開くだけで、該当行選択する事が出来ません。もし選択する方法を知っていたら教えて下さい。  


必要な環境
=
iPhone SDK fo iOS5以降とXcode 4
iOS4以前でXcode 3を使う場合はsdk3.0ブランチを使用して下さい。 


インストール
=
Terminal.appで'sudo ./setup'を実行します。
iUnitTestアプリケーションのテンプレートと、テストクラス用のテンプレートファイルが追加されます。  
Xcode 4ではテストクラス用のテンプレートファイルが正常に動作しないため、代わりにiut [(https://github.com/katsuyoshi/iut) ](https://github.com/katsuyoshi/iut) を使用して下さい。

opencode:
tools/opencode/Install.txtをご覧下さい。

サンプル
=
tutorialフォルダにサンプルがあります。
'Prefectures'ブロジェクトと'PrefecturesTest'プロジェクトがあります。
'Prefectures'はテストされるプロジェクトで、あなたのアプリケーションに相当する物です。
'PrefecturesTest'は'Prefectures'にあるクラスをテストするためのプロジェクトで
iUnitTestアプリケーションテンプレートから作成した物です。


謝辞
=
公開に際し、相談に乗って頂いた皆様大変ありがとうございました。
また、一つ返事でアイコンを提供していただいたnobonさん ( http://blog.nobon.boo.jp/ ) 、
快くReadMeの英訳を引き受けて頂いた株式会社万葉 ( http://www.everyleaf.com ) の大場寧子さんには
特に感謝申し上げます。

