class Uzytkownik < ActiveRecord::Base
  has_secure_password


  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

  validates :imie,
            :presence => {:in => true, :message => "pole nie moze byc puste"}

  validates :nazwisko,
            :presence => {:in => true, :message => "pole nie moze byc puste"}

  validates :uzytkownik,
            :length => {:within => 4..25, :message => "Nazwa uzytkownika musi zawierac sie pomiędzy 4 a 25 znakow"},
            :uniqueness =>true

  validates :email,
            :presence =>{:in => true, :message => "pole nie moze byc puste"},
            :length => {:maximum => 100},
            :format => {:with => EMAIL_REGEX, :message => "pole nie moze byc puste"},
            :confirmation => true

  scope :sortuj, lambda{order("nazwisko ASC, imie ASC")}

end
