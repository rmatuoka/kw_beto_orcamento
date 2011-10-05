class SurveysController < ApplicationController
  def index
    @surveys = Survey.all
  end

  def show
    @survey = Survey.find(params[:id])
    cookies.delete(:respondeu)
  end

  def new
    if !cookies[:respondeu]
      @survey = Survey.new
    else
      redirect_to survey_path(1)
    end
  end

  def create
    @survey = Survey.new(params[:survey])
    if @survey.save
      UserMailer.resposta(@survey).deliver
      cookies[:respondeu] = { :value => true , :expires => 20.days.from_now }
      redirect_to @survey#, :notice => "Resposta salva com sucesso!"
      
    else
      render :action => 'new'
    end
  end

  def edit
    @survey = Survey.find(params[:id])
  end

  def update
    @survey = Survey.find(params[:id])
    if @survey.update_attributes(params[:survey])
      redirect_to @survey, :notice  => "Successfully updated survey."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @survey = Survey.find(params[:id])
    @survey.destroy
    redirect_to surveys_url, :notice => "Successfully destroyed survey."
  end
end
