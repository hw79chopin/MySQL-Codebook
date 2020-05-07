# About SQL

![](https://devclass.com/wp-content/uploads/2018/06/The-Agile-and-the-Continuous-Database-Drift%E2%80%A6Neat-film-title-but-somethingtoavoid-copy.jpg)

## MySQL codebook
- 일단은 MySQL에서 쓰는 syntax들을 우선 올려놨습니다!
- Jupyter notebook에 정리하기는 했지만 MySQL에서 쓰는 그대로 정리해서 알아볼 수 있을거임둥
- 대문자로 쓴 부분이 MySQL syntax!
- [mac에서 MySQL 설치하기](https://whitepaek.tistory.com/16)

## SQLD 준비
- 나아가 SQLD를 준비하면서 공부했던 내용을 정리해둘겁니다!
- 여기
 
## AWS EC2에 MySQL 깔기
``` 
$ sudo apt update     # 업데이트해주기
$ sudo apt install mysql-server   # MySQL 설치하기
$ sudo mysql -u root -p     # MySQL 접속하기
```
- 비밀번호를 입력하라는데 그냥 enter 누르면 된다.
```
$ use mysql;
$ CREATE USER '사용자이름'@'%' IDENTIFIED BY '비밀번호';     # 사용자, 비밀번호 설정
$ GRANT ALL PRIVILEGES ON *.* TO '사용자이름'@'%';       # 외부접속 허용하도록 설정
$ FLUSH PRIVILEGES;
$ exit;
```
 - MySQL 설정 파일 수정하기
```
$ sudo apt-get install vim
$ cd /etc/mysql/mysql.conf.d
$ sudo vi mysqld.cnf
bind-address = 0.0.0.0로 
$ sudo service mysql restart
```
- 이제 AWS 보안그룹 설정에서 MySQL/AURORA 허용 IP를 0.0.0.0/0로 설정하면 외부에서 접속가능!!

## MySQL Error:1290 해결하기 (secure-file-pri 설정해주기)
- 만약 밑에 코드 결과가 텅 비어있으면
```
mysql> SELECT @@GLOBAL.secure_file_priv;
```
- Finder에서 my.cnf 찾아서
```
$ vim my.cnf
  secure-file-pri=" " # 이 문장 추가해주기
$ mysql.server stop
$ mysql.server start
```
