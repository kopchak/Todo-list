require 'rails_helper'

describe User do
  it {expect have_many(:projects)}
end