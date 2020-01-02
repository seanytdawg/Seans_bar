class SessionsController < ApplicationController
  skip_before_action :authorized, only: [:new, :create, :welcome]
  
  def new
  end

  def create
  end

  def login
  end

  def page_requires_login
  end 

  def welcome
  end
end
