class Galerie < ActiveRecord::Base

  has_many :zdjecie

  has_attached_file :zdjecie,
                     :styles => {:medium => "600x600>", :thumb => "200x200>" }

  validates_attachment_content_type :zdjecie,
                                    :content_type => /^image\/(png|gif|jpeg)/,
                                    :message => '--- akceptuje tylko pliki PNG GIF i JPG ----'

  validates_attachment_size :zdjecie,
                            :in	=> 0..850.kilobytes,
                            :message => '--- za duży plik max rozmiar to 850 kB ----'

  validates  :nazwa,
             :presence => true,
             :length => {:maximum => 120, :message => ": Za długi tytuł galerii"}

  validates :nazwa,
            presence: true,
            :length =>{maximum: 120, :message =>": za dlugi tekst"}

  scope :widoczna, lambda{where(:widoczny => true)}
  scope :niewidoczna, lambda{where(:widoczny => false)}
  scope :sortuj, lambda{order("galeries.pozycja ASC")}
  scope :najnowsza, lambda{order("galeries.created_at DESC")}

end
