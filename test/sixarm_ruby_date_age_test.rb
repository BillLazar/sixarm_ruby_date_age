# -*- coding: utf-8 -*-
require 'simplecov'
SimpleCov.start
require 'test/unit'
require 'sixarm_ruby_date_age'

class DateAgeTest < Test::Unit::TestCase

  # for test_age_years and test_age_days
  BIRTHDATE     = Date.new(1980,10,31)
  VALENTINES    = Date.new(2011,02,14)
  HALLOWEEN     = Date.new(2011,10,31)
  NEW_YEARS_EVE = Date.new(2011,12,31)

  def test_age_in_days
    assert_equal(11063,BIRTHDATE.age_in_days(VALENTINES),     '< birthday')
    assert_equal(11322,BIRTHDATE.age_in_days(HALLOWEEN),      '= birthday')
    assert_equal(11383,BIRTHDATE.age_in_days(NEW_YEARS_EVE),  '> birthday')
  end

  def test_age_in_days_with_non_date
    assert_raise(ArgumentError){ BIRTHDATE.age_in_days('') }
  end

  def test_age_in_days_alias
    assert_equal(BIRTHDATE.age_in_days(VALENTINES), BIRTHDATE.age_in_days_on(VALENTINES))
  end

  def test_age_in_years
    assert_equal(30,BIRTHDATE.age_in_years(VALENTINES),    '< birthday')
    assert_equal(31,BIRTHDATE.age_in_years(HALLOWEEN),     '= birthday')
    assert_equal(31,BIRTHDATE.age_in_years(NEW_YEARS_EVE), '> birthday')
  end

  def test_age_in_years_with_non_date
    assert_raise(ArgumentError){ BIRTHDATE.age_in_years('') }
  end

  def test_age_in_years_alias
    assert_equal(BIRTHDATE.age_in_years(VALENTINES), BIRTHDATE.age_in_years_on(VALENTINES))
  end

end
