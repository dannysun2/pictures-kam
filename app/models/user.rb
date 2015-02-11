class User < ActiveRecord::Base
   has_many :pictures
   has_secure_password
   paginates_per 6
end
