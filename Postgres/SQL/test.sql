
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

-- t_placeのテーブルにデータを入れるためにこのクエリを使いました
insert into t_place values (1, '新宿パーティー会場', '東京都新宿区西新宿1-2-3');
insert into t_place values (2, '恵比寿パーティー会場', '東京都渋谷区恵比寿5-5');
insert into t_place values (3, '有楽町パーティー会場', '東京都千代田区有楽町8-1');
insert into t_place values (4, '鎌倉パーティー会場', '神奈川県鎌倉市1-1');
insert into t_place values (5, '京都パーティー会場', '京都府中京区1-8');
insert into t_place values (6, '伊豆パーティー会場', '神奈川県伊豆市9-123');
insert into t_place values (7, '横浜パーティー会場', '神奈川県横浜市6-456');

-- t_partyのテーブルにデータを入れるためにこのクエリを使いました
insert into t_party values(1,'男女20代限定パーティー','2018-05-18 14:00:00','2018-05-18 15:30:00',3,3000,2000);
insert into t_party values(2,'料理好き集まれ！クッキングパーティー','2018-05-19 16:00:00','2018-05-19 18:00:00',1,4000,3000);
insert into t_party values(3,'1年以内に結婚したい30代限定パーティー','2018-05-20 10:00:00','2018-05-20 12:00:00',2,4000,3000);
insert into t_party values(4,'男女20代限定パーティー','2018-05-26 11:00:00','2018-05-26 14:00:00',4,5000,4000);

-- t_memberのテーブルにデータを入れるためにこのクエリを使いました
insert into t_member values(1,'M88035','00101','山田','太郎','やまだ','たろう','1982-02-02 0:00:00');
insert into t_member values(2,'M24333','00101','佐藤','宏','さとう','ひろし','1991-08-16 0:00:00');
insert into t_member values(3,'F12414','00102','田中','花子','たなか','はなこ','1990-05-11 0:00:00');
insert into t_member values(4,'M96432','00101','佐々木','大輔','ささき','だいすけ','1980-10-09 0:00:00');
insert into t_member values(5,'F42677','00102','上野','愛','うえの','あい','1988-12-23 0:00:00');
insert into t_member values(6,'F55543','00102','遠藤','裕美','えんどう','ゆみ','1992-03-30 0:00:00');
insert into t_member values(7,'M36945','00101','前田','三郎','まえだ','さぶろう','1995-05-02 0:00:00');

-- t_party_memberのテーブルにデータを入れるためにこのクエリを使いました
insert into t_party_member values(1,3,1);
insert into t_party_member values(2,3,4);
insert into t_party_member values(3,1,6);
insert into t_party_member values(4,3,7);
insert into t_party_member values(5,2,4);
insert into t_party_member values(6,2,6);
insert into t_party_member values(7,2,1);
insert into t_party_member values(8,2,5);
insert into t_party_member values(9,1,7);

-- END
