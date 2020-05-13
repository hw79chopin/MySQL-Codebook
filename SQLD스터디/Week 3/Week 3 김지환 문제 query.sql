SELECT * FROM airbnb;
SELECT count(*)FROM airbnb;

/* 1. 어떤 호스트는 Airbnb 사이트를 자신의 집을 팔기 위한 홍보 사이트로 악용하기도 합니다. 
이들은 365일 중 대여 가능한 날을 일부러 적게 걸어놓고, 한번에 최소 예약해야 하는 일 수를 연중 대여 가능한 날 수 보다 더 높게 잡아 방 대여가 사실상 불가능하게끔 합니다. 
그렇게 자신의 집을 홍보하여 매매합니다. airbnbb
사이트를 악용하고 있는 호스트들의 아이디와 이름을 찾아주세요. */
SELECT * FROM airbnb
WHERE availability_365 < minimum_nights;

/* 2. 지역별, 방 종류 별로 방들의 개수를 누적하여 보고 싶습니다. 지역별, 방 종류 별로 몇 개의 방이 있는지, 부분합은 얼마인지 나타내도록 쿼리를 만들어주세요.*/
SELECT neighbourhood_group, room_type, sum(price)
FROM airbnb
GROUP BY neighbourhood_group, room_type WITH ROLLUP;

/* 3. 각 집들이 얼마나 오랫동안 Airbnb 사이트에 게시되어 있었는지가 궁금합니다. Months 칼럼을 새로 추가하여 각 집들이 몇 개월 동안 Airbnb 사이트에 게시되어 있었는지 채워 넣으세요. 구하지 못하는 집의 경우 0으로 두세요. */
SELECT * FROM airbnb;

ALTER TABLE airbnb ADD months FLOAT;

UPDATE airbnb 
SET months  = (number_of_reviews / reviews_per_month);

/* 4. 그 동안 몇 개의 방은 Airbnb 사이트에서 내려갔으며, 새로 올라온 방들은 새로운 데이터에 포함되어 있지 않습니다. 내려간 방들의 id를 찾아주세요. */
SELECT a1.id, a1.host_id FROM airbnb a1
LEFT JOIN airbnb a2
ON a1.id = a2.id;

/* 5. 데이터베이스의 오류로 인해, 새로운 데이터에서 몇몇 집들의 위도와 경도가 다른 집의 위도와 경도로 덮어씌워졌습니다. 이 집들의 id를 출력하고, 원래 데이터를 이용하여 올바른 위도와 경도로 바꾸어 주세요.  */
SELECT * FROM airbnb2;

SELECT latitude, longitude, count(*) 
FROM airbnb2
GROUP BY latitude, longitude
ORDER BY count(*) Desc;
/* 여기서 왜 id 칼럼을 넣으면 안 되는 거쥬? */