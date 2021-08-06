SELECT tm.member_cd AS 会員CD, count(tpm.member_id) AS パーティー参加回数 
    FROM t_member as tm, t_party_member as tpm WHERE tm.member_id = tpm.member_id
        GROUP BY tm.member_cd;