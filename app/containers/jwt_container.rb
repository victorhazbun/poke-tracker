class JwtContainer
  extend Dry::Container::Mixin

  namespace 'jwt_encode' do
    register 'validate' do
      JwtEncode::ValidateOperation.new
    end

    register 'execute' do
      JwtEncode::ExecuteOperation.new
    end
  end

  namespace 'jwt_decode' do
    register 'validate' do
      JwtDecode::ValidateOperation.new
    end

    register 'execute' do
      JwtDecode::ExecuteOperation.new
    end
  end
end
