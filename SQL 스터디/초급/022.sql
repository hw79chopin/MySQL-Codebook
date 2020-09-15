-- 특정 철자 잘라내기 (TRIM, RTRIM, LTRIM)
-- 첫 번째 칼럼은 영어 단어 smith를 출력고, 두 번째 칼럼은 s만 잘라서 출렭하고, 세 번째 칼럼은 h를 잘라서 출력하고, 네 번째 칼럼은 SMITHS양쪽에 s를 잘라서 출력하오. (Oracle에서 가능)
SELECT 'smith', LTRIM('smith', 's'), RTRIM('smith', 'h'), TRIM('s' from 'smiths')
	FROM daul;

-- 사원 이름이 jack인 사원의 이름과 월급을 조회하시오
SELECT ename, sal
	FROM emp
    WHERE TRIM(ename)='SMITH';