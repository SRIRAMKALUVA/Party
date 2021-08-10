select distinct t_party.party_id as パーティーID,title as パーティー名,to_char(start_ts, 'YYYY/MM/DD  HH24:MI') as 開催日時 
from t_party_member 
 INNER JOIN t_party on(t_party_member.party_id = t_party.party_id)
 INNER JOIN t_member on(t_party_member.member_id = t_member.member_id)
 where gender_kbn = '00101' 
 and 
 t_party_member.party_id not in 
 (select party_id from t_party_member,t_member 
 	where t_party_member.member_id = t_member.member_id 
	 and gender_kbn = '00102');