class Answer < ApplicationRecord
    validates_presence_of :answer, :question_id
    belongs_to :question
end
