class TestController < ApplicationController
  def index
    @testowa = "Witamy w moim kursie"
  end

  def new_action
    render ('test/witaj')
  end

  def curse
    redirect_to('http://www.google.com')
  end

end
