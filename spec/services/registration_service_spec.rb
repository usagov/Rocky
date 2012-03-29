#***** BEGIN LICENSE BLOCK *****
#
#Version: RTV Public License 1.0
#
#The contents of this file are subject to the RTV Public License Version 1.0 (the
#"License"); you may not use this file except in compliance with the License. You
#may obtain a copy of the License at: http://www.osdv.org/license12b/
#
#Software distributed under the License is distributed on an "AS IS" basis,
#WITHOUT WARRANTY OF ANY KIND, either express or implied. See the License for the
#specific language governing rights and limitations under the License.
#
#The Original Code is the Online Voter Registration Assistant and Partner Portal.
#
#The Initial Developer of the Original Code is Rock The Vote. Portions created by
#RockTheVote are Copyright (C) RockTheVote. All Rights Reserved. The Original
#Code contains portions Copyright [2008] Open Source Digital Voting Foundation,
#and such portions are licensed to you under this license by Rock the Vote under
#permission of Open Source Digital Voting Foundation.  All Rights Reserved.
#
#Contributor(s): Open Source Digital Voting Foundation, RockTheVote,
#                Pivotal Labs, Oregon State University Open Source Lab.
#
#***** END LICENSE BLOCK *****
require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe RegistrationService do

  it 'should raise an error if the language is unknown' do
    lambda { RegistrationService.create_record(:lang => 'unknown') }.should raise_error UnsupportedLanguageError
  end

  it 'should raise validation errors when the record is invalid' do
    begin
      RegistrationService.create_record(:lang => 'en')
      fail 'ValidationError is expected'
    rescue RegistrationService::ValidationError => e
      e.field.should    == 'date_of_birth'
      e.message.should  == "Required"
    end
  end

  context 'complete record' do
    before { @reg = mock(Registrant) }
    before { mock(Registrant).build_from_api_data({ :locale => nil }) { @reg } }

    it 'should save the record and generate PDF' do
      @reg.save { true }
      @reg.generate_pdf { true }
      RegistrationService.create_record({}).should
    end
  end

end