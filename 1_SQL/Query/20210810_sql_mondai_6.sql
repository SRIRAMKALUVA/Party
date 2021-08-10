
select 
    tpm.party_id as パーティーID,
    title as パーティー名,
    to_char(start_ts, 'YYYY/MM/DD HH24:MI') as 開催日時,
    to_char(end_ts, 'YYYY/MM/DD HH24:MI') as 終了日時,
    tpl.name as 場所の名前,tpl.address as 住所, member_cd,
    concat(family_kj, first_kj) as 姓名, 
    case when gender_kbn = '00101' then '男性' 
        when gender_kbn = '00102' then '女性' else 'Other' 
            end as 性別, 
    date_part('year',age(birthday_ts)) as 年齢 
    from t_party_member as tpm
    INNER JOIN t_party as tp on (tpm.party_id = tp.party_id)
    INNER JOIN t_member as tm on (tpm.member_id = tm.member_id)
    INNER JOIN t_place as tpl on (tp.place_id = tpl.place_id)
    order by tpm.party_id
;