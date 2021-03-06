require 'data_mapper'
require 'dm-postgres-adapter'

require_relative 'models/date_range'
require_relative 'models/booking'
require_relative 'models/room'
require_relative 'models/user'

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/makers_bnb_#{ENV['RACK_ENV']}")
DataMapper.finalize
DataMapper.auto_upgrade!
