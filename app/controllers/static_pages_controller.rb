class StaticPagesController < ApplicationController
  def home
    offset = rand(Monster.count)
    @monster = Monster.offset(offset).first
  end
end
