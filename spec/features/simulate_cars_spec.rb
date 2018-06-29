require 'rails_helper'

RSpec.feature "SimulateCars", type: :feature do

  context 'Creating a car for simulating' do
    Steps 'Creating a car' do

      Given 'I am on the landing page' do
        visit '/'
      end

      When 'I fill in the car make and model year' do
          fill_in 'make', with: 'DeLorean'
          fill_in 'model_year', with: '1985'
      end

      And 'I can submit the information' do
        click_button 'Simulate Car'
      end

      Then "I can see the car's info" do
        expect(page).to have_content('Make: DeLorean')
        expect(page).to have_content('Model Year: 1985')
      end

      And 'I can see the speed of the car' do
        expect(page).to have_content('Current Speed: 0 km/h')
      end

    end
  end

  context 'Simulating a car' do
    Steps 'Speeding up a car' do

      Given 'I have created a car' do
        visit '/'
        fill_in 'make', with: 'DeLorean'
        fill_in 'model_year', with: '1985'
        click_button 'Simulate Car'
      end

      Then "the car's speed is 0 km/h" do
        expect(page).to have_content('Current Speed: 0 km/h')
      end

      When "I can click the accelerate button" do
        click_button 'accelerate'
      end

      Then 'the speed of the car should be 10 km/h higher' do
        expect(page).to have_content('Current Speed: 10 km/h')
      end
    end

    Steps 'braking a car' do

      Given 'I have created a car and accelerated it once' do
        visit '/'
        fill_in 'make', with: 'DeLorean'
        fill_in 'model_year', with: '1985'
        click_button 'Simulate Car'
        click_button 'accelerate'
      end

      When 'I can click the brake button' do
        click_button 'brake'
      end

      Then 'the speed of the car should be 7 km/h lower' do
        expect(page).to have_content ('Current Speed: 3 km/h')
      end

      When 'I can click the brake button' do
        click_button 'brake'
      end

      And 'the speed of the car should be 0 km/h' do
        expect(page).to have_content ('Current Speed: 0 km/h')
      end
    end

    Steps 'toggling the light switch' do

      Given 'I have created a car' do
        visit '/'
        fill_in 'make', with: 'DeLorean'
        fill_in 'model_year', with: '1985'
        click_button 'Simulate Car'
      end

      Then 'I can see that the lights are by default off' do
        expect(page).to have_content ('Light Status: OFF')
      end

      When 'I can click the light switch button' do
        click_button 'light switch'
      end

      Then 'light status will show as ON' do
        expect(page).to have_content ('Light Status: ON')
      end

      When 'I can click the light switch button again' do
        click_button 'light switch'
      end

      Then 'light status will show as OFF again' do
        expect(page).to have_content ('Light Status: OFF')
      end
    end

  end # ends context 2

end #ends line 3



# end
