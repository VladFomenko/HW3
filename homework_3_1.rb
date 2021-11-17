#

class User
  def initialize(first_name:, last_name:, email:)
    @first_name = first_name
    @last_name = last_name
    @email = email
    @errors_result = []
  end

  attr_accessor :first_name

  attr_accessor :last_name

  attr_accessor :email
# why did it work? need to use @first_name and @last_name but works without @
  def full_name
    full_name = "#{first_name} #{last_name}"
  end

  def is_valid_email?
    /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i.match(email) ? true : false
  end

  def field_is_empty(value)
    value == nil ? true : false
  end

  def field_is_not_string(value)
    value.instance_of?(String) ? true : false
  end

  def field_is_short(value)
    value.length > 2 ? false : true
  end

  def check_mail(value)
    /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i.match(email) ? 'Not errors' : 'email is invalid'
  end

  def each_errors(value)
    if field_is_empty(value)
      'Field can not be empty.'
    elsif field_is_not_string(!value)
      'Field must be a string.'
    elsif field_is_short(value)
      'Field is so small, less than three characters.'
    else
      'Not errors'
    end
  end

  def errors
    @errors_result = []
    @errors_result << each_errors(first_name)
    @errors_result << each_errors(last_name)
    @errors_result << check_mail(email)
  end

  def valid?
    arr_data_user = [each_errors(first_name), each_errors(last_name), check_mail(email)]
    result = arr_data_user.select {|i| i != "Not errors"}
    result.size == 0 ? true : false
  end

end
