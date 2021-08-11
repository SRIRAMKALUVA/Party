require 'sequel'
DB = Sequel.postgres('Party',user:'postgres',password:'root@123',host:'localhost',port:5433,max_connections: 10)


t_member = DB[:t_member]

puts t_member.select(Sequel.as(:member_cd,:会員CD), Sequel.as(:gender_kbn,:性別区分), Sequel.as(:family_kj,:名前_姓), Sequel.as(Sequel.cast(:birthday_ts, :date),:誕生日)).where(:member_id => [2,3,4]).all
