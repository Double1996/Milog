class ResumesController < ApplicationController
  before_action :get_user
  before_action :check_disabled_user
  before_action :check_signed_in, only: [:edit, :update]
  before_action :check_activated, only: [:edit, :update]
  before_action :correct_user, only: [:edit, :update]

  layout 'blog'

  def show
    @resume = @user.resume
    return render_404 unless @resume
    return render_404 if !@resume.posted && current_user != @user
  end

  def update
    @resume = current_user.resume
    @resume.update_attributes resume_params
    if @resume.valid?
      current_user.post_cache_pictures_in_resume @resume
      @hold = current_user.hold :resume
      @hold.update_attribute :cleaned, true if @hold
      flash.now[:success] = I18n.t "flash.success.save_resume"
    else
      flash.now[:warning] = @resume.errors.full_messages[0]
    end
      render :edit
  end

  def edit
    current_user.delete_cache_pictures
    @resume = current_user.resume
    @hold = current_user.hold :resume
    @resume.content = @hold.content if @hold && !@hold.cleaned?
  end

  private 
    def get_user
      @user = User.find_by username: params[:id]
      render_404 unless @user      
    end

    def correct_user
      render_404 unless current_user == @user
    end

    def resume_params
      params.require(:resume).permit :content, :content_html, :posted
    end
end
