class AddMeaningfulContext

  def print_quess_statistics(candidate, count)
    if count == 0
      number          = "no"
      verb            = "are"
      plural_modifier = "s"
    elsif count == 1
      number          = "1"
      verb            = "is"
      plural_modifier = ""
    else
      number          = count.to_s
      verb            = "are"
      plural_modifier = "s"
    end

    "There #{verb} #{number} #{candidate}#{plural_modifier}"
  end

end

class GuessStatisticsMessage

  def initialize(candidate:, count:)
    @candidate = candidate
    @count     = count
  end

  def print
    create_plural_dependent_message_parts
    "There #{verb} #{number} #{candidate}#{plural_modifier}"
  end

  private

  attr_reader :candidate, :count, :number, :verb, :plural_modifier

  def create_plural_dependent_message_parts
    if count == 0
      no_letters
    elsif count == 1
      one_letter
    else
      many_letters
    end
  end

  def no_letters
    @number          = "no"
    @verb            = "are"
    @plural_modifier = "s"
  end

  def one_letter
    @number          = "1"
    @verb            = "is"
    @plural_modifier = ""
  end

  def many_letters
    @number          = count.to_s
    @verb            = "are"
    @plural_modifier = "s"
  end

end
