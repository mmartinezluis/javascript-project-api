class AuthorBlueprint < Blueprinter::Base
  identifier :id

  fields :name
  
  view :normal do
    association :quotes, blueprint: QuoteBlueprint
  end

end