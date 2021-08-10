SELECT 
    tpm.party_id AS パーティーID,
    title AS パーティー名,
    count(CASE WHEN gender_kbn ='00101' THEN 1 END) AS 男性参加者数,
    count(CASE WHEN gender_kbn ='00102' THEN 1 END) AS 女性参加者数,
    count(*) AS 参加者総数,
    coalesce(sum(CASE WHEN gender_kbn = '00101' THEN price_man END),0) AS 男性売上げ,
    coalesce(sum(CASE WHEN gender_kbn = '00102' THEN price_woman END),0) AS 女性売上げ,
    coalesce(sum(CASE WHEN gender_kbn = '00101' THEN price_man END),0) + 
        coalesce(sum(CASE WHEN gender_kbn = '00102' THEN price_woman END),0) AS 総売上げ
    FROM t_party_member AS tpm
    INNER JOIN t_party AS tp ON (tpm.party_id = tp.party_id)
    INNER JOIN t_member AS tm ON (tpm.member_id = tm.member_id)
    GROUP BY tpm.party_id, title
	ORDER BY tpm.party_id
;