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
                            elsif (params[:userid]&&params[:func])
                                @deluser = User.find(params[:userid])
                                if params[:func] == 'del'
                                    @deluser.destroy
                                    redirect_to   home_admin_path, alert:'用户删除成功！'
                                elsif params[:func] == 'reset'
                                    @deluser.update_attributes(password:'123456')
                                    redirect_to   home_admin_path, alert:'重置密码成功！'
                                elsif params[:func] == 'newpwd'
                                    @deluser.update_attributes(password:params[:password])
                                    if @deluser.save
                                        redirect_to   new_user_session_path, alert:'密码修改成功，请重新登陆！'
                                    else
                                        redirect_to   home_userpanel_path, alert:'密码修改失败！'
                                    end
                                end
                            end
                        end
                end
        end
end

