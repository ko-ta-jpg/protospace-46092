class UsersController < ApplicationController
  def show
    # URLの /users/:id から送られてきたidでユーザーを特定
    @user = User.find(params[:id])

    # そのユーザーが投稿したプロトタイプ一覧を取得
    @prototypes = @user.prototypes
  end
end