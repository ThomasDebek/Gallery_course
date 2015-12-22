class Uzytkownik < ActiveRecord::Base
  has_secure_password


  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

  validates :imie,
            :presence => true

  validates :nazwisko,
            :presence => true

  validates :uzytkownik,
            :length => {:within => 4..25, :message => "Nazwa uzytkownika musi zawierac sie pomiendzy 4 a 25 znakow"},
            :uniqueness =>true

  validates :email,
            :presence => true,
            :length => {:maximum => 100},
            :format => EMAIL_REGEX,
            :confirmation => true

  scope :sortuj, lambda{order("nazwisko ASC, imie ASC")}

end
