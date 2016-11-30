class CrimesController < ApplicationController
  def index
    respond_to do |format|
      scope = Crime
      scope = scope.where(crime_type: params['category']) if params['category'].present?
      scope = scope.where(outcome: params['outcome']) if params['outcome'].present?

      @count = scope.count

      format.html {
        @categories = ["Other crime", "Possession of weapons", "Criminal damage and arson", "Shoplifting", "Robbery", "Burglary", "Drugs", "Other theft", "Public order", "Violence and sexual offences", "Vehicle crime", "Bicycle theft", "Theft from the person", "Anti-social behaviour",]
        @outcomes = ["Under investigation", "Court result unavailable", "Offender ordered to pay compensation", "Offender given suspended prison sentence", "Defendant found not guilty", "Investigation complete; no suspect identified", "Offender sent to prison", "Offender given absolute discharge", "Offender given a drugs possession warning", "Unable to prosecute suspect", "Suspect charged as part of another case", "Local resolution", "Offender given a caution", "Offender fined", "Offender otherwise dealt with", "Offender given community sentence", "Offender given conditional discharge", "Defendant sent to Crown Court", "Formal action is not in the public interest", "Court case unable to proceed", "Offender deprived of property", "Awaiting court outcome", "Offender given penalty notice" ]
      }

      format.js
    end
  end
end
