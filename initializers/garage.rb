Garage.configure {}

Garage::TokenScope.configure do
  register :public, desc: 'accessing publicly available data' do
    access :read,   User
    access :write,  User
  end
end

Doorkeeper.configure do
  orm :active_record

  # デフォルトのスコープ
  default_scopes :public

  optional_scopes(*Garage::TokenScope.optional_scopes)

  # アプリケーションのオーナーの認証
  resource_owner_from_credentials do |routes|
    User.find_by(email: params[:username])
  end
end
