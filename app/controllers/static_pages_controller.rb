class StaticPagesController < ApplicationController
  def home
  end

  def help
  end

  def about
  end

  def contact
  end

  def d3
  	gon.d3data = [100, 140, 180, 220]
  end
end
