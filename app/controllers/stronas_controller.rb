class StronasController < ApplicationController

  layout 'admin'


  def index
    @stronas = Strona.sortuj
  end

  def pokaz
  end

  def nowa
    @strona = Strona.new(:nazwa => "Podaj nazwę strony")
    @kategoria = Kategorie.order('pozycja ASC')
    @licznik = Strona.count + 1
  end

  def edycja
    @licznik = Strona.count
    @kategoria = Kategorie.order('pozycja ASC')
    @strona = Strona.find(params[:id])
  end

  def usun
  end

  def utworz
    @strona = Strona.new(strona_parametry)
    if @strona.save
     flash[:notice] = "Strona została pomyslnie utworzona"
    redirect_to(:action => 'index')
  else
    @licznik = Strona.count +1
    render 'nowa'
    end
  end

  def aktualizuj
    @strona = Strona.find(params[:id])
    if @strona.update_attributes(strona_parametry)
      flash[:notice] = "Strona została pomyslnie zmodyfikowana"
      redirect_to(:action => 'pokaz', :id => @strona.id)
    else
      @licznik = Strona.count
      @kategoria = Kategorie.order('pozycja ASC')
      render 'edycja'
    end
  end


  private
  def strona_parametry
    params.require(:strona).permit(:nazwa, :pozycja, :widoczna, :created_at, :kategorie_id)
  end



end






