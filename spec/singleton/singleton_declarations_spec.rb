require_relative '../../singleton/derivate/SingletonMaker'
require_relative '../../singleton/derivate/AppLogger'
require_relative '../../singleton/derivate/DatabaseLogger'
require_relative '../../singleton/SingletonLogger'
require_relative '../../singleton/MultipleSingleton'
require_relative '../spec_helper'


describe 'Singleton' do
  context 'Multiple Declarations' do
    it 'avoid use new method' do
  		expect{SingletonMaker.new}.to raise_error(NoMethodError, "private method `new' called for SingletonMaker:Class")
    end

    it 'instance a AppLogger singleton' do
      applogger = SingletonMaker.instance('AppLogger')
      expect(applogger.class == AppLogger).to be true
    end

    it 'instance a DatabaseLogger singleton' do
      databaselogger = SingletonMaker.instance('DatabaseLogger')
      expect(databaselogger.class == DatabaseLogger).to be true
    end

    it 'uses the same instance of AppLogger' do
      applogger1 = SingletonMaker.instance('AppLogger')
      applogger2 = SingletonMaker.instance('AppLogger')
      expect(applogger1.object_id == applogger2.object_id).to be true
    end

    it 'uses the same instance of DatabaseLogger' do
      databaselogger1 = SingletonMaker.instance('DatabaseLogger')
      databaselogger2 = SingletonMaker.instance('DatabaseLogger')
      expect(databaselogger1.object_id == databaselogger2.object_id).to be true
    end

    it 'add content to applogs file' do
      applogger = SingletonMaker.instance('AppLogger')
      expect(applogger.add_log('Log app added')).to eq 'Log added'
    end

    it 'add content to dblogs file' do
      databaselogger = SingletonMaker.instance('DatabaseLogger')
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
      expect(logger1.object_id === logger2.object_id).to be true
    end

    it 'add content to logs file' do
      logger = SingletonLogger.instance
      expect(logger.add_log('Log added')).to eq 'Log added'
    end
  end

  context 'Multiple instances' do
    it 'avoid use new method' do
  		expect{MultipleSingleton.new}.to raise_error(NoMethodError, "private method `new' called for MultipleSingleton:Class")
    end

    it 'instance a MultipleSingleton singleton' do
      logger = MultipleSingleton.instance
      expect(logger.class == MultipleSingleton).to be true
    end

    it 'only instance a MultipleSingleton singleton three times' do
      singleton1 = MultipleSingleton.instance
      singleton2 = MultipleSingleton.instance
      singleton3 = MultipleSingleton.instance
      singleton4 = MultipleSingleton.instance
      expect(singleton1.object_id != singleton2.object_id && singleton1.object_id != singleton3.object_id).to be true
      expect(singleton2.object_id != singleton3.object_id).to be true
      expect(singleton1.object_id == singleton4.object_id).to be true
    end

    it 'loops throught diferent instances' do
      singleton1 = MultipleSingleton.instance
      singleton2 = MultipleSingleton.instance
      singleton3 = MultipleSingleton.instance
      singleton4 = MultipleSingleton.instance
      singleton5 = MultipleSingleton.instance
      singleton6 = MultipleSingleton.instance
      expect(singleton1.object_id == singleton4.object_id).to be true
      expect(singleton2.object_id == singleton5.object_id).to be true
      expect(singleton3.object_id == singleton6.object_id).to be true
    end
  end

end
