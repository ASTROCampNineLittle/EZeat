    # 產生假分店1: 先建立各種food_type
    # com = Company.first
    # 5.times do
    #   com.stores.create(name: Faker::Restaurant.name,
    #                     food_type: (1..2).to_a.sample,
    #                     address: Faker::Address.full_address,
    #                     tel: Faker::PhoneNumber.cell_phone,
    #                     intro: Faker::Restaurant.description
    #                     )
    # end

  # 產生假分店2: 根據food_type 塞假照片
    # s1 = Store.where(food_type: 1)
    # if s1.present?
    #   s1.each do
    #     s1.update({image: File.open(Rails.root.join("public/image/1.jpeg"))})
    #   end
    # end

    # s1 = Store.where(food_type: 1)
    # if s1.present?
    #   s1.each do
    #     s1.update({remote_image_url: "https://www.shutterstock.com/zh/search/thai+food"})
    #   end
    # end

    # Store.where(food_type: 1).update_all({image: File.open(Rails.root.join("public/image/1.jpeg"))})

    # # 備份產生假分店：不根據food_type 塞假照片的版本
    # com = Company.first
    # 10.times do |i|
    #   com.stores.create(name: Faker::Restaurant.name,
    #                     food_type: (1..10).to_a.sample,
    #                     address: Faker::Address.full_address,
    #                     tel: Faker::PhoneNumber.cell_phone,
    #                     intro: Faker::Restaurant.description,
    #                     image: File.open(Rails.root.join("public/image/#{rand(1..10)}.jpeg"))
    #                     )
    # end