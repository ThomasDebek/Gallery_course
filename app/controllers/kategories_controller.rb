class KategoriesController < ApplicationController

  layout false

  def index
    @kategorie = Kategorie.sortuj
  end

  def pokaż
    @kategoria = Kategorie.find(params[:id])
  end

  def nowa
    @kategoria = Kategorie.new({:nazwa => "Podaj nazwe kategori"})
    @licznik = Kategorie.count + 1
  end

  def edycja
    @licznik = Kategorie.count
    @kategoria = Kategorie.find(params[:id])
  end

  def aktualizuj
    @kategoria = Kategorie.find(params[:id])
    if @kategoria.update_attributes(kategorie_parametry)
      redirect_to(:action => 'pokaż', :id => @kategoria.id)
    else
      @licznik = Kategorie.count
      render 'edycja'
    end
  end


  def usun
    @kategoria = Kategorie.find(params[:id])

  end

  def kasuj
    @kategoria = Kategorie.find(params[:id]).destroy
    redirect_to(:action => 'index')
  end

  def utworz
    @kategorie = Kategorie.new(kategorie_parametry)
    if @kategorie.save
      redirect_to(:action=>'index')
    else
      @licznik = Kategorie.count + 1
      render 'nowa'
    end
  end

  private
  def kategorie_parametry
    params.require(:kategoria).permit(:nazwa, :pozycja, :widoczna, :created_at)
  end
end