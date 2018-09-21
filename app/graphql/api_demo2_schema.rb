require 'types/mutation_type'

ApiDemo2Schema = GraphQL::Schema.define do
  mutation(Types::MutationType)
  query(Types::QueryType)
end
