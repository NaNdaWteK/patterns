require_relative '../../singleton/Logger'
require_relative '../../singleton/AppLogger'
require_relative '../../singleton/DatabaseLogger'
require_relative '../../singleton/SingletonLogger'
require_relative '../spec_helper'


describe 'Singleton' do
  context 'Multiple Declarations' do
    it 'avoid use new method' do
  		expect{Logger.new}.to raise_error(NoMethodError, "private method `new' called for Logger:Class")
    end

    it 'instance a Logger singleton' do
      logger = Logger.instance
      expect(logger.class == Logger).to be true
    end

    it 'instance a AppLogger singleton' do
      applogger = Logger.instance('AppLogger')
      expect(applogger.class == AppLogger).to be true
    end

    it 'instance a DatabaseLogger singleton' do
      databaselogger = Logger.instance('DatabaseLogger')
      expect(databaselogger.class == DatabaseLogger).to be true
    end

    it 'uses the same instance of Logger' do
      logger1 =Logger.instance
      logger2 =Logger.instance
      expect(logger1 === logger2).to be true
    end

    it 'uses the same instance of AppLogger' do
      applogger1 = Logger.instance('AppLogger')
      applogger2 = Logger.instance('AppLogger')
      expect(applogger1 === applogger2).to be true
    end

    it 'uses the same instance of DatabaseLogger' do
      databaselogger1 = Logger.instance('DatabaseLogger')
      databaselogger2 = Logger.instance('DatabaseLogger')
      expect(databaselogger1 === databaselogger2).to be true
    end

    it 'add content to logs file' do
      logger = Logger.instance
      expect(logger.add_log('Log added')).to eq 'Log added'
    end

    it 'add content to applogs file' do
      applogger = Logger.instance('AppLogger')
      expect(applogger.add_log('Log app added')).to eq 'Log added'
    end

    it 'add content to dblogs file' do
      databaselogger = Logger.instance('DatabaseLogger')
      expect(databaselogger.add_log('Log database added')).to eq 'Log added'
    end
  end
  context 'Ruby Module' do
    it 'avoid use new method' do
  		expect{SingletonLogger.new}.to raise_error(NoMethodError, "private method `new' called for SingletonLogger:Class")
    end

    it 'instance a SingletonLogger singleton' do
      logger = SingletonLogger.instance
      expect(logger.class == SingletonLogger).to be true
    end

    it 'uses the same instance of SingletonLogger' do
      logger1 =SingletonLogger.instance
      logger2 =SingletonLogger.instance
      expect(logger1 === logger2).to be true
    end

    it 'add content to logs file' do
      logger = SingletonLogger.instance
      expect(logger.add_log('Log added')).to eq 'Log added'
    end

  end
end
