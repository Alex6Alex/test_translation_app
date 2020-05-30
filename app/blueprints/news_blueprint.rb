class NewsBlueprint < Blueprinter::Base
  identifier :id

  fields :title, :created_at

  view :extended do
    field(:text) do |news, options|
      options[:text] || news.text
    end
  end
end
