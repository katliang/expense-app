# == Schema Information
#
# Table name: payments
#
#  id          :integer          not null, primary key
#  person_id   :integer
#  report_id   :integer
#  amount_owed :decimal(, )      not null
#  has_paid    :boolean          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class PaymentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
