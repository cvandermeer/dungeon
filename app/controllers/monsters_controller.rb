class MonstersController < ApplicationController
  before_action :set_monster, only: [:update, :destroy]

  def index
    @monsters = Monster.all
  end

  def new
    @monster = Monster.new
  end

  def create
    @monster = Monster.new(monster_params)
    if @monster.save
      respond_to do |format|
        format.html{ redirect_to monsters_path }
        format.js
      end
    end
  end

  def update
    if @monster.update(monster_params)
      respond_to do |format|
        format.html{ redirect_to monster_path }
        format.js
      end
    end
  end

  def destroy
    if @monster.destroy
      respond_to do |format|
        format.html { redirect_to monsters_path }
        format.js
      end
    end
  end

  private
    def monster_params
      params.require(:monster).permit(:name, :strength)
    end
end