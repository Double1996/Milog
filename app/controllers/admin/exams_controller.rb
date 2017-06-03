class Admin::ExamsController < Admin::ApplicationController
  def new
    @exam = Exam.new
  end

  def create
    @exam = Exam.new(exam_params)
    if @exam.save
      flash[:success] = [" 考试 #{exam.title} 已经生成 "]
      redirect_to choices_path(:exam_id => @exam.id)
    else
      flash[:danger] = @exam.errors.full_messages
      render :new
    end
  end

  private

  def exam_params
    params.require(:exam).permit(:title, :description)
  end
end