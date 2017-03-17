require 'rails_helper'

RSpec.describe Answer, type: :model do
  it { should validate_presence_of(:answer) }
  it { should validate_presence_of(:day_log_id) }
  it { should validate_presence_of(:question_id) }

  it { should belong_to(:day_log) }
  it { should belong_to(:question) }
end
