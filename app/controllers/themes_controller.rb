class ThemesController < ApplicationController
  before_filter :authenticate?, :except => %w(index)

  # GET /themes
  # GET /themes.json
  def index
    if params[:q].present?
      @themes = Theme.where(
          :id =>
              Answer.where("comment like ?", "%#{params[:q]}%").select('DISTINCT theme_id').pluck(:theme_id)
      ).order("answers_count DESC").page(params[:page]).per(20)
    else
      @themes = Theme.scoped.order("answers_count DESC").page(params[:page]).per(20)
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @themes }
    end
  end

  # GET /themes/1
  # GET /themes/1.json
  def show
    @theme = Theme.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @theme }
    end
  end

  # GET /themes/new
  # GET /themes/new.json
  def new
    @theme = Theme.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @theme }
    end
  end

  # POST /themes
  # POST /themes.json
  def create
    @theme = current_user.themes.build(params[:theme])

    respond_to do |format|
      if @theme.save
        format.html { redirect_to @theme, notice: 'Theme was successfully created.' }
        format.json { render json: @theme, status: :created, location: @theme }
      else
        format.html { render action: "new" }
        format.json { render json: @theme.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /themes/1
  # DELETE /themes/1.json
  def destroy
    @theme = Theme.find(params[:id])

    redirect_to root_url, flash: { error: "something went to wrong" } and return if @theme.user != current_user

    @theme.destroy

    respond_to do |format|
      format.html { redirect_to themes_url }
      format.json { head :no_content }
    end
  end

private
  def authenticate?
    if current_user.nil?
      redirect_to signin_path and return
    end
  end
end
