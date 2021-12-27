class DiagnosisItemsController < ApplicationController
  def index

  end

  def create

  end

  def new

  end

  def edit

  end

  def update

  end

  def destroy

  end

  private

    def diagnosis_items_params
      params.require(:patient).permit(:first_name, :last_name, :age, :email)
    end
end
