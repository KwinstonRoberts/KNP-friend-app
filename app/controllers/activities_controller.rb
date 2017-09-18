class ActivitiesController < ApplicationController
  #before_action { @user = User.find(session[:user_id]) }

  def create

    # redirect '/profiles/2'
    # params gives us the activiy id's that the user selected
    listOfActivities = params["activity"].map{|k, v| v}

    activityList = Activity.where(id: listOfActivities)
    # Create activites for a user
    @user = User.find(session[:user_id])
    @user.activities << activityList

  end
end