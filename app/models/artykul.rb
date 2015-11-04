class Artykul < ActiveRecord::Base
  belongs_to :strona

  has_attached_file :zdjecie,
                    :styles => {:medium => "600x600>", :thumb => "200x200>" }

  validates_attachment_content_type :zdjecie,
                                    :content_type => /^image\/(png|gif|jpeg)/,
                                    :message => '--- akceptuje tylko pliki PNG GIF i JPG ----'

  validates_attachment_size :zdjecie,
                            :in	=> 0..850.kilobytes,
                            :message => '--- za duży plik max rozmiar to 850 kB ----'

  validates 	:nazwa,
             :presence => true,
             :length => {:maximum => 120, :message => ": Za długi tytuł artykułu"}

  scope :widoczny, lambda{where(:widoczny => true)}
  scope :niewidoczny, lambda{where(:widoczny => false)}
  scope :sortuj, lambda{order("artykuls.pozycja ASC")}
  scope :najnowszy, lambda{order("artykuls.created_at DESC")}
end
