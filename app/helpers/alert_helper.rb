module AlertCreator
  DELIMITER = "-|-"
  def self.create(type, model_instance, params = {})
    case type
    when :edit then return EditAlert.new(model_instance)
    when :create then return CreateAlert.new(model_instance)
    when :answer then return AnswerAlert.new(model_instance, params)
    when :login then return LoginAlert.new(model_instance, params)
    when :create_user then return UserCreationAlert.new(model_instance, params)
    else Alert.new(params)
    end
  end

  def self.translate(error_message, result)
    return false if error_message.nil?
    error_message.gsub(/-\|-/,"#{result}")
  end

  class Alert
    attr_reader :message, :result
    def initialize model_instance
      @model_instance = model_instance
      @message = "ERRORS"
      build_message
    end

    def build_message
      @model_instance.errors.full_messages.each do |error_message|
        @message << "#{DELIMITER} #{error_message}"
      end
    end
  end


  class CreateAlert < Alert
    def build_message
      @message = "Could not create this note"
      super
    end
  end

  class EditAlert < Alert
    def build_message
      @message = "Could not edit this note"
      super
    end
  end

  class AnswerAlert < Alert
    def initialize card, params
      answer = params["answer"]
      if answer == card.answer
        @result = "right"
      else
        @result = "wrong"
      end
      @message = "The answer is #{result}!#{DELIMITER} #{card.question} -> #{answer}"
    end
  end

  class LoginAlert < Alert
    def initialize user, params
      if user.password = params[:password]
        return false
      end
      @message = "The info you provided for '#{user.name}' is not valid" if user.password = params[:password]
    end
  end

  class UserCreationAlert < Alert
    def initialize user, params
      return false if user.valid?
      super user
    end

    def build_message
      @message="The info you entered are not valid for user creation"
      super
    end
  end
end

helpers AlertCreator