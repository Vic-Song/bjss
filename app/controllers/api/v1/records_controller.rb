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

                        def show
                                #@userinfo = "#{params[:userinfo]}"
                                #@review = Review.find_by_userinfo(@userinfo)
                                #float avg
                                #avg = (@review.one+@review.two+@review.three+@$
                                #a = [@review.one,@review.two,@review.three,@re$
                                #respond_with a
                        end
                end
        end
end

