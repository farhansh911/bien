class ReviewsController < ApplicationController

    def index
        # this is our list page for our reviews
       @reviews = Review.all

    end
    def new
        # form for adding a new review
        @review = Review.new

    end

    def create
        # take info from the form and add it into model
        @review = Review.new(form_params)

        # we want to check if the model can be saved
        # if it is we going to home page again
        # if it is not show the new form
        if @review.save
            redirect_to root_path
            
        else
            render :new, status: :unprocessable_entity
        end
    
    end

    def show
        # individual review page

        @review = Review.find(params[:id])

    end

    def destroy
        # find the individual review
        @review = Review.find(params[:id])
        # destroy
        @review.destroy
        # redirect to home page
        redirect_to root_path
    end

    def edit
        # find the individual revie to edit 
        @review = Review.find(params[:id])
    end

    def update
        # find the individual review to edit 
        @review = Review.find(params[:id])
        # update
        if @review.update(form_params)
        # redirect to home page
            redirect_to review_path(@review)
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def form_params
        params.require(:review).permit(:title, :body, :score)
    end
end
