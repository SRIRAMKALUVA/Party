require 'sequel'
require 'date'
DB = Sequel.postgres('Party',user:'postgres',password:'root@123',host:'localhost',port:5433,max_connections: 10)

t_party = DB[:t_party]

puts t_party.inner_join(:t_party_member, party_id: :party_id).inner_join(:t_member, member_id: :member_id)
	.select_group(Sequel[:t_party][:party_id])
    .select(Sequel.as(Sequel[:t_party][:party_id],:パーティーID),Sequel.as(:title,:パーティー名))
    .select_more{to_char(:start_ts, 'YYYY/MM/DD HH24:MI').as(:開催日時)}
    .having{SUM(Sequel.case({{gender_kbn: ['00102']} => 1},0)) < 1}
    .all