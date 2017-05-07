class Player < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true

  belongs_to :plan
  has_many :documents

  scope :active, -> { where(active: true).order(name: :asc) }
  scope :inactive, -> { where(active: false).order(name: :asc) }

  def activate
    update(active: true)
  end

  def deactivate
    update(active: false)
  end

  def print_phones
    format_phones(phones)
  end

  def print_responsible_phones
    format_phones(responsible_phones)
  end

  def print_birthday
    format_date(birthday)
  end

  def print_conclusion_date
    format_date(conclusion_date)
  end

  def print_travel_date
    format_date(travel_date)
  end

  def print_plan_end_date
    format_date(plan_end_date)
  end

  def print_plan_name
    plan.name
  end

  def print_plan_value
    format_currency(plan.value)
  end

  def format_phones(arr)
    arr.join(', ')
  end

  def format_date(date)
    return '' unless date
    date.strftime('%d/%m/%Y')
  end

  def format_currency(value)
    return '' unless value
    "R$ #{format('%.2f', value.to_f)}"
  end

  # def labels
  LABELS = {
    name: 'Name',
    birthday: 'Birthday',
    cpf: 'CPF',
    rg: 'RG',
    phones: 'Phones',
    email: 'Email',
    address_street: 'Stret',
    address_number: 'Number',
    address_complement: 'Complement',
    address_neighborhood: 'Neighborhood',
    address_cep: 'CEP',
    address_city: 'City',
    address_state: 'State',
    responsible_name: 'Responsible Name',
    responsible_cpf: 'Responsible CPF',
    responsible_phones: 'Responsible Phones',
    responsible_email: 'Responsible Email',
    sport_name: 'Sport',
    headquarter: 'Headquarter',
    conclusion_date: 'Conclusion Date',
    travel_date: 'Travel Date',
    signing_situation: 'Signing Situation',
    signing_value: 'Signing Value',
    signing_payment_mode: 'Signing Payment Mode',
    advisory_situation: 'Advisory Situation',
    advisory_value: 'Advisory Value',
    advisory_payment_mode: 'Advisory Payment Mode',
    advisory_notes: 'Advisory Notes',
    plan_end_date: 'Plan End Date',
    platform_payment_mode: 'Platform Payment Mode',
    platform_parcels: 'Platform Parcels',
    platform_notes: 'Platform Notes',
    plan_name: 'Plan Name',
    plan_value: 'Plan Value',
    active: 'Active'
  }.freeze

  METHODS = {
    name: :name,
    birthday: :print_birthday,
    cpf: :cpf,
    rg: :rg,
    phones: :print_phones,
    email: :email,
    address_street: :address_street,
    address_number: :address_number,
    address_complement: :address_complement,
    address_neighborhood: :address_neighborhood,
    address_cep: :address_cep,
    address_city: :address_city,
    address_state: :address_state,
    responsible_name: :responsible_name,
    responsible_cpf: :responsible_cpf,
    responsible_phones: :print_responsible_phones,
    responsible_email: :responsible_email,
    sport_name: :sport_name,
    headquarter: :headquarter,
    conclusion_date: :print_conclusion_date,
    travel_date: :print_travel_date,
    signing_situation: :signing_situation,
    signing_value: :signing_value,
    signing_payment_mode: :signing_payment_mode,
    advisory_situation: :advisory_situation,
    advisory_value: :advisory_value,
    advisory_payment_mode: :advisory_payment_mode,
    advisory_notes: :advisory_notes,
    plan_end_date: :print_plan_end_date,
    platform_payment_mode: :platform_payment_mode,
    platform_parcels: :platform_parcels,
    platform_notes: :platform_notes,
    plan_name: :print_plan_name,
    plan_value: :print_plan_value,
    active: :active
  }.freeze
end
