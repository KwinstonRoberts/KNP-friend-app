module ProfileHelper
  def assessment_css(assessment)
    puts assessment
    case assessment.result.personalities.first.name
      when "Mellow"
        return "mellowType"
      when "Social"
        return "socialType"
      when "Charismatic"
        return "charismaticType"
      when "Adventurous"
        return "adventureType"
      when "Rational"
        return "rationalType"
      when "Thoughtful"
        return "thoughtfulType"
      when "Reliable"
        return "reliableType"
      else
        return ''
    end
  end
end
