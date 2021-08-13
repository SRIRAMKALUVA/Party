require 'sequel'
require 'date'
Sequel.split_symbols = true
DB = Sequel.postgres('Party',user:'postgres',password:'root@123',host:'localhost',port:5433,max_connections: 10)

puts DB[:t_party___tp]
    .inner_join(:t_party_member___tpm, tp__party_id: :tpm__party_id)
    .inner_join(:t_member___tm, tm__member_id: :tpm__member_id)
	.select_group(:tp__party_id)
    .select(:tp__party_id___パーティーID,:tp__title___パーティー名)
    .select_more{to_char(:start_ts, 'YYYY/MM/DD HH24:MI').as(:開催日時)}
    .having{SUM(Sequel.case({{tm__gender_kbn: ['00102']} => 1},0)) <= 0}
    .all
