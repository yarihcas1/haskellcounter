
- haskell製カウンタ -

●説明
haskellで作ったmysqlを利用した簡単なカウンタです。

●ファイル一覧
main.hs
CountTest.hs
showcount.js
counttest.sql
test.html
NYSL.TXT
readme.txt

●動作確認済環境
OS: linux
httpd: apache2系
mysql: 5.0系
ghc: 6.8.2
ライブラリ：
 HDBC-2.1.0
 HDBC-mysql-0.5
 network-2.1.0.0
ブラウザ: Opera 9.64(WinXP)

●使い方
1.mysqlにカウンタ用データベースを作成する
mysql -u (ユーザー名) -p (パスワード) -h (サーバー名) < cunttest.sql

2.CountTest.hsのmysql接続情報を更新する
7～10行目
dbServer = "127.0.0.1"		←DBサーバー(大抵はこのままで良いと思います)
dbDatabase = "counttest"	←そのまま
dbUserName = "user"			←設定済みのmysqlのユーザー名
dbPassword = "pass"			←そのパスワード

3.以下のコマンドでコンパイル
ghc --make main.hs -o counttest.cgi

4.サーバーにファイルを設置
cgi-bin以下にcounttest.cgi
cgi以外のディレクトリにshowcount.js

5.カウンタを表示させたいhtmlに以下を追記
<script type="text/javascript" src="(showcount.jsまでのパス)/showcount.js"></script>
<script type="text/javascript" src="(count.cgiまでのパス)count.cgi?callback=showcount"></script>

6.4で編集したhtmlを表示して確認

●test.htmlについて
すでに(ihcas.orz.hm)サーバーに設置済みのカウンタを実行できます。
数字が表示されていれば成功です。
リロードするとカウントアップしている様を見られます。
それだけです。

●連絡先など
yar-ihcas(sachi@ihcas.orz.hm)まで。
hp: http://ihcas.orz.hm/~sachi/

●更新履歴
ver.1.0: 20090406
  ・とりあえず作った
