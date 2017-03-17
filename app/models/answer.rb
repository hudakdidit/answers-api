class Answer < ApplicationRecord
    validates_presence_of :answer, :day_log_id, :question_id
    belongs_to :question
    belongs_to :day_log
end
