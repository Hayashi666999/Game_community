class Public::HomesController < ApplicationController
  
  def top
    @post = Post.all
  end
  
end
