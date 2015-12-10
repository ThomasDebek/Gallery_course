class ZdjeciesController < ApplicationController


  layout 'admin'

  def index
    @zdjecia = Zdjecie.sortuj
  end

  def nowe
    @zdjecie = Zdjecie.new({:nazwa => "Wprowadz nazwę zdjecia"})
    @licznik = Zdjecie.count + 1
    @galeria = Galerie.order('pozycja ASC')
  end

  def utworz
    @zdjecie = Zdjecie.new(zdjecia_parametry)
    if @zdjecie.save
      flash[:notice] = "Zdjecie zostalo pomyslnie utworzone"
      redirect_to(:action => "index")
    else
      @licznik = Zdjecie.count +1
      @galeria = Galerie.order('pozycja ASC')
      render "nowe"
    end
  end

  def pokaz
    @zdjecie = Zdjecie.find(params[:id])
  end

  def edycja
  end

  def usun
  end

  def zdjecia_parametry
    params.require(:zdjecie).permit(:galerie_id, :nazwa, :pozycja, :widoczne, :zdjecie, :opis, :created_at)
  end

end


