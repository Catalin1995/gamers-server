require 'spec_helper'

describe 'API' do
  def check_route(a, b)
    a.should route_to(b)
  end

  it 'routes' do
    check_route({ get: '/games/1'}, { controller: 'games', action: 'show', id: '1' })
    check_route({ get: '/games'}, { controller: 'games', action: 'index'})

    check_route({ get: '/chat/1'}, { controller: 'chat', action: 'show', id: '1'})
  end

end
