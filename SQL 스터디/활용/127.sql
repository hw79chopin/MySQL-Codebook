-- Q.스티브 잡스 연설문에서 가장 많이 나오는 단어는?
CREATE TABLE speech
(SPEECH_TEXT VARCHAR(10000));

SET GLOBAL local_infile=1;

LOAD DATA LOCAL INFILE '/Users/junghyunwoo/Downloads/jobs.txt'
INTO TABLE speech
character set utf8;

-- 데이터건수 살펴보기
SELECT count(*) 
	FROM speech;