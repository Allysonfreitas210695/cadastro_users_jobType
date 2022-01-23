namespace :dev do
  PASSWORD = 123456.to_s

  desc 'TODO'
  task setup: :environment do
    if Rails.env.development?
      spinner_style('Apgando o BD.....') { %x(rails db:drop) }
      spinner_style('Criando o BD.....') { %x(rails db:create) }
      spinner_style('Migrando o BD.....') { %x(rails db:migrate) }
      spinner_style('Adicionando Admins extras.....') { %x(rails dev:add_admins) }
      spinner_style('Adicionando categorys.....') { %x(rails dev:add_type_category) }
      spinner_style('Adicionando Users fake.....') { %x(rails dev:add_users) }
    else
      puts 'Você nao está em desenvolmento!!!'
    end
  end

  desc 'Castrado dos tipos de moedas'
  task add_users: :environment do
    usurs = [
        {
          nome: 'Allyson Bruno de Freitas Fernandes',
          cpf: '333.222.777-88',
          idade: 23,
          profissao: 'Programador web',
          job_type: JobType.all.sample,
          admin: Admin.all.sample
        },
        {
          nome: 'Francisco costa',
          cpf: '111.666.333-11',
          idade: 21,
          profissao: 'Mecanico',
          job_type: JobType.first,
          admin: Admin.all.sample
        },
        {
          nome: 'Noberto carneiro',
          cpf: '333.222.555-86',
          idade: 23,
          profissao: 'Programador FullStack',
          job_type: JobType.second,
          admin: Admin.all.sample
        }
    ]
    usurs.each { |user| User.find_or_create_by(user) }
  end

  desc 'Castrado dos tipos de moedas'
  task add_type_category: :environment do
    categorys = [
        {
          category: 'CLT'
        },
        {
          category: 'Informal'
        }
      ]
    categorys.each { |category| JobType.find_or_create_by(category) }
  end

  desc 'Cadastro de Admin extras'
  task add_admins: :environment do
    1..2.times do
      Admin.create!(name: Faker::Name.name, email: Faker::Internet.email, password: PASSWORD, password_confirmation: PASSWORD)
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
