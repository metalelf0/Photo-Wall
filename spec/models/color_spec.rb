require 'spec_helper'

describe Color do
  it { should validate_presence_of :red }
  it { should validate_presence_of :green }
  it { should validate_presence_of :blue }

  it { should validate_numericality_of :red }
  it { should validate_numericality_of :green }
  it { should validate_numericality_of :blue }

  it { should allow_value(0).for(:red) }
  it { should allow_value(255).for(:red) }
  it { should_not allow_value(-5).for(:red) }

  it { should allow_value(0).for(:green) }
  it { should allow_value(255).for(:green) }
  it { should_not allow_value(-5).for(:green) }

  it { should allow_value(0).for(:blue) }
  it { should allow_value(255).for(:blue) }
  it { should_not allow_value(-5).for(:blue) }
end
