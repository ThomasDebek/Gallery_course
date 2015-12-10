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
      redirect_to(:action => "index")
    else
      @licznik = Galerie.count +1
      render "nowa"
    end
  end

  def pokaż
    @galeria = Galerie.find(params[:id])
  end

  def aktualizuj
    @galeria = Galerie.find(params[:id])
    if @galeria.update_attributes(galeria_parametry)
      flash[:notice] = "Galeria została pomyślnie zmodyfikowana"
      redirect_to(:action => "pokaż", :id => @galeria.id)
    else
      @licznik = Galerie.count
      render("edycja")
    end
  end

  def edycja
    @galeria = Galerie.find(params[:id])
    @licznik = Galerie.count
  end

  def usun
    @galeria = Galerie.find(params[:id])
  end

  def kasuj
    galeria = Galerie.find(params[:id]).destroy
    flash[:notice] = "Galeria #{galeria.nazwa}  została pomyślnie usunieta"
    redirect_to(:action => "index")

  end

  def galeria_parametry
    params.require(:galerie).permit(:nazwa, :pozycja, :opis,  :widoczna, :zdjecie)
  end

  
end

