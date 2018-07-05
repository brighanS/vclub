# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

require 'rails_helper'

RSpec.describe User, type: :model do
  context 'Validation tests for User' do
    it 'ensures email address presence' do
      user = User.new(password: '258258', password_confirmation: '258258').save
      expect(user).to eq(false)
    end

    it 'ensures password presence' do
      user = User.new(email: 'example@vclub.com', password_confirmation: '258258').save
      expect(user).to eq(false)
    end

    #--Scenario not longer valid since password_confirmation presence is a controller level validation
    # it 'ensures password_confirmation presence' do
    #   user = User.new(email: 'example@vclub.com', password: '258258').save
    #   expect(user).to eq(false)
    # end

    it 'ensures password minimum length' do
      user = User.new(email: 'example@vclub.com', password: '258', password_confirmation: '258').save
      expect(user).to eq(false)
    end

    #--Scenario no longer valid 
    # it 'ensures email address is valid' do
    #   user = User.new(email: 'example@vclub',password: '258258', password_confirmation: '258258').save
    #   expect(user).to eq(false)
    # end

    it 'should save successfully' do
      user = User.new(email: 'example@vclub.com',password: '258258', password_confirmation: '258258').save
      expect(user).to eq(true)
    end
  end
end
