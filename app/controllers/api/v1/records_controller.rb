module Api
	module V1
                class RecordsController < ApplicationController
                          respond_to :json

                        def index
                                # @one = "#{params[:one]}"
                                # @two = "#{params[:two]}"
                                # @three = "#{params[:three]}"
                                # @four = "#{params[:four]}"
                                # @words = "#{params[:words]}"
                                # @userinfo = "#{params[:userinfo]}"

                                @record = Record.new(userinfo:params[:userinfo],coursename:params[:coursename],trace:params[:trace])
                                if @record.save
                                        respond_with "success"
                                else
                                    	respond_with "error"
                                end
                        end

                        # def desuser
                        #         @deluser = User.find(params[:userid])
                        #          @deluser.destroy
                        #          redirect_to   home_admin_path, alert:'User deleted successfully!'
                        #         respond_with @deluser.email
                        # end

                        def show
                                #@userinfo = "#{params[:userinfo]}"
                                #@review = Review.find_by_userinfo(@userinfo)
                                #float avg
                                #avg = (@review.one+@review.two+@review.three+@$
                                #a = [@review.one,@review.two,@review.three,@re$
                                #respond_with a
                            if(params[:email]&&params[:password])
                                @user = User.new(username:params[:username],email:params[:email],password:params[:password])
                                # respond_to do |format|
                                if @user.save
                                    redirect_to home_admin_path, alert:'用户创建成功！'
                                    # format.json{"success"}
                                else
                                    # format.html{}
                                    # format.json {"error"}
                                    redirect_to home_admin_path, alert:'用户创建失败！'
                                end
                            elsif (params[:userid])
                                @deluser = User.find(params[:userid])
                                @deluser.destroy
                                redirect_to   home_admin_path, alert:'用户删除成功！'
                            end
                        end
                end
        end
end

