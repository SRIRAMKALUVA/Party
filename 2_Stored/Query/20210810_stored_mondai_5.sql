CREATE OR REPLACE function mondai_5() RETURNS TABLE(
会員CD text,
パーティー参加回数 bigint
)
AS $$
	BEGIN
	RETURN Query
		SELECT tm.member_cd AS 会員CD, count(tpm.party_id) AS パーティー参加回数 
		FROM t_member as tm 
		LEFT JOIN t_party_member as tpm on(tm.member_id = tpm.member_id) 
		WHERE tm.member_id not in (select member_id from t_party_member)
		GROUP BY tm.member_cd;
END $$
language plpgsql;
select * from mondai_5();
