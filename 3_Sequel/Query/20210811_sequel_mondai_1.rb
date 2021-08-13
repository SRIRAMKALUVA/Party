require 'sequel'
Sequel.split_symbols = true
DB = Sequel.postgres('Party',user:'postgres',password:'root@123',host:'localhost',port:5433,max_connections: 10)

puts DB[:t_member___tm].select(
    :tm__member_cd___会員CD,
    :tm__gender_kbn___性別区分,
    :tm__family_kj___名前_姓)
    .select_more{to_char(:tm__birthday_ts, 'YYYY/MM/DD').as(:開催日時)}
    .where(:member_id => [2,3,4]).all