-- Q.스티브 잡스 연설문에는 긍정 단어가 얼마나 있을까?
CREATE TABLE POSITIVE (P_TEXT VARCHAR(2000));
CREATE TABLE NEGATIVE (N_TEXT VARCHAR(2000));

CREATE VIEW speech_view
AS
SELECT REGEXP_SUBSTR(lower(speech_text), '[^ ]+', 1, a) word
	FROM speech, (SELECT level a 
					FROM dual 
                    CONNECT BY level <= 52);

SELECT count(word) as 긍정단어
	FROM speech_view
	WHERE lower(word) IN ( SELECT lower(p_text FROM positive);