class ContactSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :birthdate #, :author

  belongs_to :kind do
    link(:related) {contact_kind_url(object.id)}
  end

  has_many :phones do
    link(:related) {contact_phones_url(object.id)}
  end

  has_one :address do
    link(:related) {contact_address_url(object.id)}
  end

  #link(:self) {contact_path(object.id)}
  #link(:kind) {kind_path(object.kind.id)}

  #ou passando a url (devemos configurar o host e a porta em development e/ou production)
  link(:self) {contact_url(object.id)}
  link(:kind) {kind_url(object.kind.id)}

  # def author
  #   "Kaio"
  # end

  meta do
    {author: "Kaio"}
  end

  def attributes(*args)
    h = super(*args)
    h[:birthdate] = (I18n.l(object.birthdate) unless object.birthdate.blank?) #formata para o estilo BR
    h
  end

end
