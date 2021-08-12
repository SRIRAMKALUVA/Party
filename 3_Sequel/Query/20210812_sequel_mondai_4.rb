require 'sequel'

DB = Sequel.postgres('Party',user:'postgres',password:'root@123',host:'localhost',port:5433,max_connections: 10)

t_member = DB[:t_member]
puts t_member.left_join(:t_party_member, member_id: :member_id)
    .select_group(Sequel.as(:member_cd,:会員CD))
    .select_more{Sequel.as(count(:party_id),:パーティー参加回数)}
    .all