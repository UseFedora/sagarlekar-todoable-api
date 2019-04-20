$:.unshift File.join(File.dirname(__FILE__),'..','lib')
require 'api'

describe Todoable::Api do
    
    describe "Api methods" do
        let(:methods) { %i(lists create get delete patch delete_item create_item finish_item) }
        let(:subject) { Todoable::Api.new }
        
        it "defines the 8 methods" do
            methods.each do |method|
                expect(subject.respond_to? method.to_sym).to be_truthy
            end
        end
    end    
    
    #TODO Add specs to test Api methods with mocks
end
