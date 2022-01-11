# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users =
  [
    {
      nome: 'Allyson Bruno de Freitas Fernandes',
      cpf: '110.913.874-19',
      idade: 26,
      profissao: 'Tecnologia',
      job_type: JobType.first
    },
    {
      nome: 'Jose Lucas Santos',
      cpf: '111.222.333-89',
      idade: 21,
      profissao: 'Agricultor',
      job_type: JobType.first
    },
    {
      nome: 'Noberto carneiro',
      cpf: '333.222.555-86',
      idade: 23,
      profissao: 'Programador FullStack',
      job_type: JobType.first
    },
    {
      nome: 'Noberto carneiro',
      cpf: '333.222.555-86',
      idade: 23,
      profissao: 'Programador FullStack',
      job_type: JobType.first
    },
    {
      nome: 'Francisco costa',
      cpf: '111.666.333-11',
      idade: 21,
      profissao: 'Mecanico',
      job_type: JobType.first
    }
  ]

# categorys.each { |category| JobType.find_or_create_by(category) }
users.each { |user| User.find_or_create_by(user) }
