require 'sequel'
require 'date'
DB = Sequel.postgres('Party',user:'postgres',password:'root@123',host:'localhost',port:5433,max_connections: 10)

t_place = DB[:t_place]

puts t_place.inner_join(:t_party, place_id: :place_id)
    .inner_join(:t_party_member, party_id: :party_id)
    .inner_join(:t_member, member_id: :member_id)
    .select(Sequel[:t_party_member][:party_id], Sequel.as(:title,:パーティー名),
        Sequel.as(:name,:場所の名前), Sequel.as(Sequel.join([:family_kj,:first_kj]),:姓名),
        Sequel.as(Sequel.case({{gender_kbn: ['00101']} => '男性'},'女性'),:性別),
        Sequel.as(Date.today.year - Sequel.extract(:year,:birthday_ts),:年齢))
    .select_more{Sequel.as(to_char(:start_ts, 'YYYY/MM/DD HH24:MI'),:開催日時)}
    .select_more{Sequel.as(to_char(:end_ts, 'YYYY/MM/DD HH24:MI'),:終了日時)}
    .order(:party_id)
    .all