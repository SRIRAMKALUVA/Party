require 'sequel'
require 'date'
Sequel.split_symbols = true
DB = Sequel.postgres('Party',user:'postgres',password:'root@123',host:'localhost',port:5433,max_connections: 10)

puts DB[:t_member___tm]
    .select(:tm__member_cd___会員CD,
        Sequel.case({{tm__gender_kbn: ['00101']} => 'male'},'female').as(:性別),
        Sequel.join([:tm__family_kn, ' ', :tm__first_kn]).as(:名前_姓名かな),
        Sequel.as(Date.today.year - Sequel.extract(:year,:tm__birthday_ts),:年齢))
    .where(Date.today.year - Sequel.extract(:year,:tm__birthday_ts) >= 30)
    .where(:tm__gender_kbn => '00102')
    .all
