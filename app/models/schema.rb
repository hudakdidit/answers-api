UserType = GraphQL::ObjectType.define do
  name 'User'
  description '...'

  field :id, !types.String
  field :email, !types.String
  field :questions, -> { types[QuestionType] }
  field :answers, -> { types[AnswerType] }
end

QuestionType = GraphQL::ObjectType.define do
  name 'Question'
  description '...'

  field :id, !types.String
  field :question, !types.String
  field :answers, -> { types[AnswerType] }
end

AnswerType = GraphQL::ObjectType.define do
  name 'Answer'
  description '...'

  field :id, !types.String
  field :answer, !types.String
  field :user, UserType
end

QueryType = GraphQL::ObjectType.define do
  name 'Query'
  description '...'

  field :users do
    type GraphQL::ListType.new(
      of_type: UserType
    )
    argument :id, types.String
    resolve -> (root, args, ctx) {
      return User.where(id: args[:id]) if args[:id]
      User.all
    }
  end

  field :questions do
    type GraphQL::ListType.new(
      of_type: QuestionType
    )
    argument :id, types.String
    resolve -> (root, args, ctx) {
      return Question.where(id: args[:id]) if args[:id]
      Question.all
    }
  end

  field :answers do
    type GraphQL::ListType.new(
      of_type: AnswerType
    )
    argument :id, types.String
    argument :question_id, types.String
    resolve -> (root, args, ctx) {
      return Answer.where(question_id: args[:id]) if args[:id]
      return Answer.where(id: args[:question_id]) if args[:question_id]
      Answer.all
    }
  end
end

Schema = GraphQL::Schema.new(
    query: QueryType
)
