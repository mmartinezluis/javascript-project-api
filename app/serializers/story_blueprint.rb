class StoryBlueprint < Blueprinter::Base
  identifier :id
  fields :description, :user_id, :quote_id, :created_at, :updated_at

  view :normal do 
    association :quote, blueprint: QuoteBlueprint
  end
end