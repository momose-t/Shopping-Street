class StartsController < ApplicationController
  def about
  end

  def concept
  end

  def explain
  	if owner_signed_in?
      @owner = Owner.find(current_owner.id)
    end
  end
end
