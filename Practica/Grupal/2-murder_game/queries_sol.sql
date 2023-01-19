SELECT *
FROM crime_scene_report
WHERE date = 20180115 AND type="murder" AND city="SQL City";
--Security footage shows that there were 2 witnesses. The first witness lives at the last house on "Northwestern Dr". The second witness, named Annabel, lives somewhere on "Franklin Ave".


SELECT *
FROM person
WHERE address_number = 
(
SELECT MAX(address_number)
FROM person
WHERE address_street_name LIKE "%Northwestern Dr%");
-- id=14887 Name="Morty Schapiro"

SELECT *
FROM person
WHERE name LIKE "%Annabel%" and address_street_name LIKE "%Franklin Ave%";
-- id=16371 Name="Annabel Miller"

SELECT *
FROM interview
WHERE person_id IN (14887, 16371);
--I heard a gunshot and then saw a man run out. He had a "Get Fit Now Gym" bag. The membership number on the bag started with "48Z". Only gold members have those bags. The man got into a car with a plate that included "H42W".
--I saw the murder happen, and I recognized the killer from my gym when I was working out last week on January the 9th.

SELECT p.*
FROM get_fit_now_member fm
INNER JOIN person p ON fm.person_id = p.id
INNER JOIN drivers_license dl ON dl.id = p.license_id 
WHERE fm.membership_status = "gold" AND fm.id LIKE "48Z%" AND dl.plate_number LIKE "%H42W%";
-- id = 67318 Name = Jeremy Bowers

SELECT *
FROM interview
WHERE person_id = 67318;
-- I was hired by a woman with a lot of money. I don't know her name but I know she's around 5'5" (65") or 5'7" (67"). She has red hair and she drives a Tesla Model S. I know that she attended the SQL Symphony Concert 3 times in December 2017.

SELECT 
    person_id,
    COUNT(person_id) conteo_veces
FROM facebook_event_checkin
WHERE 
    event_name LIKE "%SQL Symphony Concert%" 
    AND date >= "20171201" 
    AND date <= "20171231"
GROUP BY 1
ORDER BY 2 DESC
;
-- 99716 24556

SELECT p.*,dl.*
FROM person AS p
INNER JOIN drivers_license AS dl ON p.license_id = dl.id
WHERE p.id IN (99716, 24556);
-- Miranda Priestly!!!