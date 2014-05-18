# encoding: utf-8

############################################# Truncate Table ########################################################
# Put this in seeds.rb.  This is a full example
# Run with 'rake db:seed', assuming you have already created
# the table.
# Works for mysql, sqlite, sqlite3

vnprovinces = [
  ['076', 'An Giang'],      ['064', 'Bà Rịa - Vũng Tàu'],
  ['0240', 'Bắc Giang'],    ['0281', 'Bắc Kạn'],
  ['0781', 'Bạc Liêu'],     ['0241', 'Bắc Ninh'],
  ['075', 'Bến Tre'],       ['056', 'Bình Định'],
  ['0650', 'Bình Dương'],   ['0651', 'Bình Phước'],
  ['062', 'Bình Thuận'],    ['0780', 'Cà Mau'],
  ['026', 'Cao Bằng'],      ['050', 'Đắc Lắk'],
  ['050', 'Đắc Nông'],      ['023', 'Điện Biên'],
  ['061', 'Đồng Nai'],      ['067', 'Đồng Tháp'],
  ['059', 'Gia Lai'],       ['0219', 'Hà Giang'],
  ['0351', 'Hà Nam'],       ['039', 'Hà Tĩnh'],
  ['0320', 'Hải Dương'],    ['0711', 'Hậu Giang'],
  ['0218', 'Hoà Bình'],     ['0321', 'Hưng Yên'],
  ['058', 'Khánh Hoà'],     ['077', 'Kiên Giang'],
  ['060', 'Kon Tum'],       ['023', 'Lai Châu'],
  ['063', 'Lâm Đồng'],      ['025', 'Lạng Sơn'],
  ['020', 'Lào Cai'],       ['072', 'Long An'],
  ['0350', 'Nam Định'],     ['038', 'Nghệ An'],
  ['030', 'Ninh Bình'],     ['068', 'Ninh Thuận'],
  ['0210', 'Phú Thọ'],      ['057', 'Phú Yên'],
  ['052', 'Quảng Bình'],    ['0510', 'Quảng Nam'],
  ['055', 'Quảng Ngãi'],    ['033', 'Quảng Ninh'],
  ['053', 'Quảng Trị'],     ['079', 'Sóc Trăng'],
  ['022', 'Sơn La'],        ['066', 'Tây Ninh'],
  ['036', 'Thái Bình'],     ['0280', 'Thái Nguyên'],
  ['037', 'Thanh Hoá'],     ['0710', 'Cần Thơ'],
  ['0511', 'Đà Nẵng'],      ['04', 'Hà Nội'],
  ['034', 'Hà Tây'],        ['031', 'Hải Phòng'],
  ['008', 'Hồ Chí Minh'],   ['054', 'Thừa Thiên Huế'],
  ['073', 'Tiền Giang'],    ['074', 'Trà Vinh'],
  ['027', 'Tuyên Quang'],   ['070', 'Vĩnh Long'],
  ['0211', 'Vĩnh Phúc'],    ['029', 'Yên Bái']
]
vnprovinces.each do |province|
  Location.create(code: province[0], name: province[1]);
end