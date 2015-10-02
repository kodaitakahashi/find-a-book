#coding:utf-8

require 'spec_helper'
require 'fab'
require 'generate'

describe Fab do
  it 'has a version number' do
    expect(Fab::VERSION).not_to be nil
  end

  describe 'Fab::Api' do
    it 'farst apikey.rb nil' do
      apikey_path = File.expand_path('../../lib',__FILE__)
      apikey_path << "/apikey.rb"
      file = File.open(apikey_path,'r')
      expect(file.read).to eq ""
    end
    let(:file) { Fab::Api.new}
    it 'check create_apifile true' do
      expect( file.create_apifile('test1')).to be true
    end
    it 'check remake_apifile' do
      expect( file.remake_apifile('test')).to be true
    end
  end
  
  describe 'Fab::Output' do
    it 'check const not nil' do
      expect(Fab::Output::LINE_TEMPLATE).not_to be nil
      expect(Fab::Output::LINE_BREAK_TEMPLATE).not_to be nil
      expect(Fab::Output::POSSIBLE_TEMPLATE).not_to be nil
      expect(Fab::Output::IMPOSSIBLE_TEMPLATE).not_to be nil
    end
  end

  describe 'Fab::Library' do
    it 'check const not nil' do
      expect(Fab::Library::NONE_APIKEY_TEMPLATE).not_to be nil
    end
    it 'check initialize param' do
      check = Fab::Library.new
      expect(check.instance_variable_get(:@library_send_param)).not_to be nil
    end
    it 'check set param' do
      check = Fab::Library.new
      check.library_set_param("大阪府","大東市")
      expect(check.instance_variable_get(:@library_send_param)).to eq "http://api.calil.jp/library?appkey=test&pref=大阪府&city=大東市"
    end
  end
  
  ISBN_TEST = 0
  describe 'Fab::Book' do
    let(:book) {Fab::Book.new}
    it 'check book_set_param' do
      book.book_set_param(ISBN_TEST)
      expect(book.instance_variable_get(:@book_send_param)).not_to be nil
      expect(book.instance_variable_get(:@book_send_param)).to eq "http://api.calil.jp/check?appkey=test&isbn=0&format=xml"
    end
  end
  Fab::Api.new.delete()
end

