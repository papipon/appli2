class Book < ApplicationRecord

belongs_to :user

validates :title,:body, length: {in: 1..200 } 
	
end
