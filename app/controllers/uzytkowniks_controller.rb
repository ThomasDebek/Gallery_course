class UzytkowniksController < ApplicationController

  layout "admin"

  before_action :sprawdz_logowanie


  def index
    @uztkownik = Uzytkownik.sortuj
  end

  def nowy
    @uzytkownik = Uzytkownik.new
  end

  def utworz
    @uzytkownik = Uzytkownik.new(uzytkownik_parametry)
    if  @uzytkownik.save
      flash[:notice] = "Uzytkownik zostal utworzony"
      redirect_to(:action => "index")
    else
      render("nowy")
    end
  end

  def edycja
  end

  def usun
  end

  private
  def uzytkownik_parametry
    params.require(:uzytkownik).permit(:imie, :nazwisko, :email, :uzytkownik, :password, :password_confirmation)
  end
end
