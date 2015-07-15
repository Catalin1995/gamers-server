require 'spec_helper'

describe 'API' do
  def check_route(a, b)
    expect(a).to route_to(b)
  end

  xit 'routes' do
    check_route({ get: '/games/1'}, { controller: 'games', action: 'show', id: '1' })
    check_route({ get: '/games'}, { controller: 'games', action: 'index'})

    check_route({ get: '/chat/1'}, { controller: 'chat', action: 'show', id: '1'})
  end

end
