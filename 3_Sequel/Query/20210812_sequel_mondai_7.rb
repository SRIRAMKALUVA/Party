require 'sequel'
DB = Sequel.postgres('Party',user:'postgres',password:'root@123',host:'localhost',port:5433,max_connections: 10)

t_party = DB[:t_party]

puts t_party.left_join(:t_party_member, party_id: :party_id)
    .left_join(:t_member, member_id: :member_id)
    .select_group(Sequel[:t_party][:party_id],Sequel[:t_party][:title])
    .select(Sequel.as(Sequel[:t_party][:party_id],:パーティーID),Sequel.as(:title,:パーティー名))
    .select_more{Sequel.as(sum(Sequel.case({{gender_kbn: ['00101']} => 1},0)),:男性参加者数)}
    .select_more{Sequel.as(sum(Sequel.case({{gender_kbn: ['00102']} => 1},0)),:女性参加者数)}
    .select_more{Sequel.as(count(:gender_kbn),参加者総数)}
    .select_more{Sequel.as(sum(Sequel.case({{gender_kbn: ['00101']} => :price_man},0)),:男性売上げ)}
    .select_more{Sequel.as(sum(Sequel.case({{gender_kbn: ['00102']} => :price_woman},0)),:女性売上げ)}
    .select_more{Sequel.as(coalesce(sum(Sequel.case({{gender_kbn: ['00101']} => :price_man},0)),0)+coalesce(sum(Sequel.case({{gender_kbn: ['00102']} => :price_woman},0)),0),:総売上げ)}
    .order(Sequel[:t_party][:party_id])
    .all