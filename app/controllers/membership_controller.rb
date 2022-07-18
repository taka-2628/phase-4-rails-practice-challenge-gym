class MembershipController < ApplicationController
  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response

  def create
    membership = Mebership.create!(membership_params)
    render json: membership, status: :created
  end

  private

  def membership_params
    params.permit(:id, :gym_id, :client_id, :charge)
  end

  def render_unprocessable_entity_response (invalid)
    render json: { errors: invalid.record.errors}, status: :unprocessable_entity
  end

end
