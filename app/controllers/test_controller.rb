class TestController < ApplicationController

  layout false

  def index
    @testowa = "Witamy w moim kursie Ror :)"
    $globalna = "Zmienna globalna"

    @imiona = ["Ala", "Ewa", "Ola"]
    @id = params[:id].to_i


  end

  def new_action
    render ('test/witaj')
  end

  def curse
    redirect_to('http://www.google.com')
  end

end
