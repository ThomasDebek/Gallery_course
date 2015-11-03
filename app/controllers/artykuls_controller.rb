class ArtykulsController < ApplicationController


  layout 'admin'


  def index
    @artykuly = Artykul.sortuj
  end

  def nowy
    @artykuly = Artykul.new({:nazwa => 'Wprowadz tytul'})
    @strona = Strona.order('pozycja ASC')
    @licznik = Artykul.count + 1
  end

  def utworz
    @artykuly = Strona.new(artykuly_parametry)
    if @artykuly.save
      flash[:notice] = "Artykuly zostały pomyslnie utworzone"
      redirect_to(:action => 'index')
    else
      @licznik = Artykul.count +1
      @strona = Strona.order('pozycja ASC')
      render 'nowy'
    end
  end

  def edycja
  end

  def usun
  end

  def pokaż
  end

  def nazwa
  end

  private
  def artykuly_parametry
    params.require(:artykuly).permit(:nazwa, :pozycja, :widoczny, :created_at, :strona_id, :zdjecie)
  end
end
