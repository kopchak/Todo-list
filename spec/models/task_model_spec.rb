require 'rails_helper'

describe Task do
  it {expect belong_to(:project)}
  it {expect validate_presence_of(:title)}
  it {expect validate_presence_of(:date)}
end