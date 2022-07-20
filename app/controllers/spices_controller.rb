class SpicesController < ApplicationController
    def index
        spices = Spice.all
        render json: spices
    end
    def show
        spice = get_spice
        render json: spice
    end
    def create
        spice = Spice.create(spice_params)
        render json: spice, status: :created
    end
    def update
        spice = get_spice
        spice.update(spice_params)
        render json: spice
    end
    def destroy
        spice = get_spice
        spice.destroy
        head :no_content
    end

    private

    def get_spice
        Spice.find_by(id: params[:id])
    end
    def spice_params
        params.permit(:title, :image, :description, :notes, :rating)
    end
end
