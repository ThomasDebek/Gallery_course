class StronasController < ApplicationController

  layout 'admin'

  before_action :sprawdz_logowanie
  before_action :szukaj_kategorie


  def index
    @stronas = @kategorie.strona.sortuj
  end

  def pokaż
    @strona = Strona.find(params[:id])
  end


  def nowa
    @strona = Strona.new(:kategorie_id => @kategorie.id, :nazwa => "Podaj nazwę strony")
    @kategoria = Kategorie.order('pozycja ASC')
    @licznik = Strona.count + 1
  end

  def edycja
    @licznik = Strona.count
    @kategoria = Kategorie.order('pozycja ASC')
    @strona = Strona.find(params[:id])
  end

  def usun
    @strona= Strona.find(params[:id])
  end

  def utworz
    @strona = Strona.new(strona_parametry)
    if @strona.save
     flash[:notice] = "Strona została pomyslnie utworzona"
    redirect_to(:action => 'index', :kategorie_id => @kategorie.id )
  else
    @licznik = Strona.count +1
    @kategoria = Kategorie.order('pozycja ASC')
    render 'nowa'
    end
  end

  def aktualizuj
    @strona = Strona.find(params[:id])
    if @strona.update_attributes(strona_parametry)
      flash[:notice] = "Strona została pomyslnie zmodyfikowana"
      redirect_to(:action => 'pokaż', :id => @strona.id, :kategorie_id => @kategorie.id)
    else
      @licznik = Strona.count
      @kategoria = Kategorie.order('pozycja ASC')
      render 'edycja'
    end
  end


  def kasuj
    @strona= Strona.find(params[:id]).destroy
    flash[:notice] = "Strona '#{@strona.nazwa}'  została pomyslnie usunieta"
    redirect_to(:action => 'index', :kategorie_id => @kategorie.id)
  end


  private
    def strona_parametry
      params.require(:strona).permit(:nazwa, :pozycja, :widoczna, :created_at, :kategorie_id)
    end

    def szukaj_kategorie
     if params[:kategoria_id]
        @kategorie = Kategorie.find(params[:kategoria_id])
    end
  end



end






