class AnswersController < ApplicationController
  # GET /answers
  # GET /answers.json
  def index
    @theme = Theme.find(params[:theme_id])
    @answers = @theme.answers.select('count(*) count, comment').group(:comment)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @answers }
    end
  end

  # GET /answers/new
  # GET /answers/new.json
  def new
    @theme = Theme.find(params[:theme_id])
    @answer = @theme.answers.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @answer }
    end
  end

  # POST /answers
  # POST /answers.json
  def create
    @theme = Theme.find(params[:theme_id])

    @answer = @theme.answers.build(params[:answer])
    @answer.ip = request.remote_ip
    @answer.user_id = current_user.id if current_user.present?

    respond_to do |format|
      if @answer.save
        format.html { redirect_to theme_answers_path(theme_id: @theme.id), notice: 'Answer was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end
end
