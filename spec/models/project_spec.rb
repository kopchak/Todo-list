require 'rails_helper'

describe Project do
  it {expect belong_to(:user)}
  it {expect have_many(:tasks)}
  it {expect validate_presence_of(:title)}
end