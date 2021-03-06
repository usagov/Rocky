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
class Step4Controller < RegistrationStep
  CURRENT_STEP = 4
  
  attr_accessor :debug_data
  def debug_data
    @debug_data ||= {}
  end
  
  def show
    super

  end
  
  def update
    if params[:registrant]
      reg = params[:registrant]
      reg[:change_of_address] = !"#{reg[:prev_address]}#{reg[:prev_unit]}#{reg[:prev_city]}#{reg[:prev_zip_code]}".blank?
      reg[:change_of_name] = !"#{reg[:prev_first_name]}#{reg[:prev_middle_name]}#{reg[:prev_last_name]}".blank?
    end
    super
  end

  protected
  
  def find_registrant
    super
    if @registrant.has_ovr_pre_check?
      @registrant.decorate_for_state(self)
    end
  end

  def set_show_skip_state_fields
    if !@registrant.has_ovr_pre_check?
      @show_fields = "1"
    end
  end

  def advance_to_next_step
    @registrant.advance_to_step_5
  end

  def next_url
    registrant_step_5_url(@registrant)
  end

  def set_up_view_variables
    @state_id_tooltip = @registrant.state_id_tooltip
    
    @state_parties = @registrant.state_parties
    @race_tooltip = @registrant.race_tooltip
    @party_tooltip = @registrant.party_tooltip
    
    
    @question_1 = @registrant.question_1
    @question_2 = @registrant.question_2
  end
end
