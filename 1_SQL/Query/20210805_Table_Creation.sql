
-- t-placeのテーブルを作るためにこのクエリを使いました
CREATE TABLE t_place(
	place_id bigserial PRIMARY KEY,
	name text NOT NULL,
	address text NOT NULL
);

-- t-partyのテーブルを作るためにこのクエリを使いました
CREATE TABLE t_party(
	party_id bigserial PRIMARY KEY,
	title text NOT NULL,
	start_ts timestamptz NOT NULL,
	end_ts timestamptz NOT NULL,
	place_id bigint NOT NULL references t_place(place_id),
	price_man integer NOT NULL,
	price_woman integer NOT NULL
);

-- t-memberのテーブルを作るためにこのクエリを使いました
CREATE TABLE t_member(
	member_id bigserial PRIMARY KEY,
	member_cd text NOT NULL,
	gender_kbn text NOT NULL,
	family_kj text NOT NULL,
	first_kj text NOT NULL,
	family_kn text NOT NULL,
	first_kn text NOT NULL,
	birthday_ts timestamptz NOT NULL
);

-- t-party_memberのテーブルを作るためにこのクエリを使いました
CREATE TABLE t_party_member(
	party_member_id bigserial PRIMARY KEY,
	party_id bigint NOT NULL references t_party(party_id),
	member_id bigint NOT NULL references t_member(member_id)
);

