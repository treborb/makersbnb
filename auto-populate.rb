
array = []
array << User.first_or_create(email:    "fake@fake.com",
                    name:      "will farrah",
                    user_name: "mommaLovva",
                    password_digest: "THISISAREALHASHHONEST")

array << User.first_or_create(email:    "kaisking@hotmail.com",
                    name:      "Kaiser souzer",
                    user_name: "iceDude",
                    password_digest: "THISISAREALHASHHONEST")

array << Room.first_or_create(name:    "Tenpenny Towers",
            address: "221b Bakers Street",
            description: "deductive reasoning something help? john come do the internet",
            price: "5000",
            user: User.first)

array << Room.first_or_create(name:    "Trump Towers",
            address: "Trump Towers, believe me",
            description: "totally not a cardboard box",
            price: "500",
            user: User.first)

array << Booking.first_or_create(user: User.first(user_name: "icedude"),
                        room: Room.first(name: "Tenpenny Towers"),
                        calendardate: Calendardate.first_or_create(date: Time.new))

valid =   array.select(&:valid?)
invalid = array.reject(&:valid?)

if valid.length > 0
  puts "valid"
  puts "-----"
  valid.each{|valid| puts valid.id}
end

if invalid.length > 0
  puts "invalid"
  puts "-----"
  invalid.each{|valid| puts valid.id}
end
