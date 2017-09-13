module ProfileHelper
  def assessment_css(assessment)
    case assessment.first[1].personality_type_1.name
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