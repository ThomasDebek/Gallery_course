class GaleriesController < ApplicationController


  layout 'admin'

  def index
    @galeria = Galerie.sortuj
  end

  def nowa
    @galeria = Galerie.new({:nazwa => "Wprowadz nazwę "})
    @licznik = Galerie.count + 1
  end

  def utworz
    @galeria = Galerie.new(galeria_parametry)
    if @galeria.save
      flash[:notice] = "Galeria zostala pomyslnie utworzona"
      redirect_to(:aciton => "index")
    else
      @licznik = Galerie.count +1
      render "nowa"
    end
  end

  def pokaz
  end

  def edycja
  end

  def usun
  end

  def galeria_parametry
    params.require(:galeria).permit(:nazwa, :pozycja, :widoczna, :opis, :zdjecie)
  end
end
