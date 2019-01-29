class JwtContainer
  extend Dry::Container::Mixin

  namespace 'jwt_encode' do
    register 'validate' do
      JwtEncode::ValidateService.new
    end

    register 'execute' do
      JwtEncode::ExecuteService.new
    end
  end

  namespace 'jwt_decode' do
    register 'validate' do
      JwtDecode::ValidateService.new
    end

    register 'execute' do
      JwtDecode::ExecuteService.new
    end
  end
end
