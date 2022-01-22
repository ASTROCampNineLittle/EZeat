namespace :db do
  require 'faker'
  desc "產生假會員-公司-分店-方案-時段-日期ver3"
  task :new_all => :environment do

    # 產生n 個會員
    3.times do |n|
      User.create(name: "胖老闆#{n}",
                  email: "ezeat#{n}@mailinator.com",
                  password: '111',
                  password_confirmation: '111',
                  tel: Faker::PhoneNumber.cell_phone,
                  gender: (0..2).to_a.sample
                  )
    end

    # n 個會員各產生1 間假公司
    us = User.all
    us.each do |n|
      n.create_company(name: "瘦老闆集團#{n}",
                        address: Faker::Address.full_address,
                        tel: Faker::PhoneNumber.cell_phone,
                        manager_name: Faker::Games::Pokemon
                      )
    end

  p "建立3 會員、3 公司"

  district = [ "大安", "天母", "文山", "信義", "中山", "南港", "中華", "臺大", "師大", "文大", "政大", "中正", "大同", "微風", "松山", "士林" ]

  chinese_store_name = ["漉海邊蒸氣鍋","森林夜總會 - The Lin 台中林酒店","開飯大食堂","來來海港餐廳","彩匯 - 台北美福大飯店","凱菲屋 - 台北君悅酒店","翡翠廳"," La Rotisserie - 君品酒店","Mega 50餐飲及宴會","新竹喜來登大飯店" ]

  japanese_store_name = ["小鶴日本料理餐廳","鮨老大 日本料理","大車輪 日料岩酒所","極醬太郎日式燒肉","大正浪漫日本料理","饗食天堂","村民食堂廚窗港點","果然匯 - 夢時代店","上村牧場","上村牧場" ]

  korean_store_name = ["Popcorn 韓式熱炒","水剌韓式餐廳 Surah Korea Cuisine","韓國民俗村餐廳","韓之棧餐坊","GiLiGiLi 韓國釜山餐酒館","啾哇嘿喲 韓式烤肉專門店","三角三韓國道地烤肉","韓風館","咚咚家韓式豬肉","兩班家韓式碳烤" ]

  indian_store_name = ["阿里吧吧印度咖哩坊","新德里道地印度餐廳","孟買高級印度餐廳","馬有有印度廚房","印度皇宮餐廳","泰姬瑪哈頂級印度餐廳","Amazing印度甩餅專賣店","巴拉拉南洋風味印度餐廳","薩爾達印度餐廳","林克印度餐廳" ]

  italian_store_name = ["RURU義大利餐廳","托斯卡尼義大利麵","奇諾披薩屋","威尼斯義大利麵工坊","穆拉諾咖啡館","義麵房","DA ANTONIO 大安東尼","福迪兄弟 Foodie Bro Brunch","義麵盒子","翡冷翠義大利菜" ]

  british_store_name = ["GIVE ME PIE","The 59 Bar 英式餐酒館","英國外婆•午茶•司康 Britshake2","GATESTW紳士餐廳","Fish & Chrispy 餐廳","the kitchens table 西餐廳","慕拉西式餐廳","Richart delicious 西式餐廳","雅莉姍大英式料理","冒險者餐廳" ]

  american_store_name = ["Chili's奇利斯美式餐廳","ABV 美式餐酒館","H&W Restaurant and Bar","發福廚房","金色三麥","樂子 the Diner","夢鹿咖啡 by tame moose","兔子兔子美式餐廳","Toasteria Cafe 吐司利亞","JB's Diner" ]

  french_store_name = ["Le Partage 樂享大大大廚房","Petit France 快樂法國餐館","歌德法式餐廳","上餐囉!!Viva la fete","巴賽隆納 La Brasserie","法式派翠克先生餐廳","Tah-Dahh 桌藏餐廳","盧卡盧卡法式小館","RéeL法國鄉土料理","Podium 無菜單料理" ]

  germany_store_name = ["天鵝堡德國豬腳","歐嬤嬤德式美食","獅子吧德國餐廳","普魯軾歐式美食","天母煙燻小棧","景色三麥德式餐廳","Germany Sussssssages","NoName咖哩奶奶","Schuyumm's Bistro","德國農婦廚房" ]

  mexican_store_name = ["EDDY'S CANTINA - 艾迪墨西哥餐廳","The Hammer","Tame Moose","馬丘墨式餅鋪","Teotihuacán 特奧蒂瓦坎 墨西哥料理","NALA's Mexican Food","Macho Tacos - Shida","Taco Taco Mexican Restaurant","邊界驛站","卷卷小姐" ]

  other_store_name = ["誠記","L.A PHO 越南美食餐廳","Koka庫咖","烏司答土耳其居家香料料理餐廳","捷克公寓","香港特別行運冰室","【Mamak檔】星馬料理","希臘左巴","1001 Nights Kitchen (一千零一夜廚房)","俄羅斯城堡 Russian castle" ]

  address = ["台北市中山區松江路76號1F","台中市西屯區朝富路99號","台北市大同區承德路一段1號B3","高雄市左營區博愛二路777號5樓","彰化縣員林市中山路一段822號","台北市大安區忠孝東路四段216巷19弄9號","台北市中山區長春路318號","台北市大安區延吉街121號","台北市松山區光復北路12號","台北市松山區南京東路5段75號","台北市松山區光復北路16號","台北市松山區南京東路4段75號","台北市大安區延吉街123號","新北市板橋區文化路二段476號","新北市板橋區文化路二段200號","台北市中山區長春路218號","台北市中山區民生東路二段178號","台北市中山區中山北路2段11巷7-1號","台北市中山區林森北路353巷20號","台北市中山區新生北路二段76巷32號","台北市中山區中山北路一段33巷28號","台北市中山區吉林路315巷40號1樓","台北市中山區撫順街10之2號","台北市中正區漢口街一段 15 號 1 樓","台北市萬華區開封街二段58號","信義區基隆路一段147巷28號一樓","台中市北區育才街8號","台北市信義區忠孝東路五段 10 號","花蓮縣花蓮市中美路142號","台北市松山區民生東路三段135號2樓","台北市中山區長安東路一段27號B1","臺中市西區梅川西路一段5、7號","台中市河南路三段120號2樓","台北市大安區敦化南路一段236巷16號","新北市新店區北新路三段65巷5號","台北市中正區羅斯福路四段44之1號2樓","新竹縣竹北市莊敬北路18號7F","台北市士林區天母東路63號","新北市中和區文化路9巷16弄14號","台北市中正區羅斯福路一段7之1號","臺北市信義區嘉興街175之6","106台北市大安區溫州街74巷5弄","台北市大安區敦化南路一段𝟷𝟾𝟽巷𝟽𝟸號𝟷樓","台北市羅斯福路三段283巷7弄16號","105台北市松山區八德路四段616號","106台北市大安區羅斯福路三段333巷14號" ]

  p "開始建立分店"

    # 3*5 = 15 間
    com = Company.all
    5.times do
      com.each do |chinese_s|
        chinese_s.stores.create(
                name: chinese_store_name.sample+["-", ":"].sample+district.sample+["店","館",""].sample,
                food_type: 0,
                address: address.sample,
                tel: Faker::PhoneNumber.cell_phone
                )
      end
    end

    com = Company.all
    5.times do
      com.each do |japanese_s|
        japanese_s.stores.create(name: japanese_store_name.sample+["-", ":"].sample+district.sample+["店","館",""].sample,
                        food_type: 1,
                        address: address.sample,
                        tel: Faker::PhoneNumber.cell_phone
                        )
      end
    end

    com = Company.all
    5.times do
      com.each do |korean_s|
        korean_s.stores.create(name: korean_store_name.sample+["-", ":"].sample+district.sample+["店","館",""].sample,
                        food_type: 2,
                        address: address.sample,
                        tel: Faker::PhoneNumber.cell_phone
                        )
      end
    end

    com = Company.all
    5.times do
      com.each do |indian_s|
        indian_s.stores.create(name: indian_store_name.sample+["-", ":"].sample+district.sample+["店","館",""].sample,
                        food_type: 3,
                        address: address.sample,
                        tel: Faker::PhoneNumber.cell_phone
                        )
      end
    end

    com = Company.all
    5.times do
      com.each do |italian_s|
        italian_s.stores.create(name: italian_store_name.sample+["-", ":"].sample+district.sample+["店","館",""].sample,
                        food_type: 4,
                        address: address.sample,
                        tel: Faker::PhoneNumber.cell_phone
                        )
      end
    end

    com = Company.all
    5.times do
      com.each do |british_s|
        british_s.stores.create(name: british_store_name.sample+["-", ":"].sample+district.sample+["店","館",""].sample,
                        food_type: 5,
                        address: address.sample,
                        tel: Faker::PhoneNumber.cell_phone
                        )
      end
    end

    com = Company.all
    5.times do
      com.each do |american_s|
        american_s.stores.create(name: american_store_name.sample+["-", ":"].sample+district.sample+["店","館",""].sample,
                        food_type: 6,
                        address: address.sample,
                        tel: Faker::PhoneNumber.cell_phone
                        )
      end
    end

    com = Company.all
    5.times do
      com.each do |french_s|
        french_s.stores.create(name: french_store_name.sample+["-", ":"].sample+district.sample+["店","館",""].sample,
                        food_type: 7,
                        address: address.sample,
                        tel: Faker::PhoneNumber.cell_phone
                        )
      end
    end

    com = Company.all
    5.times do
      com.each do |germany_s|
        germany_s.stores.create(
                        name: germany_store_name.sample+["-", ":"].sample+district.sample+["店","館",""].sample,
                        food_type: 8,
                        address: address.sample,
                        tel: Faker::PhoneNumber.cell_phone)
      end
    end

    com = Company.all
    5.times do
      com.each do |mexican_s|
        mexican_s.stores.create(name: mexican_store_name.sample+["-", ":"].sample+district.sample+["店","館",""].sample,
                        food_type: 9,
                        address: address.sample,
                        tel: Faker::PhoneNumber.cell_phone
                        )
      end
    end

    com = Company.all
    5.times do
      com.each do |other_s|
        other_s.stores.create(name: other_store_name.sample+["-", ":"].sample+district.sample+["店","館",""].sample,
                        food_type: 10,
                        address: address.sample,
                        tel: Faker::PhoneNumber.cell_phone
                        )
      end
    end

    p "初步產生假分店結束，開始建立方案"

    dish_name = ["午間套餐","午間商業套餐","方案名稱","平日晚間套餐","平日舒壓套餐","朋友聚餐方案","冒險多人套餐","皇家紅茶套餐","特選套餐","商業聚餐","情人精緻晚餐","晚上約會套餐","晚餐浪漫約會方案","創業者海陸大餐","週末精緻晚餐","農曆新年專屬方案","過年特別方案","道地英式下午茶套餐","團體聚餐方案","闔家精緻晚餐"]

    store_number = Store.count
    1.upto(store_number) do |n|
      Dish.create(name: dish_name.sample,
                  price: [399, 599, 699, 799, 999, 1024, 1999].sample,
                  status: 1,
                  store_id: n)
    end

    p "初步建立方案完畢"

    date_pick = []
      nob = 1
      while nob < 45
        date_pick << (Time.now+nob.day).to_date
      nob = nob + 1
      end

    dish_number = Dish.count
    1.upto(dish_number) do |n|
      OpenDate.create(availible_date: date_pick.sample,
                      dish_id: n)
    end

    p "所有方案至少都有1 日期"

    1.times do
      1.upto(dish_number) do
        OpenDate.create(availible_date: date_pick.sample,
                        dish_id: rand(dish_number))
      end
    end

    2.times do
      1.upto(dish_number) do
        OpenDate.create(availible_date: date_pick.sample,
                        dish_id: rand(1..dish_number))
      end
    end

    p "已完成建立部分方案能有多天"

    time_pick = ["11:00", "12:00", "13:00", "14:00", "15:00", "16:00", "17:00", "18:00", "19:00", "20:00", "21:00"]
    capacity_pick = [5, 10, 15, 20, 25, 30]

    opendate_number = OpenDate.count
    1.times do
      1.upto(opendate_number) do
        Offer.create(availible_time: time_pick.sample,
                      open_date_id: capacity_pick.sample)
      end
    end

    p "所有offer 至少都有1 時間"

    2.times do
      1.upto(opendate_number) do
        Offer.create(availible_time: time_pick.sample,
                      open_date_id: rand(1..opendate_number))
      end
    end

    p "已完成間裡部分offer 有多個時間"

    p "開始根據分店food_type 塞假照片及說明......"

    # ！！！這區要更新！！！
    chinese_store_intro = [ "漉，完封精華之意。
    從嚴選食材來源到獨特蒸氣烹煮方式
    將大海珍貴的美味完整封存
    讓每一口體驗，都是飽滿鮮美
    現在，您味覺的海洋之旅即將展開！","品牌經典餐廳森林夜總會，全日供餐時段皆提供超過百道佳餚。
    當令肥美海鮮、現切排餐、主廚推薦菜色、多國特色美饌、人氣西點蛋糕等，深獲饕客喜愛。","開飯大食堂，
    一個讓你隨時胃口大開的辛香食堂。
    承襲福利川菜四十年的正統手藝，認真選用天然食材，巧妙調配複雜多樣的辛香料，下手刀工精細，快火燒煎炒，用最熱血的心，為你端上翻騰味蕾的川正味料理。

    透過講究的味型、用料、工法，鮮香麻辣的川菜，千年來人氣歷久不衰。開飯保留了川正味瞬間爆發的食感，以輕鬆新穎的方式上菜，就像一個熱情奔放的好朋友，歡樂相聚，暢快上癮。你真的可以感受到每一口裡都有我們的用心，所以，每一口都吃得很開心。

    鮮香麻辣正川味～請你來開飯！"]

    japanese_store_intro = [ "在地經營20年，體驗日本居酒屋文化，林森北超日式榻榻米和風居酒屋，日本人下班後都來這！","西門町50年日式料理老店『 大車輪』於臺北市南西商圈(中山捷運站)傾心打造全新型態「食」驗場域-強化味覺與視覺的共感體驗，品嚐當令食材的新鮮及精心擺盤。
    大車輪的老口味不變 ， 繼續讓您品嘗延續了半世紀的好味道 ， 更集結了各領域的專業人才 ， 融合日式料理、時尚餐具、創意擺盤、專業調酒、調茶飲品、品飲活動、包廂餐敘、庭園宴會、聯名合作、品牌發表等 ， 在全新的場域為您呈現耳目一新的 『 大車輪-日式餐酒』的 『 新食理念』 。
    大車輪餐飲集團成立於1976年 ， 創始本舖『西門町火車壽司 』(峨眉店)是那個年代許許多多青少年、 家庭、 饕客慕名而去的日式料理餐 ， 陸續開設漢中店、 大安店、 仁愛店、 重慶南路店、 中山北路店等各俱特色的分店。
    『 大車輪-火車壽司本舖』 ， 更是全台灣第一間以 『 火車載運壽司』為主題的日式料理餐廳 ， 日式板前的火車 ， 載著各式的美味及客人的回憶 ， 奔跑了近50年從未停歇 ， 未來還會繼續乘載美食、記憶、歷史不停地前進 。","大口吃肉盡情喝酒
    肥美的肉片在烤網上噗滋噗滋作響
    每日特選海鮮在舌尖上舞動
    還有人人愛的哈根達斯向您招手
    給您最頂級的享受~~"]

    korean_store_intro = [ "Pocha[포차]
    포장마차(布帳馬車) 的簡稱，就是傳統韓國熱炒或路邊攤，可以豪邁的大口喝酒、大口吃肉，是韓國道地美食、歡樂、相聚的代名詞。","頂級的服務·貴族的饗宴·享受韓式烤肉的最佳選擇 — 兩班家韓式碳烤
    「兩班」 意指古代朝鮮的貴族，而「兩班家」的創立，則是希望每一位蒞臨用餐的顧客，因為我們用心的服務與一流的食材，宛若受邀了一場豪門貴族的頂級盛宴。
    為了完美呈現每一道食材的風味，現場除了提供專業的燒烤服務之外，我們的「水冷專利烤爐」讓烤網表面維持在完美的60°C，有效的將肉汁完美鎖在烤肉內，還有不易黏網的特性與減少的油煙，都是為了將每一份食材完美轉化為美味饗宴的用心。
    來兩班家，讓我們帶著你領略韓式碳烤的獨特魅力。"]

    indian_store_intro = [ "印度料理的主食包括稻米、小麥、珍珠粟，以及豆類，如小扁豆。這些豆子有的被剝去豆莢，有的連種皮也剝去，這種被剝去種皮的豆子可以直接烹飪無需泡發，應用很廣，多被做成豆糊或豆湯。一些莢豆，如鷹嘴豆、芸豆和黑眼豆也十分常見（特別是北印度）。鷹嘴豆和綠豆也會被製成豆粉。不少印度料理用植物油烹飪，其中西、北印度多用花生油，印度東部多用芥子油[11]，印度最南端的喀拉拉邦和泰米爾納德邦流行椰子油。[12] 因芝麻油有強烈的堅果香氣，故在南印度很常見[13] 21世紀以來，葵花籽油、棉籽油、紅花籽油和大豆油也在印度逐漸興起[14]替代黃油的氫化植物油也開始流行","若提到台北印度料理，想必很多人第一時間一定會想起超高人氣的這間餐廳，開設了多家分店，內湖區、信義區、東區都有他們家的影子，可說是知名度超級高的印度餐廳！廚師是出自於「五星飯店」之後就選擇自己創業，可說是非常成功的企業家","一個熱愛中華文化的印度留學生，由於在異地少有機會吃到家鄉菜，在2004年，決定自己開設印度餐廳。 他將思鄉的情緒化做動力，用獨門菜單和家族傳承百年的香料，以五星級的製程，用心做出最道地的印度料理。老闆說，除了用這種方式思念家鄉外，他更有著一股使命感，要讓台灣人吃到最道地、最好吃的印度料理，把家鄉的美味推廣給大家知道。" ]

    italian_store_intro = [ "沒有昂貴的裝潢 只有簡單黑白格調
    高級食材滿街都是 我們只有新鮮食材
    不拘謹的用餐環境 是我們給你最親切的服務
    期待你來一起感受我們的用心

    我們大小通吃
    只怕你不吃
    期待與你創造更多的故事","無論是義大利麵、義大利燉飯、濃湯、麵包、沙拉、前菜、美味主菜、特色外賣商品等等義式料理，食材品質均嚴格管控。致力於將精緻的義式料理口味大眾化、推出種類選擇多樣性真材實料的美味料理，以滿足每位饕客對義式美食的講究，帶給您最難忘的品味感動。","傳統義大利石窯披薩、採用手工拍皮、爐火高溫烘烤，製作出皮薄香脆的餅皮。
    義大利麵採用純手工麵體、別於一般機器麵，手工麵完整呈現了麵條的Q彈和嚼勁。","威尼斯的香料秘方，或濃郁美味的焗奶，口口都有驚奇的發現，每道義式料理除了講究色香味，更給來店裡的客人都吃得有營養、開心、健康。","全台首家按摩結合餐食(商業午餐/輕食/下午茶)！享受高級按摩椅不用買來放家裡、14萬元貴婦按摩椅、舒壓眼罩、紓壓香氛環境安靜不受打擾、上班族小憩、家庭主婦舒壓、新型睡眠品質好享受來小憩咖啡館體驗眼皮到腳底，一次全部都放鬆！
    全台獨家，全館採用14萬元Tokuyo貴婦級平躺式全自動按摩椅","適合聚餐類型
    浪漫約會, 商業聚餐, 家庭聚餐, 團體聚餐, 朋友聚餐, 生日慶祝","源自於隨意鳥地方101餐飲團隊，首次跨足飯店餐飲服務，提供義大利麵、燉飯、碳烤牛排等招牌料理。邀請您置身於寬敞典雅的空間，品味精饌美酒，享受愜意怡人的片刻時光。

     ","位在行天宮附近的「福迪兄弟」是一間平價的早午餐店，餐點主要提供早午餐、漢堡、美式蛋捲、熱壓三明治、義大利麵、燉飯、沙拉與甜點，豐富多元的選項，可以滿足饕客的味蕾。最新推出的菜單有以松露為主軸的漢堡、燉飯及薯條，早午餐也升級為有牛排的早餐!如果你愛吃松露或牛排，怎能不來福迪吃吃看!","堅持平價又健康美味的餐點是我們的宗旨，誠摯邀請您來一同享用！","全天候以精緻的義法料理手法呈現嚴選當季食材, 供應天然、新鮮、健康與獨特的美味食物，每日手作酵母餅皮 pizza、經典義大利麵與前菜輕食。
    ★嚴選時令食材，多元創意的料理手法，品嘗一口時髦碰撞傳統的新滋味，令人驚豔！
    ★講求天然、新鮮、健康與獨特的美味，每日手作酵母餅皮 pizza
    ★用物超所值的價格，享受道地義式料理" ]

    british_store_intro = [ "給我派，給你最有心意的鹹派。
    全手工製作派皮，特別採用了法國進口的奶油，烤出來的派皮層層酥香，內餡取材自各國的招牌料理，讓每一份鹹派，都擁有最完美的風味。
    金黃酥脆的手工派皮搭配上無國界的創意內餡，
    每一款鹹派都是經過不斷的嘗試，
    用心調整成最好、最想呈現給大家的味道。
    派皮採用法國進口奶油，
    搭配上各國的招牌料理作為餡料，
    顛覆你對傳統鹹派的刻板印象，
    讓我們用獨特又創新的組合，
    帶給你前所未有的味覺饗宴。","58是全台唯一只賣台灣精釀啤酒的英式餐酒館，有超過100種精釀啤酒，加上道地的英國餐點。不收服務費也沒有用餐時間限制。","由曾是2006全英國餐飲學院第一名的Amy Elizabeth Rattigan 所主持。

    專賣英國風味餐：英式燉菜、傳統英式三明治、英式奶昔、正統英式馬鈴薯、手工甜點、經典司康......等！
    道地的英國美食挑戰各位的味蕾!!!","透過這扇門，連結兩個不同空間
    彷彿帶領你進入另一個時空
    讓你彷彿來到歐洲喝下午茶的感覺","Traditional British afternoon tea.
    Homemade scones, homemade jams and clotted cream
    We serve Fortnum and Mason tea.","在廚桌餐廳，您可以享用到來自各國的精緻美食佳餚，採用明亮輕快的花園空間設計，以鮮明的嫩黃色與清爽的白色為主，添加時尚現代氣息，牆上蝴蝶造型的瓷盤裝置藝術向外飛去，環繞台北W飯店，象徵此餐廳自然迷人的風采。","嚴選當季新鮮食材，以多元創意手法烹調，供應自助式早餐以及套餐式精緻午晚餐。設有140個座位區，以咖啡色木紋與純白牆面點綴海洋元素，自大廳延伸入內大片落地窗，為每道餐點打上自然光，呈現寬敞明亮的用餐環境。全新的中式料理，採現點現做手感快炒烹飪。餐點運用在地食材，主廚特製醬汁及大火爆香快炒，讓料理呈現最佳原味和口感，鹹香涮口。","座落在五星飯店壹樓，鄰近台北美術公園，優雅精緻、南歐風情的地中海牛排館，每晚牛排主廚為您準備精選美澳知名牧場的頂級自然牛，再經過一段時間的熟成，強化牛肉的飽滿肉汁及香嫩鮮甜的口感，搭配屋頂花園自栽的有機香料入味，呈現頂級的美味牛排，期待您的蒞臨品味。","餐廳的風格與裝潢也是創始老闆一手打造，暗紅色的地毯搭配墨綠色的檯布，是本店低調的華麗氣場；磁磚桌面裝上海綿軟墊、椅腳從筆直改為有爪設計，是亞里士以客為本的原則。
    每張桌上都整齊擺放著日本進口的餐具，木質握把包覆著金屬刀叉，鎢絲燈透出暖色燈光，整體有一種特別的中古歐洲風情。
    餐廳如一座時光機，老客人來復刻回憶，新客人來體驗回憶","占地150坪的國美店，與台中文化中心、國美館比鄰而居，環境優美充滿文化氣息。冒煙的 喬國美店外觀以綠色植物環繞建築，店內裝設、擺飾或傢俱，均來自集團蒐集於各國多年的珍藏品，及卸任餐廳所留下珍貴舊建材。此外，冒煙的喬國美 店牆上有一個「全台最大的彈珠台」，完全以舊建材及餐具製作，不僅創意十足，也蘊含著 濃濃的歷史味。" ]

    american_store_intro = [ "已超過40年歷史的Chili's奇利斯美式餐廳，一直竭盡心力，用最大的服務熱誠，帶給每位客人愉悅的用餐時光。秉持這樣的理念，我們提供了美味且多樣的開胃菜及主菜，清涼的飲品，及各種令人食指大動的甜點。因為這樣的堅持，我們滿足了無數張挑剔的嘴，舉辦過數不盡的歡樂聚會，而店內也總是無時無刻傳來此起彼落的笑聲。至今，Chili's奇利斯美式餐廳在全世界33個國家已經超過1,600家分店。 Chili's奇利斯美式餐廳起源於德州達拉斯，從一家將漢堡放在籃裡並附上一小盅辣味牛肉醬給客人的漢堡店發跡至今。儘管Chili's奇利斯美式餐廳不斷的推層出新，但是我們更希望讓客人品嚐到份量十足、原汁原味的道地美式餐點，也希望能繼續將這個傳統的美國西南精神品牌介紹給客人。時至今日，您依然可以享用到讓我們聲名遠播的大嘴漢堡，沁心冰涼的瑪格麗特調酒與各式啤酒。或者，你也可以讓自己的味覺沉淪於我們的傳統西南風味餐點，例如:著名的碳烤豬肋排，鐵板法士達及火烤牛排。當然，我們不只是提供這些美味的餐點，我們更致力於為您創造許多歡樂的時光。這就是為什麼您會發現在即使經過歲月的洗禮，Chili's奇利斯美式餐廳依然能夠傲視群雄,承襲老美國的靈魂，挖掘美式原生料理,料理上我們追尋很美國的美國的味道，裝潢設計上，以淘金潮的十九世紀為發想，搭配各州獨有的烤肉風、一州一料理的鄉村菜。讓味蕾牽引著你，在繁華的台北中，也能感受到一絲舊時代的美國氣息！","H&W是Home & World的簡寫，命名的來由是老闆希望到店用餐的顧客，能夠將這裡當成自己的家，放下所有包袱盡情享受用餐的片刻。每個禮拜六會有啤酒王的活動，跟店員PK喝啤酒，禮拜日的部分是現場駐唱，可以體驗到LIVE駐唱。","台灣創始花生醬牛肉堡，北部最知名火烤美式漢堡、純手工美式漢堡、獨家義大利麵／焗飯。我們致力於成為台灣美式火烤漢堡的領導者!「發福．口福．幸福」這份幸福及感動來自於我們的堅持!在Bravo Burger每一道餐點都是100%現作特製黃金比例的澳洲純牛肉無其它添加物,只用少許鹽和胡椒提味堅持不添加一滴油的鑄鐵火烤方式,純粹的多汁原味!食材每日新鮮配送,美味醬料自家新鮮手工製作尊重食材的本質,用心在每個細節這就是我們餐點特別美味的原因!『把自己最喜愛的才分享給您』是我們的理念,『貼心、熱情、真誠』是我們服務的信念,來發福我們想要傳達給您的不只是來自食物的感動更重要的還有人與人之間互動的溫度,期許您來用餐能夠感受到滿滿的幸福哦!","在廚桌餐廳，您可以享用到來自各國的精緻美食佳餚，採用明亮輕快的花園空間設計，以鮮明的嫩黃色與清爽的白色為主，添加時尚現代氣息，牆上蝴蝶造型的瓷盤裝置藝術向外飛去，環繞台北W飯店，象徵此餐廳自然迷人的風采。","本土自創品牌之美式早午餐先驅者the Diner樂子餐廳，自2006年創立至今，掀起國內美式早午餐風潮，打造如置身美國All Day Dining的美式休閒用餐風格，並被票選為臺北必吃10大早午餐之一，其道地的美式風味，常受到外國朋友們在社群讚賞及肯定，也是許多藝人名人及美食愛好者的口袋名單，更是廣大喜愛早午餐朋友們歡聚首選的排隊餐廳。 招牌餐點，班尼迪克蛋多達6種口味，層次豐富，是客人必點的項目之一 業界首創『高度客製化』的優質餐點，完美配合現代人的飲食需求；近年來致力推廣健康飲食風潮，吃食物不吃食品，並提倡台灣在地食材，如豪野鴨、客家鹹豬肉等，重新演繹新生代美式料理，期望帶給消費者與海外零秒差的餐飲體驗。","Kinfolk Co. 樂於分享一種享受慢活、輕鬆和不拘束的生活態度。天母一店Kinfolk Cheese& Coffee隱身於巷弄社區中跟左鄰右舍打成一片，我們在這個場域、交會、認識、享受快樂的時光。拜訪這裡之前，我們都是陌生人，離開這裡時，我們卻都有了共同的回憶。也因為這樣與家人般親切自在的熟悉感，讓我們再訪與認識更多的新朋友。在這樣快速繁忙的社會中，我們只追求簡單、樸實與純粹，保留能讓您感到最舒適的環境與餐點。除此之外，我們更想做的是營造一種緣起於澳洲與歐洲的咖啡與茶文化，一種類似共同＆分享的概念。這些飲料舒心了每位來訪的客人，放鬆之際，也提供大家交談的機會。中山二店tame moose是延續Kinfolk分享親近關係精神的西餐小酒館，主要以西式餐點為主，有時也會調皮地以中式手法入西式菜色，創造味蕾更多豐富的滋味。多種國外進口新鮮生啤酒、精釀啤酒與奶油啤酒特調，也是人氣必點。店名tame 是馴養的意思，在小王子Le petit prince故事中則是指一種建立關係的過程。只有被馴服過的人事物，才有可能瞭解其本質。透過tame的過程，人事物對彼此的意義產生改變，就像玫瑰在小王子眼中般地特別。Moose為鹿的意思，選擇梅花鹿的原因，就像Kinfolk Cheese&Coffee的台灣黑熊圖案一樣，為了喚醒台灣當地的特色，表達我們對這塊土地的珍惜。","Toasteria Cafe不只是一間餐廳或是咖啡廳，吐司利亞帶給您的是一趟通往美麗地中海國度的旅程。帶你進入這個放鬆的空間是一系列完美和諧的組合：在經典的空間設計享用療癒的道地地中海料理，體驗優質貼心的服務，精挑細選的世界音樂，彷彿真的來到了地中海。對於屋內各個角落的設計細節以及結合新與舊的建材，我們團隊都抱持著堅持的態度，因為這樣的理念才能帶您踏上這趟地中海時光之旅。一個經典與現代組合的地中海設計，圍繞著您的是花園的天然綠色夢境。Toasteria Cafe是一間以開放的心態讓我們的菜單由不同文化背景豐富我們地中海風格的廚房。有來自以色列、摩洛哥、埃及、希臘、西班牙、法國、義大利的味道，一次達成造訪各個國家的夢想。Toasteria Cafe是您可以在台北市逃離繁忙市區的浪漫蔽所。在Toasteria Cafe，我們認為再細小的環節都是創造舒適、有趣、盡情享受的重要因素。","天母老牌美式早午餐餐廳，之前位在新光三越後面巷內，2018搬到目前的天玉街，占地廣大且擁有綠意庭園，與天母悠閒的異國氛圍融合得超級完美。JB是店家祖母的英文名字縮寫『Judy & Bert』而成，因為從小在這一帶成長的地緣關係，選擇回天母開店。對老闆來說JB不只是一間餐廳，而是伴隨著兒時記憶、家人情感而誕生的一個角落，對客人來說則是天母一個氣氛極佳的飲食休憩之處。提供種類豐富的美式餐點與美式早午餐，親子友善之外也是寵物友善餐廳(可攜帶寵物但不可上桌)。" ]

    french_store_intro = [ "選址綠意盎然的民生東路，予人舒適之感。L是東主的名字，他同時經營時尚的蘭餐廳，兩者相比，這兒的布置更顯古典。精煉的法式料理風格現代、賣相不凡，且融入日本元素。滋味豐富的晚間套餐含六道菜色，午餐時間人潮不斷，菜單選項更具彈性。開放式廚房讓你窺見廚師團隊大顯身手的過程。", "入口處流水潺潺，小徑上鋪滿古董瓦片，進入這所有八十年歷史的日式建築，木製橫樑和懸垂燈飾營造出新舊對比強烈的特別氛圍。廚師以大量在地食材將臺式元素糅合法式料理中，拼湊出味道、口感皆非比尋常的菜色。午餐和晚餐分別提供五或七道菜的套餐，服務團隊默契十足", "Lopfait精緻的用餐空間，一走入便會讓你感到驚喜。空間配色以璀璨金、優雅白與沉穩的灰階為主色，北方可眺望不遠處的劍南山，東邊則是都會景致。餐廳備有四間包廂，兩間6人和兩間10人包廂，亦可打通變成一間可容納12人的長桌包廂和20人的圓桌包廂，而開放用餐區以兩人座方桌為主，非常適合情侶或摯友聚餐！", "位在捷運忠孝敦化站附近，5號出口步行約2分鐘即可抵達，主廚林明健 Chef Kin 旗下的三間餐廳，不僅Longtail 再次獲得米其林一星的殊榮，WILDWOOD 與 Chou Chou 也皆獲米其林餐盤推薦，Chef Kin 的深厚功力讓小J 十分祟拜，希望以後也能有機會拜訪另兩間餐廳", "裡頭的落地透明酒窖，針對台灣高溫多濕環境設計，提供穩定恆溫恆濕的儲酒環境，且擁有超過600瓶收藏。選酒著重在風味與搭餐，除了法國名莊外，產區更涵跨五大洲，甚至包含台灣、泰國日本等小眾但獨特的產區。飲品不只葡萄酒，也涵蓋清酒、烈酒以及各式調飲等，提供多元搭餐變化！", "以法式烹調為底蘊，展現台灣食材特色。主廚適時適地運用台灣食材，搭配法式廚藝，巧妙組合排列，呈現經典卻不拘謹的料理。而主廚靈感大多來自旅行或大自然的啟發，希望運用多項台灣本地豐盛的物產，也將烹調回歸簡單、純淨！在此次開幕的秋季菜單中，饕客們也可以品味到主廚的想法貫穿呈現。" ]

    germany_store_intro = [ "位於捷運東門站永康街的巷弄內德式餐廳，提供經典德式料理，店內最熱門的就是脆皮豬腳，份量絕對滿足，搭配麵包、沙拉、湯、甜點的套餐組合，相當划算。", "德國豬腳，Schweinshaxe。這是道標準的德國菜，烤的焦香酥脆的豬腳一切開那個肉香，然後配上點黃芥末再搭些德國啤酒，實在太棒了", "一間真正的德國豬腳。老闆是德國人，巴伐利亞人。當然我們就不談巴伐利亞的德國豬腳才是最好的這件事(大笑)想在這邊吃德國豬腳，你得先訂。理由也很簡單，現作現烤，不在兩小時前先訂好，你就吃不到。比起一般的德國豬腳你一定要用黃芥末來解膩，這間是整根豬腳小編可以直接吃完的美味豬腳", "台北市最老牌的德國餐廳，最早台北德國人與瑞士人的聚會所，少帥張學良與蔣緯國都吃過的美味德瑞餐廳，搬過好幾次家，曾經在條通附近，現在在吉林路上好吃又老牌的德國豬腳，裝璜考究，木門還都是從德國來的，很厲害的德國瑞士菜值得一試", "有道地的德國美食，舒適的用餐空間，很有名的德國豬腳，可以在台北列進前幾名。，麵包與蛋糕也是很受歡迎的餐點，每天供應上百種現烤德國糕點，現烤的就是好吃。來這裡吃個飯，或喝個德國啤酒，最後買個麵包回家，超棒的", "鄉村風格德式老店，套餐相當划算，豬腳又很大隻，算是很經濟實惠的美味餐點，在天母也是開了很久，在天母想吃德國豬腳與香腸很棒的店家"]

    mexican_store_intro = [ "艾迪墨西哥餐廳源於2007年,那時只是一間在淡水老街賣墨西哥捲餅的小攤販。雖然生意很好，但艾迪跟他妻子Jo經過一番討論後，決定經營一間可以提供給客人更多墨西哥風格道地美食的餐廳，於是他們搬離了夜市，開了一間小餐廳。餐廳有著更多元的菜單、少許的座位，希望能讓來到餐廳的客人感受到彷彿置身於墨西哥般的舒適。所有艾迪墨西哥餐廳的食譜都是代代相傳下來的。我們的使命是提供給每位踏進餐廳的客人最真實、最具有家鄉味的手工墨西哥料理。我們想要給任何願意嘗試墨西哥料理的顧客試試我們岡薩雷茲(Gonzalez) 家傳的墨西哥風味料理。","艾迪墨西哥餐廳所使用的所有餅皮都是現點現做，莎莎醬也是每天採用當地食材新鮮製作而成，只為確保我們能提供最高品質的墨西哥料理。所有的料理都不含防腐劑，讓您跟您的家人吃得安心、吃得健康。我們一直致力於提供新鮮、健康、美味的墨西哥美食給所有客人，快來一同吃吃看吧!","位於靠近仁愛圓環的巷弄內，從忠孝敦化站步行約5分鐘，星期日～二營業時間是11:30–22:00，星期三～六為11:30–23:00，下午沒休息，餐間想要找個休息的地方也可以來，我們那天就是下午四點左右來的，店內只有兩組外國人，避開用餐尖峰時段空間很舒服。店名〈Teotihuacan〉中文可直譯為「特奧蒂瓦坎」，是一個位於墨西哥谷旁的印第安古文明，大約與瑪雅文明同期，其建築遺蹟所在地「聖胡安特奧蒂瓦坎 San Juan Teotihuacan」也是因此命名。平日低消為200元，假日300元，這個標準還挺好達到的，雖然寫限用餐兩個小時，但如果還有空位的話想要多留沒問題。順道一提，〈Teotihuacan〉的老闆娘應該是墨西哥人，服務生中文、英文、西班牙文都可以通，菜單有英文，很適合帶外國朋友來喔！" ]

    other_store_intro = [ "誠記越南麵食館 創立於1980年創始人是越南華僑杜氏夫婦，草創時期在台北市永康街的一角以麵攤方式販售道地的越南河粉及簡單小菜，老闆娘笑稱剛開始擺攤的時候雖然只有五張板凳，而且賣的東西台灣人沒聽過也沒吃過，但是只要路上還有一個人即使已是深夜她也不願意熄燈，就怕錯過了生意機會。有時生意做到一半警察還會來開罰單，當天就白做了。另外30幾年前的路邊攤普遍都是一整天用一桶水洗碗及清潔，天生就愛乾淨的老闆娘雖然生意不是太好，但還是忍痛跟旁邊的店家租了一根水龍頭，因為這樣就有自來水洗抹布及洗碗，而且老闆娘也堅持將麵攤各處擦的乾乾淨淨的，抹布也是洗的白白的之後才開始做生意，因為她想我賣的東西客人不知道吃的習不習慣，但是我的衛生起碼要做得比別人好；就因為堅持衛生所以慢慢有附近的媽媽下課時，願意帶小孩來嘗鮮，於是讓原本只是勉強維生的小攤販終於漸漸開始好轉。如此日夜打拚兢兢業業的態度加上實在的用料及獨特的口味讓許許多多的街坊客人一試成主顧。誠記的道地招牌河粉系列清燉、鮮牛肉河粉外還有乾拌、咖哩、沙茶等家鄉南洋口味的河粉讓老饕口碑相傳，讓食客聞香而至因顧客口耳相傳始杜氏夫婦生意越來越好，故在永康街6巷1號開出第一家店鋪。","","自家店自行烘豆","","捷克公寓是隱身在台北巷弄的一間 捷克餐廳（捷克餐酒館）。 是捷克文劇院的意思，這裡有我們親手做的捷克口味餐點，而且喝得到Pilsner捷克生啤酒 ，未來將不定期舉辦電影放映與私派對，目前我們的開放時間為 星期一到星期六17:30 – 00:00， 星期日17:30 – 22:00， 星期一休息。歡迎下班後來找我們小酌聊！","","","一本忘年之交哲學文學交融的文學鉅著，一部經典黑白老電影，一位極具傳奇色彩大智隱於市的礦工詩人，一個結合人文音樂美食的好地方——希臘左巴。1998年7月31日，三位志同道合的「左巴人」，承襲了希臘的巷弄美食文化，成立了「希臘左巴」，希望將對身心最無負擔的「地中海飲食法」——一種以食材「相互提味」的料理系統——介紹給國人，體驗歐洲人士的家常菜。店名「希臘左巴」，取自經典文學名著希臘左巴之諧音以及「走吧！來去希臘」之意涵，以「人文音樂美食」為基調，落實「生活藝術化、藝術生活化」的理念，讓藝文輕輕鬆鬆地走入每一個日常⋯⋯","體驗正宗波斯料理, 感受神祕面紗下的中東魅力為台灣穆斯林教友提供正統清真料理Authentic Persian Taste (Halal food provided).Share your exclusive tales of 1001 nights with us.","歷史悠久的傳統料理俄羅斯飲食的發展是在15世紀莫斯科成為其首都才開始的，當時俄羅斯文化受到西歐文化的強烈影響，飲食文化方面俄羅斯的貴族比較崇尚法國，所以俄式菜受法式菜的影響比較大，後來俄式菜也逐漸吸收了義大利等國菜式的特點，並且融合自身的飲身習慣，從而形成了較具特色的俄式菜。俄羅斯菜較油膩，由於俄羅斯大部分地區氣候比較寒冷俄羅斯菜較油膩，由於俄羅斯大部分地區氣候比較寒冷，人們需要更多的熱能，所以，許多菜做完後要淋上少量油。直到上個世紀六七十年代，才逐漸改善，俄式菜也逐漸趨於清淡，但仍有部分菜式保留這個特點。" ]

    chinese_store = Store.where(food_type: 0)
    if chinese_store.present?
      chinese_store.each do
        chinese_store.update({remote_image_url: "https://loremflickr.com/300/200/restaurant,chinese"})
      end
      chinese_store.each do |n|
        n.update(intro: chinese_store_intro.sample)
      end
    end

    japanese_store = Store.where(food_type: 1)
    if japanese_store.present?
      japanese_store.each do
        japanese_store.update({remote_image_url: "https://loremflickr.com/300/200/restaurant,japanese"})
      end
      japanese_store.each do |n|
        n.update(intro: japanese_store_intro.sample)
      end
    end

    korean_store = Store.where(food_type: 2)
    if korean_store.present?
      korean_store.each do
        korean_store.update({remote_image_url: "https://loremflickr.com/300/200/restaurant,korean"})
      end
      korean_store.each do |n|
        n.update(intro: korean_store_intro.sample)
      end
    end

    other_store = Store.where(food_type: 10)
    if other_store.present?
      other_store.each do
        other_store.update({remote_image_url: "https://loremflickr.com/300/200/restaurant"})
      end
      other_store.each do |n|
        n.update(intro: other_store_intro.sample)
      end
    end

    american_store = Store.where(food_type: 6)
    if american_store.present?
      american_store.each do
        american_store.update({remote_image_url: "https://loremflickr.com/300/200/restaurant,american"})
      end
      american_store.each do |n|
        n.update(intro: american_store_intro.sample)
      end
    end

    french_store = Store.where(food_type: 7)
    if french_store.present?
      french_store.each do
        french_store.update({remote_image_url: "https://loremflickr.com/300/200/restaurant,french"})
      end
      french_store.each do |n|
        n.update(intro: french_store_intro.sample)
      end
    end

    germany_store = Store.where(food_type: 8)
    if germany_store.present?
      germany_store.each do
        germany_store.update({remote_image_url: "https://loremflickr.com/300/200/restaurant,germany"})
      end
      germany_store.each do |n|
        n.update(intro: germany_store_intro.sample)
      end
    end

    mexican_store = Store.where(food_type: 9)
    if mexican_store.present?
      mexican_store.each do
        mexican_store.update({remote_image_url: "https://loremflickr.com/300/200/restaurant,mexican"})
      end
      mexican_store.each do |n|
        n.update(intro: mexican_store_intro.sample)
      end
    end

    indian_store = Store.where(food_type: 3)
    if indian_store.present?
      indian_store.each do
        indian_store.update({remote_image_url: "https://loremflickr.com/300/200/restaurant,indian"})
      end
      indian_store.each do |n|
        n.update(intro: indian_store_intro.sample)
      end
    end

    italian_store = Store.where(food_type: 4)
    if italian_store.present?
      italian_store.each do
        italian_store.update({remote_image_url: "https://loremflickr.com/300/200/restaurant,italian"})
      end
      italian_store.each do |n|
        n.update(intro: italian_store_intro.sample)
      end
    end

    british_store = Store.where(food_type: 5)
    if british_store.present?
      british_store.each do
        british_store.update({remote_image_url: "https://loremflickr.com/300/200/restaurant,british"})
      end
      british_store.each do |n|
        n.update(intro: british_store_intro.sample)
      end
    end

    p "更新分店圖片、介紹完畢"

    # ！！！這區要更新！！！
    dish_intro = [ "【獨家方案】
    ★ 平日午晚餐吃到飽 優惠價$592/人
    ★ 假日午晚餐吃到飽 優惠價$647/人
    ★ 假日下午茶吃到飽 優惠價$592/人
    ➤ 以上價格皆內含服務費
    ➤ 本優惠之相關活動辦法、未盡事項或變更，餐廳保有活動變更之權利及活動最終解釋權。
    ➤ 訂位人數6人以上，可能會有拆桌，依照現場安排。", "★ 預付享單點品項9折（現場有雙人套餐75折起），6人以下訂位
    ★ 預付享單點品項9折（現場有雙人套餐75折起），7人以上訂位
    ➤ 如現場有額外優惠，現場方案與預付方案擇一使用
    ➤ 現場備有免費「豆腐」
    ➤ 預付金額可抵現場消費（請於結帳時出示序號，方可抵扣）
    ➤ 預付優惠與現場方案擇一使用", "【獨家方案】
    ★ 預付兩人(含)以上用餐每桌贈原味豬五花一份(價值$300)，預付 $450 /人

    【壽星方案】
    ★ 當月壽星預付預付兩人(含)以上用餐每桌贈原味豬五花一份(價值$300)，預付 $450 /人，另贈慶生烤肉蛋糕一份
    ➤ 用餐當日請攜帶個人證件查驗，恕不接受社群平台生日驗證。
    ➤ 餐廳保有一切解釋的權利。
    ➤ 用餐時間為 120 分鐘，訂位時間將為您保留10分鐘
    ➤ 每桌至多 6 人，小孩位視同大人位
    ➤ 每桌基本消費為單點兩份肉品或一份套餐
    ➤ 現場提供嬰兒椅，座位需依現場人員安排為主
    ➤ 請務必確認用餐人數後訂位
    ➤ 最後點餐時間：週一～週五 午餐為:14:30 晚餐為:21:00、週六～週日 全天供餐至21:00最後點餐", "【獨家方案】
    ★ 平日午餐吃到飽 $878/人
    ★ 平日下午茶吃到飽 $768/人
    ★ 平日晚餐吃到飽 $988/人

    ★ 假日午餐吃到飽 $988/人
    ★ 假日下午茶吃到飽 $878/人
    ★ 假日晚餐吃到飽 $1098/人

    ➤ 以上價格皆內含服務費
    ➤ 訂位人數6人以上，可能會有拆桌，依照現場安排
    ➤ 若需變更用餐人數，請聯繫EZezt客服團隊修改訂單
    ➤ 本優惠之相關活動辦法、未盡事項或變更，餐廳保有活動變更之權利及活動最終解釋權", "★ 浪漫約會, 商業聚餐, 家庭聚餐, 團體聚餐, 朋友聚餐, 生日慶祝
    ★ 預付享單點品項9折（現場有雙人套餐75折起），7人以上訂位

    ➤ 如現場有額外優惠，現場方案與預付方案擇一使用
    ➤ 現場備有免費「印度紗麗」可自行體驗拍照

    ➤ 預付金額可抵現場消費（請於結帳時出示序號，方可抵扣）
    ➤ 預付優惠與現場方案擇一使用", "【獨家方案】
    ★ 預付享平日$550商業午餐任選(羊排不適用)，預付$500 /人
    ★ 預付享平日晚餐可折抵現場消費$600/人，預付$500 /人
    ★ 預付可折抵現場消費$1100/人(除特殊節日外不分平假日全餐期適用)，預付$1000 /人
    ★ 預付享特殊節日獨家保留位！預付$500 /人", "【畢業季限定｜解渴開胃做伙來】
    下訂時間：即日起～2021/7/18
    用餐時間：2021/6/4～2021/7/18
    ★ 畢業揪青春，凡用餐人數8人以上(需出示學生證或教師證)，即招待無酒精雞尾酒or台灣生啤酒每人乙杯、甜點or雞翅每桌兩份，再加碼開胃菜香酥莎莎醬玉米脆片/桌(總價值最高$2,000) ，7人以上訂位，預付$325/桌(每人低消$400，不含10%服務費)", "【獨家搶先訂】
    ★ 主餐超值A方案吃到飽 特別優惠價 $977/人
    ★ 主餐超值B方案吃到飽 特別優惠價 $1197/人

    ➤ 單人用餐現場需加價 $110
    ➤ 到店付款恕不使用任意餐卷、優惠卷等結帳，請刷卡或付現
    ➤ 選擇成人人數進行訂位，若欲與孩童一同前往，於「特殊需求」另備註孩童人數即可。孩童餐費則於用餐當天現場付費。
    ➤ 預付額不適用百貨停車折抵消費服務，盡請見諒", "【獨家方案】
    ★ 預付兩人(含)以上用餐每桌贈原味豬五花一份(價值$300)，預付 $450 /人

    【壽星方案】
    ★ 當月壽星預付預付兩人(含)以上用餐每桌贈原味豬五花一份(價值$300)，預付 $450 /人，另贈慶生烤肉蛋糕一份
    ➤ 用餐當日請攜帶個人證件查驗，恕不接受社群平台生日驗證。
    ➤ 餐廳保有一切解釋的權利。

    ➤ 用餐時間為 120 分鐘，訂位時間將為您保留10分鐘
    ➤ 每桌至多 6 人，小孩位視同大人位
    ➤ 每桌基本消費為單點兩份肉品或一份套餐
    ➤ 現場提供嬰兒椅，座位需依現場人員安排為主
    ➤ 請務必確認用餐人數後訂位
    ➤ 最後點餐時間：週一～週五 午餐為:14:30 晚餐為:21:00、週六～週日 全天供餐至21:00最後點餐", "【預付享EZCASH 5%回饋】
    ★ 預付享提拉米蘇乙份(價值$198)，6人以下訂位，預付$200/桌
    ★ 預付享提拉米蘇兩份(價值$396)，7人以上訂位，預付$500/桌

    ➤ 均消參考：$500/人
    ➤ 預付金額可抵現場消費（請於結帳時出示序號，方可抵扣）
    ➤ 預付優惠與現場方案擇一使用" ]

    p "開始建立各方案搭配1 張圖片及方案介紹"

    chinese_dish = Dish.joins(:store).where(store: {food_type: 0}).distinct
    if chinese_dish.present?
      chinese_dish.each do |n|
        n.images.update({remote_image_url: "https://loremflickr.com/300/200/foods,chinese"})
      end
      chinese_dish.each do |n|
        n.update(intro: dish_intro.sample)
      end
    end

    other_dish = Dish.joins(:store).where(store: {food_type: 10}).distinct
    if other_dish.present?
      other_dish.each do |n|
        n.images.update({remote_image_url: "https://loremflickr.com/300/200/foods,restaurants"})
      end
      other_dish.each do |n|
        n.update(intro: dish_intro.sample)
      end
    end

    japanese_dish = Dish.joins(:store).where(store: {food_type: 1}).distinct
    if japanese_dish.present?
      japanese_dish.each do |n|
        n.images.update({remote_image_url: "https://loremflickr.com/300/200/foods,japanese"})
      end
      japanese_dish.each do |n|
        n.update(intro: dish_intro.sample)
      end
    end

    korean_dish = Dish.joins(:store).where(store: {food_type: 2}).distinct
    if korean_dish.present?
      korean_dish.each do |n|
        n.images.update({remote_image_url: "https://loremflickr.com/300/200/foods,korean"})
      end
      korean_dish.each do |n|
        n.update(intro: dish_intro.sample)
      end
    end

    american_dish = Dish.joins(:store).where(store: {food_type: 6}).distinct
    if american_dish.present?
      american_dish.each do |n|
        n.images.update({remote_image_url: "https://loremflickr.com/300/200/foods,american"})
      end
      american_dish.each do |n|
        n.update(intro: dish_intro.sample)
      end
    end

    french_dish = Dish.joins(:store).where(store: {food_type: 7}).distinct
    if french_dish.present?
      french_dish.each do |n|
        n.images.update({remote_image_url: "https://loremflickr.com/300/200/foods,french"})
      end
      french_dish.each do |n|
        n.update(intro: dish_intro.sample)
      end
    end

    germany_dish = Dish.joins(:store).where(store: {food_type: 8}).distinct
    if germany_dish.present?
      germany_dish.each do |n|
        n.images.update({remote_image_url: "https://loremflickr.com/300/200/foods,germany"})
      end
      germany_dish.each do |n|
        n.update(intro: dish_intro.sample)
      end
    end

    mexican_dish = Dish.joins(:store).where(store: {food_type: 9}).distinct
    if mexican_dish.present?
      mexican_dish.each do |n|
        n.images.update({remote_image_url: "https://loremflickr.com/300/200/foods,mexican"})
      end
      mexican_dish.each do |n|
        n.update(intro: dish_intro.sample)
      end
    end

    indian_dish = Dish.joins(:store).where(store: {food_type: 3}).distinct
    if indian_dish.present?
      indian_dish.each do |n|
        n.images.update({remote_image_url: "https://loremflickr.com/300/200/foods,indian"})
      end
      indian_dish.each do |n|
        n.update(intro: dish_intro.sample)
      end
    end

    italian_dish = Dish.joins(:store).where(store: {food_type: 4}).distinct
    if italian_dish.present?
      italian_dish.each do |n|
        n.images.update({remote_image_url: "https://loremflickr.com/300/200/foods,italian"})
      end
      italian_dish.each do |n|
        n.update(intro: dish_intro.sample)
      end
    end

    british_dish = Dish.joins(:store).where(store: {food_type: 5}).distinct
    if british_dish.present?
      british_dish.each do |n|
        n.images.update({remote_image_url: "https://loremflickr.com/300/200/foods,british"})
      end
      british_dish.each do |n|
        n.update(intro: dish_intro.sample)
      end
    end

    p "更新方案圖片、介紹完畢，種子資料建立完成...byebye"

  end
end