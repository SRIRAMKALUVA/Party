CREATE OR REPLACE function mondai_4() RETURNS TABLE(
会員CD text,
パーティー参加回数 bigint
)
AS $$
	BEGIN
	RETURN QUERY
		SELECT member_cd as 会員CD, count(tpm.party_id) as  パーティー参加回数  
    	FROM t_member as tm 
        LEFT JOIN t_party_member as tpm on(tm.member_id = tpm.member_id) 
        GROUP BY member_cd;
	END $$ 
language plpgsql;
select * from mondai_4();