## 2021-04-03
これまで非CDBのデータベース（SID=orcl）で学習を進めていたが、
試しにCDBのデータベースを新しく作成した（SID=cdb1）。

DBCAでの作成時に一つ目のPDBとしてpdb1を作成。

systemユーザでCDB1に接続し、alter session set container=pdb1; でPDB1に接続してから、
ユーザ（p1_user1）を作成して適当に色々な権限を付与するなどした。

上記CDB, PDBを一発で接続できるようにtnsnames.oraを編集して下記で接続できるようにした。
* sqlplus system@cdb1
* sqlplus p1_user1@pdb1

tnsnames.oraの編集でなにげにつまづいたのは、初期化パラメータの設定だ。

tnsnames.oraとlistener.oraをちゃんとCDB, PDBともに設定したのになぜかリスナーにサービスが登録されず、
どうしてだろうと1時間ほど色々試したりしていたが、
最終的には初期化パラメータ「local_listener」が設定されていないことが原因だと分かった。

local_listenerにlistener.oraに設定した値と同じ
```
(ADDRESS = (PROTOCOL = TCP)(HOST = 127.0.0.1)(PORT = 1521))
```

を設定した上で、
```
alter system register;
```
をCDB1で実行することで、「CDB1」「PDB1」の両方がサービス名としてリスナーに登録された。
