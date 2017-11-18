require "../lucky_inflector"

class String
  def pluralize(count : Int = 0)
    if count == 1
      dup
    else
      LuckyInflector::Inflector.pluralize(self)
    end
  end

  def singularize
    LuckyInflector::Inflector.singularize(self)
  end

  def camelize(first_letter = :upper)
    case first_letter
    when :upper
      LuckyInflector::Inflector.camelize(self, true)
    when :lower
      LuckyInflector::Inflector.camelize(self, false)
    else
      raise ArgumentError.new("Invalid option, use either :upper or :lower.")
    end
  end

  def titleize(keep_id_suffix = false)
    LuckyInflector::Inflector.titleize(self, keep_id_suffix: keep_id_suffix)
  end

  def underscore
    LuckyInflector::Inflector.underscore(self)
  end

  def dasherize
    LuckyInflector::Inflector.dasherize(self)
  end

  def demodulize
    LuckyInflector::Inflector.demodulize(self)
  end

  def deconstantize
    LuckyInflector::Inflector.deconstantize(self)
  end

  def parameterize(separator = "-", preserve_case = false)
    LuckyInflector::Inflector.parameterize(self, separator: separator, preserve_case: preserve_case)
  end

  def tableize
    LuckyInflector::Inflector.tableize(self)
  end

  def classify
    LuckyInflector::Inflector.classify(self)
  end

  def humanize(capitalize = true, keep_id_suffix = false)
    LuckyInflector::Inflector.humanize(self, capitalize: capitalize, keep_id_suffix: keep_id_suffix)
  end

  def upcase_first
    LuckyInflector::Inflector.upcase_first(self)
  end

  def foreign_key(separate_class_name_and_id_with_underscore = true)
    LuckyInflector::Inflector.foreign_key(self, separate_class_name_and_id_with_underscore)
  end
end
