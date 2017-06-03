class ExamsController < ApplicationController
  def index
    @exams = Exam.all.order(:id).reverse_order
  end


end
