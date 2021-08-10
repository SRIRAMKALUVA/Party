SELECT tm.member_cd AS 会員CD, count(tpm.party_id) AS パーティー参加回数 
	FROM t_member as tm 
		LEFT JOIN t_party_member as tpm on(tm.member_id = tpm.member_id) 
			WHERE tm.member_id not in (select member_id from t_party_member)
				GROUP BY tm.member_cd;