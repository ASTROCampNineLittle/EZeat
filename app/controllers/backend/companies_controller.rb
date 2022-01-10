class Backend::CompaniesController < ApplicationController
  before_action :set_company, only: [:edit, :update, :destroy]
  before_action :signed_in_checker, only: [:new, :edit, :update, :destroy]
  around_action :redirect_to_owned_company, only: [:new, :create]

  layout "backend"

  def new
    @company = Company.new
  end

  def create
    company = current_user.create_company(company_params)
    if company.save
      redirect_to backend_company_stores_path(current_user.company.id), notice: '新增公司成功'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if company.update(company_params)
      redirect_to backend_company_stores_path(company), notice: '修改公司成功'
    else
      render :edit
    end
  end

  def destroy
    @company.destroy
    redirect_to root_path
  end

  def redirect_to_owned_company
    if !current_user.company.nil?
      redirect_to backend_company_stores_path(current_user.company.id)
    end
  end

  private
    def company_params
      params.require(:company).permit(:name, :address, :tel, :manager_name )
    end

    def set_company
      @company = Company.find(params[:id])
    end
end
