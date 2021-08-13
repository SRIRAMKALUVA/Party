require 'sequel'
Sequel.split_symbols = true
DB = Sequel.postgres('Party',user:'postgres',password:'root@123',host:'localhost',port:5433,max_connections: 10)

puts DB[:t_member___tm]
    .left_join(:t_party_member___tpm, tm__member_id: :tpm__member_id)
    .select_group(:tm__member_cd___会員CD)
    .select_more{count(:party_id).as(:パーティー参加回数)}
    .all