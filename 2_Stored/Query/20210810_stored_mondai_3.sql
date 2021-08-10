CREATE or REPLACE function mondai_3() RETURNS TABLE (
パーティーID bigint,
パーティー名 text,
開催日時 text
)
 as $$
    BEGIN
      RETURN QUERY 
	  	select distinct t_party.party_id as パーティーID,title as パーティー名,to_char(start_ts, 'YYYY/MM/DD  HH24:MI') as 開催日時 
		from t_party_member 
 		INNER JOIN t_party on(t_party_member.party_id = t_party.party_id)
 		INNER JOIN t_member on(t_party_member.member_id = t_member.member_id)
 		where gender_kbn = '00101' 
 		and 
 		t_party_member.party_id not in 
 		(select party_id from t_party_member 
  			INNER JOIN t_member on(t_party_member.member_id = t_member.member_id) 
  				where gender_kbn = '00102');
    END $$ 
language plpgsql;
select * from mondai_3();


-- Function with variables
CREATE or REPLACE function mondai_3(required_gender text,not_required_gender text) RETURNS TABLE (
パーティーID bigint,
パーティー名 text,
開催日時 text
)
 as $$
    BEGIN
      RETURN QUERY 
	  	select distinct t_party.party_id as パーティーID,title as パーティー名,to_char(start_ts, 'YYYY/MM/DD  HH24:MI') as 開催日時 
		from t_party_member 
 		INNER JOIN t_party on(t_party_member.party_id = t_party.party_id)
 		INNER JOIN t_member on(t_party_member.member_id = t_member.member_id)
 		where gender_kbn = required_gender 
 		and 
 		t_party_member.party_id not in 
 		(select party_id from t_party_member 
  			INNER JOIN t_member on(t_party_member.member_id = t_member.member_id) 
  				where gender_kbn = not_required_gender);
    END $$ 
language plpgsql;
select * from mondai_3('00101','00102');


