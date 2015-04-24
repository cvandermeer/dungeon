class MonstersController < ApplicationController
  before_action :set_monster, only: [:update, :destroy, :show]

  def index
    @monsters = Monster.all
  end

  def new
    @monster = Monster.new
  end

  def show
  end

  def create
    @monster = Monster.new(monster_params)
    respond_to do |format|
      if @monster.save
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
      params.require(:monster).permit(:name, :treasure, :level)
    end

    def set_monster
      @monster = Monster.find(params[:id])
    end
end