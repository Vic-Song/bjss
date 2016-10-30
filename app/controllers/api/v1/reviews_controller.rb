module Api
	module V1
                class ReviewsController < ApplicationController
                        respond_to :json

                        def index
                                # @one = "#{params[:one]}"
                                # @two = "#{params[:two]}"
                                # @three = "#{params[:three]}"
                                # @four = "#{params[:four]}"
                                # @words = "#{params[:words]}"
                                # @userinfo = "#{params[:userinfo]}"
                                @review = Review.find_by_userinfo(params[:userinfo]) && Review.find_by_coursename(params[:coursename])
                                if !@review.blank?
                                @review.update_attributes(userinfo:params[:userinfo],coursename:params[:coursename],one:params[:one],two:params[:two],three:params[:three],four:params[:four],words:params[:words])
                                else
                                @review = Review.new(userinfo:params[:userinfo],coursename:params[:coursename],one:params[:one],two:params[:two],three:params[:three],four:params[:four],words:params[:words])
                                end
                                if @review.save
                                avg = ((@review.one+@review.two+@review.three+@review.four)/4*10).round/10.0
                                 a = [avg,'success']
                                        respond_with avg
                                else
                                        respond_with "error"
                                end
                        end

                        def show
                                @userinfo = "#{params[:userinfo]}"
                                @coursename = "#{params[:coursename]}"
                                @review = Review.find_by_userinfo(params[:userinfo]) && Review.find_by_coursename(params[:coursename])
                                #float avg
                                if !@review.blank?
                                        avg = (@review.one+@review.two+@review.three+@review.four)/4
                                        a = [@review.one,@review.two,@review.three,@review.four,avg,@review.words,@review.userinfo]
                                        respond_with a
                                else
                                        respond_with "record not found!"
                                end
                        end
                end
        end
end

