class Admin::Cms::Faq::QuestionsController < Admin::Cms::Faq::BaseController
  before_filter :load_faq
  before_filter :load_category
  before_filter :build_question, only: [:new, :create]
  before_filter :load_question,  only: [:edit, :update, :destroy, :move_lower, :move_higher]

  def index
    @questions = @category.questions.order(:title).page(params[:page])
  end

  def new
  end

  def create
    @question.save!
    flash[:success] = 'Faq Category Question created'
    redirect_to admin_cms_faq_category_questions_path(@category)
  rescue ActiveRecord::RecordInvalid
    flash.now[:error] = 'Failed to create Faq Category Question'
    render action: :new
  end

  def edit
    render
  end

  def update
    @question.update_attributes!(question_params)
    flash[:success] = 'Faq Category Question updated'
    redirect_to admin_cms_faq_category_questions_path(@category)
  rescue ActiveRecord::RecordInvalid
    flash.now[:error] = 'Failed to update Faq Category Question'
    render action: :edit
  end

  def destroy
    @question.destroy
    flash[:success] = 'Faq Category Question removed'
    redirect_to action: :index
  end

  def move_lower
    @question.move_lower
    redirect_to admin_cms_faq_category_questions_path(@category)
  end

  def move_higher
    @question.move_higher
    redirect_to admin_cms_faq_category_questions_path(@category)
  end

  protected

  def load_category
    @category = @faq.categories.find(params[:category_id])
  rescue ActiveRecord::RecordNotFound
    flash[:error] = 'Faq Category not found'
    redirect_to action: :index
  end

  def load_question
    @question = @category.questions.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:error] = 'Faq Question not found'
    redirect_to action: :index
  end

  def build_question
    @question = @faq.questions.new(question_params)
    @question.category = @category
  end

  def question_params
    params.fetch(:question, {}).permit!
  end
end
