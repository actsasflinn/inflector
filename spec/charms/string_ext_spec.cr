require "../spec_helper"

require "../support/inflector_test_cases"

require "../../src/lucky_inflector"
require "../../src/charms/string_extensions"

include InflectorTestCases

describe LuckyInflector::Inflector do
  it "should test pluralize" do
    SingularToPlural.each do |singular, plural|
      singular.pluralize.should eq plural
    end

    "plurals".pluralize.should eq "plurals"

    "blargle".pluralize(0).should eq "blargles"
    "blargle".pluralize(1).should eq "blargle"
    "blargle".pluralize(2).should eq "blargles"
  end

  it "should singularize" do
    SingularToPlural.each do |singular, plural|
      plural.singularize.should eq singular
    end
  end

  it "should titleize" do
    MixtureToTitleCase.each do |before, titleized|
      before.titleize.should eq titleized
    end
  end

  it "should titleize_with_keep_id_suffix" do
    MixtureToTitleCaseWithKeepIdSuffix.each do |before, titleized|
      before.titleize(keep_id_suffix: true).should eq titleized
    end
  end

  it "should upcase first" do
    "what a Lovely Day".upcase_first.should eq "What a Lovely Day"
  end

  it "should upcase first with one char" do
    "w".upcase_first.should eq "W"
  end

  it "should upcase first with empty string" do
    "".upcase_first.should eq ""
  end

  it "should camelize" do
    CamelToUnderscore.each do |camel, underscore|
      underscore.camelize.should eq camel
    end
  end

  it "should camelize lower" do
    "Capital".camelize(:lower).should eq "capital"
  end

  it "should camelize invalid option" do
    expect_raises ArgumentError, "Invalid option, use either :upper or :lower." do
      "Capital".camelize(nil)
    end
  end

  it "should dasherize" do
    UnderscoresToDashes.each do |underscored, dasherized|
      underscored.dasherize.should eq dasherized
    end
  end

  it "should underscore" do
    CamelToUnderscore.each do |camel, underscore|
      camel.underscore.should eq underscore
    end

    "HTMLTidy".underscore.should eq "html_tidy"
    "HTMLTidyGenerator".underscore.should eq "html_tidy_generator"
  end

  it "should underscore to lower camel" do
    UnderscoreToLowerCamel.each do |underscored, lower_camel|
      underscored.camelize(:lower).should eq lower_camel
    end
  end

  it "should demodulize" do
    "MyApplication::Billing::Account".demodulize.should eq "Account"
  end

  it "should deconstantize" do
    "MyApplication::Billing::Account".deconstantize.should eq "MyApplication::Billing"
  end

  it "should foreign_key" do
    ClassNameToForeignKeyWithUnderscore.each do |klass, foreign_key|
      klass.foreign_key.should eq foreign_key
    end

    ClassNameToForeignKeyWithoutUnderscore.each do |klass, foreign_key|
      klass.foreign_key(false).should eq foreign_key
    end
  end

  it "should tableize" do
    ClassNameToTableName.each do |class_name, table_name|
      class_name.tableize.should eq table_name
    end
  end

  it "should classify" do
    ClassNameToTableName.each do |class_name, table_name|
      table_name.classify.should eq class_name
    end
  end

  it "should humanize" do
    UnderscoreToHuman.each do |underscore, human|
      underscore.humanize.should eq human
    end
  end

  it "should humanize without capitalize" do
    UnderscoreToHumanWithoutCapitalize.each do |underscore, human|
      underscore.humanize(capitalize: false).should eq human
    end
  end

  it "should humanize with keep id suffix" do
    UnderscoreToHumanWithKeepIdSuffix.each do |underscore, human|
      underscore.humanize(keep_id_suffix: true).should eq human
    end
  end
end
