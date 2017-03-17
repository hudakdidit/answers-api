require 'rails_helper'

RSpec.describe DayLog, type: :model do
  it { should have_many(:answers) }
end
