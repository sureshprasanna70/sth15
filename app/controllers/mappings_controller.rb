class MappingsController < ApplicationController
  before_action :set_mapping, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @mappings = Mapping.all
    respond_with(@mappings)
  end

  def show
    respond_with(@mapping)
  end

  def new
    @mapping = Mapping.new
    respond_with(@mapping)
  end

  def edit
  end

  def create
    @mapping = Mapping.new(mapping_params)
    @mapping.save
    respond_with(@mapping)
  end

  def update
    @mapping.update(mapping_params)
    respond_with(@mapping)
  end

  def destroy
    @mapping.destroy
    respond_with(@mapping)
  end

  private
    def set_mapping
      @mapping = Mapping.find(params[:id])
    end

    def mapping_params
      params.require(:mapping).permit(:user_id, :forum_id)
    end
end
