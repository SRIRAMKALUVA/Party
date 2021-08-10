CREATE or REPLACE function mondai_1() RETURNS TABLE (
  会員CD text,
  性別区分 text,
  名前（姓 text,
  誕生日 date)
 as $$
 
    BEGIN
      RETURN QUERY 
	  	SELECT member_cd as 会員CD,
        gender_kbn as 性別区分,
        family_kj as 名前（姓,
		birthday_ts::timestamp::date as 誕生日 
		from t_member 
        where member_id in (2,3,4);
    END $$ 
language plpgsql;

select * from mondai_1();