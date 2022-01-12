class PatientsController < ApplicationController
  load_and_authorize_resource

  def create
    if @patient.save
      redirect_to @patient
    else
      render :new
    end
  end

  def update
    if @patient.update(patient_params)
      redirect_to @patient
    else
      render :edit
    end
  end

  def destroy
    @patient.destroy
    redirect_to patients_path
  end

  private

  def patient_params
    params.require(:patient).permit(:first_name, :last_name, :age, :email)
  end
end
