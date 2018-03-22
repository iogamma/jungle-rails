class Admin::DashboardController < Admin::BaseController

  def show
    @building = Building.all
  end
end
