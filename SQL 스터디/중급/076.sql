-- FROM절의 서브쿼리
-- Q. 이름과 월급과 순위를 출력하되, 순위가 1위인 사원만 출력하시오
SELECT v.ename, v.sal, v.순위
	FROM (SELECT ename, sal, rank() over (order by sal desc) 순위
			FROM emp) v
	WHERE v.순위 = 1;