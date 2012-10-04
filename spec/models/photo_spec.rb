require 'spec_helper'

describe Photo do
  it { should have_many(:palette_entries) }
  it { should have_many(:colors).through(:palette_entries) }
end
