module Main where

import Network.CGI

import CountTest

cgiMain = do
	cb <- getInput "callback"								-- パラメータ「callback」の取得
	setHeader "Content-Type" "text/html; charser=utf-8"		-- ヘッダの設定
	case cb of												-- 「callback」の有無による分岐
		Just qcb	-> do									-- 「callback」あり
			js <- liftIO (getNowCount)						-- JSONで取得
			output (qcb ++ "(" ++ js ++ ");")				-- JSONPで出力
		Nothing		-> do									-- 「callback」なし
			js <- liftIO (getNowCount)						-- JSONで取得
			output js										-- JSONで出力

main :: IO ()
main = do
	runCGI $ handleErrors (cgiMain)

