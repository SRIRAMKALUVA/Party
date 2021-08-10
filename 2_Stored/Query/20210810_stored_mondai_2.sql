CREATE OR REPLACE function mondai_2() RETURNS TABLE(
会員ID bigint,
会員CD text,
性別 text,
名前_姓名かな text,
年齢 double precision)
as $$
	BEGIN
		RETURN Query 
			select 
				member_id as 会員ID,
				member_cd as 会員CD,
                CASE WHEN gender_kbn = '00101' THEN 'Male' WHEN gender_kbn = '00102' THEN 'Female' END 性別,
                concat(family_kn,' ',first_kn) as 名前_姓名かな,
                EXTRACT(YEAR FROM age(now(),birthday_ts)) as 年齢 
                from t_member 
                where EXTRACT(YEAR FROM age(now(),birthday_ts))>30 and gender_kbn = '00102';
    END $$
language plpgsql;

SELECT *from mondai_2();


-- Function with variables
CREATE OR REPLACE function mondai_2(gender text, Min_age int) RETURNS TABLE(
会員ID bigint,
会員CD text,
性別 text,
名前_姓名かな text,
年齢 double precision)
as $$
	BEGIN
		RETURN Query 
			select 
				member_id as 会員ID,
				member_cd as 会員CD,
                CASE WHEN gender_kbn = '00101' THEN 'Male' WHEN gender_kbn = '00102' THEN 'Female' END 性別,
                concat(family_kn,' ',first_kn) as 名前_姓名かな,
                EXTRACT(YEAR FROM age(now(),birthday_ts)) as 年齢 
                from t_member 
                where EXTRACT(YEAR FROM age(now(),birthday_ts))>Min_age and gender_kbn = gender;
    END $$
language plpgsql;

SELECT *from mondai_2('00102',30);