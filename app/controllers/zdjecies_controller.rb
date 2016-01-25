class ZdjeciesController < ApplicationController

  layout 'admin'

  before_action :sprawdz_logowanie
  before_action :szukaj_galerie

  def index
    @zdjecia = @galerie.zdjecies.sortuj
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
    @zdjecie = Zdjecie.find(params[:id])
    @licznik = Zdjecie.count + 1
    @galeria = Galerie.order('pozycja ASC')
  end

  def aktualizuj
    @zdjecie = Zdjecie.find(params[:id])
    if @zdjecie.update_attributes(zdjecia_parametry)
      flash[:notice] = "Zdjeice została pomyślnie zmodyfikowane"
      redirect_to(:action => "pokaz", :id => @zdjecie.id)
    else
      @licznik = Zdjecie.count
      @galeria = Galerie.order('pozycja ASC')
      render("edycja")
    end
  end

  def usun
    @zdjecie = Zdjecie.find(params[:id])
  end

  def kasuj
    zdjecie = Zdjecie.find(params[:id]).destroy
    flash[:notice] = "Zdjeicie #{zdjecie.nazwa}  zostało pomyślnie usuniete"
    redirect_to(:action => "index")
  end

  private

  def szukaj_galerie
    if params[:galerie_id]
      @galerie = Galerie.find(params[:galerie_id])
    end
  end

  def zdjecia_parametry
    params.require(:zdjecie).permit(:galerie_id, :nazwa, :pozycja, :widoczne, :zdjecie, :opis, :created_at)
  end
end


