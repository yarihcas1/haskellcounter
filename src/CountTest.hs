module CountTest (getNowCount) where

import Database.HDBC
import Database.HDBC.MySQL

dbDriver = "mysql"
dbServer = "127.0.0.1"
dbDatabase = "counttest"
dbUserName = "user"
dbPassword = "pass"

-- 接続
connDB = connectMySQL defaultMySQLConnectInfo {
		mysqlHost = dbServer,
		mysqlDatabase = dbDatabase,
		mysqlPassword = dbPassword,
		mysqlUser = dbUserName
}

{-
	SQL生成
-}

-- 現在のカウントを取得するためのSQL
makeQuery_getNowCount = "select count from counter"

-- カウントを+1するためのSQL
-- ?を指定すると、quickQuery'などの第二引数で指定した値を代入してくれる
makeQuery_countUp = "update counter set count=?"

{-
	JSON作成
-}

-- {"count": (現在のカウント)} というJSONを作る
makeJSONStr_getNowCount i = "{\"count\": " ++ (show i) ++ "}"

{-
	現在のカウントを返す
-}
getCountFromRow [] = 0
getCountFromRow ([count]:_) = (fromSql count) :: Integer

{-
	結果取得
-}

getNowCount = do
	conn <- connDB
	rows_count <- quickQuery' conn makeQuery_getNowCount []		-- '
	ret <- run conn makeQuery_countUp [toSql ((getCountFromRow rows_count)+1)]
	return (makeJSONStr_getNowCount (getCountFromRow rows_count))

