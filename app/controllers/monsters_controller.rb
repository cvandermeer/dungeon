class MonstersController < ApplicationController
  before_action :set_monster, only: [:update, :destroy]

  def index
    @monsters = Monster.all
  end

  def create
    @monsters = Monster.new(monster_params)
    if @monster.save
      respond_to do |format|
        format.html{ redirect_to monster_path }
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
end