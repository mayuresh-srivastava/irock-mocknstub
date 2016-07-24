class Character
	def initialize(strength: 1, die: Die.new, logger: Logger.new)
		@die = die
		@strength = strength
		@logger = logger
	end

	def climb(difficulty: 10)
		roll = die.roll + strength
		logger.log("Climbing check. Difficulty: #{difficulty}. Roll: #{roll}")
		roll >= difficulty
	end

	private

	attr_reader :die, :strength, :logger
end

describe Character do
	describe 'climbing check skill' do
		let(:die) { double } #testdouble
		let(:logger) { double("Logger", log: nil) }
		let(:character) { Character.new(strength: 5, die: die, logger: logger)}
    it 'climbs successfully when roll + strength is more than difficulty' do
    	allow(die).to receive(:roll) { 11 } #stubbing the roll method
    	expect(character.climb(difficulty: 15)).to be_truthy
    end

    it 'fails climbing check when roll + strength is less than difficulty' do
	    allow(die).to receive(:roll) { 5 } #stubbing the role method
    	expect(character.climb(difficulty: 15)).to be_falsey
    end

    it 'commands logger to log climb skill check' do
    	allow(die).to receive(:roll) { 7 } #stubbing i.e. asserting
    	expect(logger).to receive(:log).with("Climbing check. Difficulty: 10. Roll: 12") #Assert befor Act(Mocking)
    	character.climb(difficulty: 10) #Act
    end

	end	
end
