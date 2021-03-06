# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Commission.create(name: "お家訪問");
Commission.create(name: "草むしり");
Commission.create(name: "お墓参り");
Commission.create(name: "放射線測定");
Commission.create(name: "ペットの世話");

Area.create(name: "赤宇木")
Area.create(name: "井手")
Area.create(name: "請戸")
Area.create(name: "牛渡")
Area.create(name: "大堀")
Area.create(name: "小野田")
Area.create(name: "小丸")
Area.create(name: "加倉")
Area.create(name: "苅宿")
Area.create(name: "川添")
Area.create(name: "川房")
Area.create(name: "北幾世橋")
Area.create(name: "幾世橋")
Area.create(name: "権現堂")
Area.create(name: "酒井")
Area.create(name: "酒田")
Area.create(name: "下津島")
Area.create(name: "末森")
Area.create(name: "高瀬")
Area.create(name: "田尻")
Area.create(name: "立野")
Area.create(name: "棚塩")
Area.create(name: "津島")
Area.create(name: "中浜")
Area.create(name: "西台")
Area.create(name: "羽附")
Area.create(name: "昼曽根")
Area.create(name: "樋渡")
Area.create(name: "藤橋")
Area.create(name: "南津島")
Area.create(name: "室原（小伝谷６７）")
Area.create(name: "室原（その他）")
Area.create(name: "両竹")
Area.create(name: "谷津田")

Week.create(name: "月曜日")
Week.create(name: "火曜日")
Week.create(name: "水曜日")
Week.create(name: "木曜日")
Week.create(name: "金曜日")
Week.create(name: "土曜日")
Week.create(name: "日曜日")

user = User.create(
  email: "user@namie.jp", 
  password: '11111111'
)
user.user_profile.update_attributes(
  profile_image: "avatar1.png",
  name: "山田 太郎"
)

s1 = Supporter.create(
  email: "s1@namie.jp", 
  password: '11111111'
)
s1.supporter_profile.update_attributes(
  profile_image: "avatar2.png",
  name: "浪江 次郎",
  description: "よろしくお願いします。"
)
s1.supporter_areas.create(
  area_id: Area.order("RANDOM()").first.id
)
w = Week.order("RANDOM()").first.id
s1.supporter_services.create(
  week_id: w,
  start_time: [*6..10].sample,
  end_time: [*16..23].sample
)
s1.supporter_services.create(
  week_id: Week.where.not(id: w).order("RANDOM()").first.id,
  start_time: [*6..10].sample,
  end_time: [*16..23].sample
)
c = Commission.order("RANDOM()").first.id
s1.supporter_commissions.create(
  commission_id: c,
)
s1.supporter_commissions.create(
  commission_id: Commission.where.not(id: c).order("RANDOM()").first.id,
)

(1..100).each do |i|
  u = User.create(
    email: "user#{i}@namie.jp",
    password: '11111111'
  )
  u.user_profile.update_attributes(
    profile_image: "avatar#{[*1..5].sample}.png",
    name: Faker::Japanese::Name.name
  )

  s = Supporter.create(
    email: "s_#{i+1}@namie.jp",
    password: '11111111'
  )
  name = Faker::Japanese::Name.name
  s.supporter_profile.update_attributes(
    profile_image: "avatar#{[*1..5].sample}.png",
    name: name,
    description: "#{name}です。よろしくお願いします。"
  )
  s.supporter_areas.create(
    area_id: Area.order("RANDOM()").first.id
  )
  w = Week.order("RANDOM()").first.id
  s.supporter_services.create(
    week_id: w,
    start_time: [*6..10].sample,
    end_time: [*16..23].sample
  )
  s.supporter_services.create(
    week_id: Week.where.not(id: w).order("RANDOM()").first.id,
    start_time: [*6..10].sample,
    end_time: [*16..23].sample
  )
  c = Commission.order("RANDOM()").first.id
  s.supporter_commissions.create(
    commission_id: c,
  )
  s.supporter_commissions.create(
    commission_id: Commission.where.not(id: c).order("RANDOM()").first.id,
  )
end
