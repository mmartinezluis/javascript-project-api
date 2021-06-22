class QuoteBlueprint < Blueprinter::Base
  identifier :id
  fields :body, :author_id, :author_name

  view :extended do 
    association :stories, blueprint: StoryBlueprint
  end
  
end

