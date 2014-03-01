module AlertCreator
  def self.create(type, model_instance, params = {})
    case type
    when :edit then return EditAlert.new(model_instance, params)
    when :create then return CreateAlert.new(model_instance, params)
    when :login then return LoginAlert.new(model_instance, params)
    else return Alert.new(params)
    end
  end

  class Alert
    attr_reader :message, :result
    def initialize model_instance, params
      @model_instance = model_instance
      @message = ["ERRORS"]
      build_message
    end

    def build_message
      @model_instance.errors.full_messages.each do |error_message|
        @message << "#{error_message}"
      end
    end
  end


  class CreateAlert < Alert
    def build_message
      return false if model_instance.valid?
      @message = ["Could not create this #{@model_instance.class.name}"]
      super
    end
  end

  class EditAlert < Alert
    def build_message
      return false if model_instance.valid?
      @message = ["Could not edit this #{@model_instance.class.name}"]
      super
    end
  end

  class LoginAlert < Alert
    def initialize user, params
      if user.password == params[:password]
        return false
      elsif user.nil?
        ["This user does not exist"]
      end

      ["The password you provided for '#{user.name}' is not valid"]
    end
  end
end

helpers AlertCreator