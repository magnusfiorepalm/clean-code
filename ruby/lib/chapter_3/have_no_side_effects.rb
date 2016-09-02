module HaveNoSideEffects

  class UserValidator

    def initialize
      @cryptographer = Cryptographer.new
    end

    def valid_password?(username, password)
      if (user = user(username))
        code_phrase    = user.phrase_encoded_password
        decoded_phrase = @cryptographer.decrypt(code_phrase, password)
        if "Valid Password" == decoded_phrase
          Session.new
          return true
        end
      end
      false
    end

    private

    def user(username)
      OpenStruct.new(phrase_encoded_password: "encoded password")
    end
  end

  class Cryptographer
    def decrypt(code_phrase, password)
      "Valid Password"
    end
  end

  class Session
    def initialize
      #initialize a user session
    end
  end
end
