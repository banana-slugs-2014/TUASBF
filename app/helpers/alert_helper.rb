module AlertCreator
  def self.create(type, model_instance, params = {})
    case type
    when :edit then return EditAlert.new(model_instance, params)
    when :create then return CreateAlert.new(model_instance, params)
    when :login then return LoginAlert.new(model_instance, params)
    else Alert.new(params)
    end
  end

  class Alert
    attr_reader :message, :result, :exists
    def initialize model_instance, params
      @exists = true
      if model_instance.nil?
        @message = ["The #{model_instance.class.name} should not be null"]
      else
        @model_instance = model_instance
        @exists = false if @model_instance.valid?
        @message = ["ERRORS"]
        build_message
      end
    end

    def build_message
      @model_instance.errors.full_messages.each do |error_message|
        @message << "#{error_message}"
      end
    end
  end


  class CreateAlert < Alert
    def build_message
      @message = ["Could not create this #{@model_instance.class.name}"]
      super
    end
  end

  class EditAlert < Alert
    def build_message
      @message = ["Could not edit this #{@model_instance.class.name}"]
      super
    end
  end

  class LoginAlert < Alert
    def initialize user, params
      @exists = true
      if user.nil?
        @message = ["There is no such user"]
      elsif user.password == params[:password]
        @exists = false
      else
        @message = ["The password you provided for '#{@user}' is not valid"]
      end
    end
  end
end

helpers AlertCreator