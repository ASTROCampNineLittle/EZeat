class Backend::CompaniesController < ApplicationController
  before_action :set_company, only: [:edit, :update, :destroy]
  # 驗證須登入才能繼續的行為
  # before_action SignedInChecker, only: [:new, :edit, :update, :destroy]
  
  layout "backend"

  def new
    @company = Company.new
  end

  def create
    company = Company.new(company_params)

    if company.save
      redirect_to backend_company_stores_path(company), notice: '新增公司成功'
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

  private
    def company_params
      params.require(:company).permit(:name, :address, :tel, :manager_name )
    end

    def set_company
      @company = Company.find(params[:id])
    end
end