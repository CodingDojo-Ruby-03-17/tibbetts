require "spec_helper"

RSpec.describe Stinger do
  it "has a version number" do
    expect(Stinger::VERSION).not_to be nil
  end

  it "concatenates with undefined number of strings with a space" do
    expected = "Oscar Vazquez Zweig Olasaba Hernandez Ricardo Mendoza"
    expect(Stinger.spacify "Oscar", "Vazquez", "Zweig", "Olasaba", "Hernandez", "Ricardo", "Mendoza").to eq(expected)
  end

  it "liits a string to 10 characters" do
    except(Stringer.minify("Hello, this is long str", 10).to eq("Hello, thi...")
    except(Stringer.minify("Hello", 10).to eq("Hello")
  end

  it "replaces all words in string with a replacemnt" do

  end
end
