module ApplicationHelper
  def hours_locale(date_us)
    date_us.strftime('%d/%m/%Y')
  end
  
  def ambient_locale
    Rails.env.development? ? 'Ambiente de Desenvolvimento' : Rails.env.production? ? 'Produção' : 'Teste'
  end

  def language_used
    I18n.locale == :en ? 'Estados Unidos' : 'Portugues do Brasil'
  end
end
