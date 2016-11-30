class CrimesController < ApplicationController
  def index
    respond_to do |format|
      if params['category'].present?
        @count = Crime.where(crime_type: params['category']).count
      else
        @count = Crime.count
      end

      format.html {
        @categories = ["Other crime", "Possession of weapons", "Criminal damage and arson", "Shoplifting", "Robbery", "Burglary", "Drugs", "Other theft", "Public order", "Violence and sexual offences", "Vehicle crime", "Bicycle theft", "Theft from the person", "Anti-social behaviour",]
      }

      format.js
    end
  end
end
