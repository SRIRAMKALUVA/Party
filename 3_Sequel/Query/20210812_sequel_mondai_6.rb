require 'sequel'
require 'date'
Sequel.split_symbols = true
DB = Sequel.postgres('Party',user:'postgres',password:'root@123',host:'localhost',port:5433,max_connections: 10)

puts DB[:t_place___tpl]
    .inner_join(:t_party___tp, tp__place_id: :tpl__place_id)
    .inner_join(:t_party_member___tpm, tpm__party_id: :tp__party_id)
    .inner_join(:t_member___tm, tm__member_id: :tpm__member_id)
    .select(:tpm__party_id___パーティーID, :tp__title___パーティー名,
        :tpl__name___場所の名前,
        Sequel.join([:tm__family_kj,:tm__first_kj]).as(:姓名),
        Sequel.case({{tm__gender_kbn: ['00101']} => '男性'},'女性').as(:性別),
        Sequel.as(Date.today.year - Sequel.extract(:year,:tm__birthday_ts),:年齢))
    .select_more{to_char(:tp__start_ts, 'YYYY/MM/DD HH24:MI').as(:開催日時)}
    .select_more{to_char(:tp__end_ts, 'YYYY/MM/DD HH24:MI').as(:終了日時)}
    .order(:tp__party_id)
    .all