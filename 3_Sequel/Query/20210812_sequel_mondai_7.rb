require 'sequel'
Sequel.split_symbols = true
DB = Sequel.postgres('Party',user:'postgres',password:'root@123',host:'localhost',port:5433,max_connections: 10)

t_party = DB[:t_party]

puts DB[:t_party___tp]
    .left_join(:t_party_member___tpm, tpm__party_id: :tp__party_id)
    .left_join(:t_member___tm, tm__member_id: :tpm__member_id)
    .select_group(:tp__party_id,:tp__title)
    .select(:tp__party_id___パーティーID,:tp__title___パーティー名)
    .select_more{sum(Sequel.case({{tm__gender_kbn: ['00101']} => 1},0)).as(:男性参加者数)}
    .select_more{sum(Sequel.case({{tm__gender_kbn: ['00102']} => 1},0)).as(:女性参加者数)}
    .select_more{count(:tm__gender_kbn).as(:参加者総数)}
    .select_more{sum(Sequel.case({{tm__gender_kbn: ['00101']} => :tp__price_man},0)).as(:男性売上げ)}
    .select_more{sum(Sequel.case({{tm__gender_kbn: ['00102']} => :tp__price_woman},0)).as(:女性売上げ)}
    .select_more{Sequel.as(coalesce(sum(Sequel.case({{tm__gender_kbn: ['00101']} => :tp__price_man},0)),0)+coalesce(sum(Sequel.case({{tm__gender_kbn: ['00102']} => :tp__price_woman},0)),0),:総売上げ)}
    .order(:tp__party_id)
    .all