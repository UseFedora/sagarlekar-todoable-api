$:.unshift File.join(File.dirname(__FILE__),'..','lib')
require 'todoable_api'

describe Todoable::TodoableApi do
    
    describe "Api methods" do
        let(:methods) { %i(lists create get delete patch delete_item create_item finish_item) }
        let(:subject) { Todoable::TodoableApi.new }
        
        it "defines the 8 methods" do
            methods.each do |method|
                expect(subject.respond_to? method).to be_truthy
            end
        end
    end    
    
    #TODO Add specs to test Api methods with mocks
end
