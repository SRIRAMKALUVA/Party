SELECT member_id as 会員ID,
    member_cd as 会員CD,
    gender_kbn as 性別区分,
    family_kj as 名前（姓,
    birthday_ts::timestamp::date as 誕生日 
    from t_member 
    where member_id in (2,3,4);