class ArtykulsController < ApplicationController


  layout 'admin'


  def index
    @artykuly = Artykul.sortuj
  end

  def nowy
  end

  def edycja
  end

  def usun
  end

  def pokaż
  end
end
