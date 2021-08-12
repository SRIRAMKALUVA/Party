require 'sequel'
require 'date'
DB = Sequel.postgres('Party',user:'postgres',password:'root@123',host:'localhost',port:5433,max_connections: 10)

t_member = DB[:t_member]

puts t_member
    .select(Sequel.as(:member_cd,:会員CD), Sequel.as(Sequel.case({{gender_kbn: ['00101']} => 'male'},'female'),:性別), Sequel.as(Sequel.join([:family_kn, ' ', :first_kn]),:名前_姓名かな), Sequel.as(Date.today.year - Sequel.extract(:year,:birthday_ts),:年齢))
    .where(Date.today.year - Sequel.extract(:year,:birthday_ts) >= 30)
    .where(:gender_kbn => '00102')
    .all
