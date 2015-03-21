require 'yuzuki/frequency_evaluator'

RSpec.describe Yuzuki::FrequencyAnalyzer do
  it 'can detect lowercase words' do
    frequency_analyser = Yuzuki::FrequencyAnalyzer.new(%w(Matsumoto), [])
    expect(frequency_analyser.predominantly_japanese?('matsumoto')).to be true
  end

  it 'can detect uppercase words' do
    frequency_analyser = Yuzuki::FrequencyAnalyzer.new(%w(Matsumoto), [])
    expect(frequency_analyser.predominantly_japanese?('MATSUMOTO')).to be true
  end
end
