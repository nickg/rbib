require 'bibtex/entry'
require 'test/unit'

class TestEntry < Test::Unit::TestCase
  include BibTeX

  def setup
    @e = Entry.new(EntryType::Book, 'foo01')
  end
  
  def test_basic
    assert_equal EntryType::Book, @e.type
    assert_equal 'foo01', @e.key
  end

  def add_default_fields
    @e.add_field :author, 'C. Doof'
    @e.add_field :year, 2007
    @e.add_field Field.new(:url, 'www.doof.me.uk')
  end

  def test_fields
    add_default_fields
    
    assert_equal 'C. Doof', @e[:author]
    assert_equal 2007, @e[:year]
    assert_equal 'www.doof.me.uk', @e[:url]
  end

  def test_to_s
    add_default_fields

    expect = <<END
@book{foo01,
  author = {C. Doof},
  year = {2007},
  url = {www.doof.me.uk}
}

END
    assert_equal expect, @e.to_s
  end
end
