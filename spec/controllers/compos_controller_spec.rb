require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.	If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.	There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.	Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe ComposController do

	# This should return the minimal set of attributes required to create a valid
	# Compo. As you add validations to Compo, be sure to
	# update the return value of this method accordingly.
	before(:each) do
		@game = FactoryGirl.create(:game)
	end
	def valid_attributes
		{:group_size => 1, :slots => 1, :game_id => @game.id, :date_time => "2012-10-10-12-12"}
	end

	# This should return the minimal set of values that should be in the session
	# in order to pass any filters (e.g. authentication) defined in
	# ComposController. Be sure to keep this updated too.

	describe_access(
      :login => [:index, :destroy, :show, :new, :update, :create]
  ) do

		describe "GET index" do
			it "assigns all compos as @compos" do
				compo = Compo.create! valid_attributes
				get :index
				assigns(:compos).should eq([compo])
			end
		end

		describe "GET show" do
			it "assigns the requested compo as @compo" do
				compo = Compo.create! valid_attributes
				get :show, {:id => compo.to_param}
				assigns(:compo).should eq(compo)
			end
		end

		describe "GET new" do
			it "assigns a new compo as @compo" do
				get :new, {}
				assigns(:compo).should be_a_new(Compo)
			end
		end

		describe "GET edit" do
			it "assigns the requested compo as @compo" do
				compo = Compo.create! valid_attributes
				get :edit, {:id => compo.to_param}
				assigns(:compo).should eq(compo)
			end
		end

		describe "POST create" do
			describe "with valid params" do
				it "creates a new Compo" do
					expect {
						post :create, {:compo => valid_attributes}
					}.to change(Compo, :count).by(1)
				end

				it "assigns a newly created compo as @compo" do
					post :create, {:compo => valid_attributes}
					assigns(:compo).should be_a(Compo)
					assigns(:compo).should be_persisted
				end

				it "redirects to the created compo" do
					post :create, {:compo => valid_attributes}
					response.should redirect_to(Compo.last)
				end
			end

			describe "with invalid params" do
				it "assigns a newly created but unsaved compo as @compo" do
					# Trigger the behavior that occurs when invalid params are submitted
					Compo.any_instance.stub(:save).and_return(false)
					post :create, {:compo => {}}
					assigns(:compo).should be_a_new(Compo)
				end

				it "re-renders the 'new' template" do
					# Trigger the behavior that occurs when invalid params are submitted
					Compo.any_instance.stub(:save).and_return(false)
					post :create, {:compo => {}}
					response.should render_template("new")
				end
			end
		end

		describe "PUT update" do
			describe "with valid params" do
				it "updates the requested compo" do
					compo = Compo.create! valid_attributes
					# Assuming there are no other compos in the database, this
					# specifies that the Compo created on the previous line
					# receives the :update_attributes message with whatever params are
					# submitted in the request.
					Compo.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
					put :update, {:id => compo.to_param, :compo => {'these' => 'params'}}
				end

				it "assigns the requested compo as @compo" do
					compo = Compo.create! valid_attributes
					put :update, {:id => compo.to_param, :compo => valid_attributes}
					assigns(:compo).should eq(compo)
				end

				it "redirects to the compo" do
					compo = Compo.create! valid_attributes
					put :update, {:id => compo.to_param, :compo => valid_attributes}
					response.should redirect_to(compo)
				end
			end

			describe "with invalid params" do
				it "assigns the compo as @compo" do
					compo = Compo.create! valid_attributes
					# Trigger the behavior that occurs when invalid params are submitted
					Compo.any_instance.stub(:save).and_return(false)
					put :update, {:id => compo.to_param, :compo => {}}
					assigns(:compo).should eq(compo)
				end

				it "re-renders the 'edit' template" do
					compo = Compo.create! valid_attributes
					# Trigger the behavior that occurs when invalid params are submitted
					Compo.any_instance.stub(:save).and_return(false)
					put :update, {:id => compo.to_param, :compo => {}}
					response.should render_template("edit")
				end
			end
		end

		describe "DELETE destroy" do
			it "destroys the requested compo" do
				compo = Compo.create! valid_attributes
				expect {
					delete :destroy, {:id => compo.to_param}
				}.to change(Compo, :count).by(-1)
			end

			it "redirects to the compos list" do
				compo = Compo.create! valid_attributes
				delete :destroy, {:id => compo.to_param}
				response.should redirect_to(compos_url)
			end
		end
	end
end

