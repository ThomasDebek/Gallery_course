class TestController < ApplicationController
  def index
    @testowa = "Witamy w moim kursie Ror :)"
    $globalna = "Zmienna globalna"

    @imiona = ["Ala", "Ewa", "Ola"]
  end

  def new_action
    render ('test/witaj')
  end

  def curse
    redirect_to('http://www.google.com')
  end

end
