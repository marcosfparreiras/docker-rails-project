# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Seeds Default Plans
p1 = Plan.create(name: 'Default Plan', value: 229)
p2 = Plan.create(name: 'Second Plan', value: 129)

# Seeds Default Players
Player.create(
  name: 'Marcos Filipe Parreiras',
  birthday: Date.new(1992, 3, 18),
  cpf: '111.111.111-22',
  rg: 'MG55980909',
  phones: ['31 987654321', '15 987654321'],
  email: 'myemail@mail.com',
  address_street: 'Rua Blabla',
  address_number: 666,
  address_complement: 'Casa',
  address_neighborhood: 'Inconfidentes',
  address_cep: '32999-888',
  address_city: 'Contagem',
  address_state: 'MG',
  responsible_name: 'Carmelita Aparecida de Oliveira',
  responsible_cpf: '222.222.222-55',
  responsible_phones: ['31 777654321', '16 797654321'],
  responsible_email: 'outroemail@mail.com',
  sport_name: 'Soccer',
  headquarter: 'Headquarter',
  conclusion_date: Date.new(2018, 2, 1),
  travel_date: Date.new(2019, 2, 1),
  signing_situation: 'Signing',
  signing_value: 188.99,
  signing_payment_mode: 'PAGSEGURO',
  advisory_situation: 'OK',
  advisory_value: 222.44,
  advisory_payment_mode: 'C. Crédito',
  advisory_notes: 'Any notes you want',
  plan_end_date: Date.new(2018, 4, 4),
  platform_payment_mode: 'Any payment mode',
  platform_parcels: 23,
  platform_notes: 'Any notes for AE Academy',
  active: true,
  plan_id: p1.id,
  password: 'mypass'
)

Player.create(
  name: 'Felipe Silva',
  birthday: Date.new(1992, 1, 1),
  cpf: '111.111.111-22',
  rg: 'MG55980909',
  phones: ['31 987654321', '15 987654321'],
  email: 'myemail2@mail.com',
  address_street: 'Rua Blabla',
  address_number: 666,
  address_complement: 'Casa',
  address_neighborhood: 'Inconfidentes',
  address_cep: '32999-888',
  address_city: 'Contagem',
  address_state: 'MG',
  responsible_name: 'Carmelita Aparecida de Oliveira',
  responsible_cpf: '222.222.222-55',
  responsible_phones: ['31 777654321', '16 797654321'],
  responsible_email: 'outroemail@mail.com',
  sport_name: 'Soccer',
  headquarter: 'Headquarter',
  conclusion_date: Date.new(2018, 2, 1),
  travel_date: Date.new(2019, 2, 1),
  signing_situation: 'Signing',
  signing_value: 188.99,
  signing_payment_mode: 'PAGSEGURO',
  advisory_situation: 'OK',
  advisory_value: 222.44,
  advisory_payment_mode: 'C. Crédito',
  advisory_notes: 'Any notes you want',
  plan_end_date: Date.new(2018, 4, 4),
  platform_payment_mode: 'Any payment mode',
  platform_parcels: 23,
  platform_notes: 'Any notes for AE Academy',
  active: true,
  plan_id: p2.id,
  password: 'mypass'
)

DocumentType.create(
  name: 'Transcript High School',
  slug: 'passport',
  description: 'This is your High School Transcript in English'
)

DocumentType.create(
  name: 'Transcript University',
  slug: 'translated_transcirpt_univ',
  description: 'This is your University Transcript in English'
)

Admin.create(
  name: 'Admin Teste',
  email: 'admin@test.com',
  role: 'admin',
  password: 'mypass',
  password_confirmation: 'mypass',
)
