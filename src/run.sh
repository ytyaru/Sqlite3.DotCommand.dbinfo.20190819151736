SCRIPT_DIR=$(cd $(dirname $0); pwd)
cd "$SCRIPT_DIR"

# unable to read database header
sqlite3 :memory: ".dbinfo"
sqlite3 A.db ".exit"
sqlite3 A.db ".dbinfo"

# インメモリ
sqlite3 :memory: \
"create table T(C text);" \
"insert into T values('A');" \
".dbinfo"

# ファイル
sqlite3 :memory: \
"create table T(C text);" \
"insert into T values('A');" \
".backup B.db"
sqlite3 B.db ".dbinfo"

