class ConnectsController < ApplicationController
  def index
    @users = User.all
  end
end
