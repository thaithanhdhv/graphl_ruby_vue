require 'spec_helper'

describe AuthorDecorator do
  let(:author) { Author.new.extend AuthorDecorator }
  subject { author }
  it { should be_a Author }
end
