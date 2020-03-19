class Article < ApplicationRecord  
    has_many :comments
    validates :title,
              :nrz,
              :rfc,
              :email,
              :contactuser, presence: true,
              length: { minimum: 5 }

end
