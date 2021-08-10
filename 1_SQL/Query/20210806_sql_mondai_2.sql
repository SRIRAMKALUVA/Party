select 
member_id as 会員ID,
member_cd as 会員CD,
CASE WHEN gender_kbn = '00101' THEN 'Male' WHEN gender_kbn = '00102' THEN 'Female' END 性別,
concat(family_kn,' ',first_kn) as 名前（姓名かな),
EXTRACT(YEAR FROM age(now(),birthday_ts)) as 年齢 
from t_member 
where EXTRACT(YEAR FROM age(now(),birthday_ts))>30 and gender_kbn = '00102';