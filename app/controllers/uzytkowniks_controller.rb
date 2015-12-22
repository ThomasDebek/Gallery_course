class UzytkowniksController < ApplicationController

  before_action :sprawdz_logowanie


  def index
    @uztkownik = Uzytkownik.sortuj
  end

  def nowy
  end

  def edycja
  end

  def usun
  end
end
