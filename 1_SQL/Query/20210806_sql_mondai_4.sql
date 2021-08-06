select member_cd as 会員CD, count(tpm.party_id) as  パーティー参加回数  
    from t_member as tm 
        LEFT JOIN t_party_member as tpm on(tm.member_id = tpm.member_id) 
            GROUP BY member_cd;