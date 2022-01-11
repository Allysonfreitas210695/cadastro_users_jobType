namespace :dev do
  desc 'TODO'
  task setup: :environment do
    if Rails.env.development?
      spinner_style('Apgando o BD.....') { 'rails db:drop' }
      spinner_style('Criando o BD.....') { 'rails db:create' }
      spinner_style('Migrando o BD.....') { 'rails db:migrate' }
      `rails dev:add_type_category`
      `rails dev:add_users`
    else
      puts 'Você nao está em desenvolmento!!!'
    end
  end

  desc 'Castrado dos tipos de moedas'
  task add_users: :environment do
    spinner_style('Cadastrando usuarios.....') do
      usurs = [
        {
          nome: 'Allyson Bruno de Freitas Fernandes',
          cpf: '333.222.777-88',
          idade: 23,
          profissao: 'Programador web',
          job_type: JobType.all.sample
        },
        {
          nome: 'Francisco costa',
          cpf: '111.666.333-11',
          idade: 21,
          profissao: 'Mecanico',
          job_type: JobType.first
        },
        {
          nome: 'Noberto carneiro',
          cpf: '333.222.555-86',
          idade: 23,
          profissao: 'Programador FullStack',
          job_type: JobType.second
        }
      ]
      usurs.each { |user| User.find_or_create_by!(user) }
    end
  end

  desc 'Castrado dos tipos de moedas'
  task add_type_category: :environment do
    spinner_style('Cadastrando categorias.....') do
      categorys = [
        {
          category: 'CLT'
        },
        {
          category: 'Informal'
        }
      ]
      categorys.each { |category| JobType.find_or_create_by!(category) }
    end
  end

  private

  def spinner_style(start_message, end_message = 'Sucesso', &block)
    spinner = TTY::Spinner.new("[:spinner] #{start_message}")
    spinner.auto_spin
    block.call if block_given?
    # sleep(2)
    spinner.success(end_message)
  end
end
