class Zdjecie < ActiveRecord::Base

  belongs_to :galerie

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
             :length => {:maximum => 120, :message => ": Za długi tytuł zdjecia"}

  scope :widoczne, lambda{where(:widoczne => true)}
  scope :niewidoczne, lambda{where(:widoczne => false)}
  scope :sortuj, lambda{order("zdjecies.pozycja ASC")}
  scope :najnowsze, lambda{order("zdjecies.created_at DESC")}


end
