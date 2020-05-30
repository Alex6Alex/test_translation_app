class NewsController < ApplicationController
  def index
    news = News.all
    render json: NewsBlueprint.render(news)
  end

  def show
    news = News.find(params[:id])
    lang = params[:lang]
    translated_text = nil

    if lang.present?
      translation_connection = TranslationCacheDecorator.new(
        TranslationConnectionFactory.build
      )
      translated_text = translation_connection.translate(
        text: news.text, language: lang
      )
    end

    render(
      json: NewsBlueprint.render(news, view: :extended, text: translated_text)
    )
  rescue StandardError => e
    render(json: { error: true, message: e.message })
  end
end
