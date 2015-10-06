class KategoriesController < ApplicationController

  layout false

  def index
    @kategorie = Kategorie.sortuj
  end

  def pokaż
  end

  def nowa
  end

  def edycja
  end

  def usun
  end
end
