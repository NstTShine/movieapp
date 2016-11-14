Category.create!(name: "Cổ Trang - Thần Thoại")
Category.create!(name: "Võ Thuật - Kiếm Hiệp")
Category.create!(name: "Phiêu Lưu -  Hành Động")
Category.create!(name: "Tâm Lý - Tình Cảm")
Category.create!(name: "Phim Hoạt Hình")
Category.create!(name: "Khoa Học - Viễn Tưởng")
Category.create!(name: "Hình Sự -  Chiến Tranh")
Category.create!(name: "Tài Liệu - Khám Phám")
Category.create!(name: "Văn Hóa - Tâm Linh")
Category.create!(name: "Hài Hước")
Category.create!(name: "Thể Thao - Âm Nhạc")
Category.create!(name: "Kinh Dị -  Ma")
Category.create!(name: "Gia Đình -  Học Đường")
Category.create!(name: "Phim Thuyết Minh")
Category.create!(name: "Phim Lồng Tiếng")

Country.create!(name: "Việt Nam")
Country.create!(name: "Trung Quốc")
Country.create!(name: "Hàn Quốc")
Country.create!(name: "Thái Lan")
Country.create!(name: "Hồng Kong")
Country.create!(name: "Âu – Mỹ")
Country.create!(name: "Đài Loan")
Country.create!(name: "Nhật Bản")
Country.create!(name: "Ấn Độ")
Country.create!(name: "Philipines")
Country.create!(name: "Các Nước Khác")

User.create!(name: "TShine", email: "hihihohohehe91@gmail.com",
  password: "111111", role: 0)
20.times do |n|
  User.create!(name: "Example##{n + 1}", email: "hihihohohehe##{n + 1}@abc.org",
    password: "111111")
end
