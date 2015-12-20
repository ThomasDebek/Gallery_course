class DostepsController < ApplicationController


  layout 'admin'

  before_action :sprawdz_logowanie, :except => [:login, :logowanie, :logout]

  def index
  end

  def login
  end

  def logowanie
    if params[:uzytkownik].present? && params[:haslo].present?
      admin_szukam = Uzytkownik.where(:uzytkownik => params[:uzytkownik]).first
      if admin_szukam
        admin_autoryzacja = admin_szukam.authenticate(params[:haslo])
      end
    end
    if admin_autoryzacja
      session[:uzytkownik_id] = admin_autoryzacja.id
      session[:uzytkownik ] = admin_autoryzacja.uzytkownik
      flash[:notice] = "Zostałes poprawnie zalogowany"
      redirect_to(:action => 'index')
    else
      flash[:notice] = "Blad niepoprawana nazawa uzytkownika lub hasla"
      redirect_to(:action => 'login')
    end
  end


  def logout
    session[:uzytkownik_id] = nil
    session[:uzytkownik] = nil
    flash[:notice] = "Zostales wylogowany"
    redirect_to(:action => "login")
  end
end
