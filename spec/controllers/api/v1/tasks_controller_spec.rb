require 'rails_helper'

RSpec.describe 'Task' do
  it 'correct configuration of routes' do
    expect(get: '/api/v1/users/1/tasks')
      .to route_to(controller: 'api/v1/tasks', action: 'index', user_id: '1')

    expect(post: '/api/v1/users/1/tasks')
      .to route_to(controller: 'api/v1/tasks', action: 'create', user_id: '1')

    expect(get: '/api/v1/users/1/tasks/new')
      .to route_to(controller: 'api/v1/tasks', action: 'new', user_id: '1')

    expect(get: '/api/v1/users/1/tasks/2/edit')
      .to route_to(controller: 'api/v1/tasks', action: 'edit', user_id: '1', id: '2')

    expect(get: '/api/v1/users/1/tasks/2')
      .to route_to(controller: 'api/v1/tasks', action: 'show', user_id: '1', id: '2')

    expect(patch: '/api/v1/users/1/tasks/2')
      .to route_to(controller: 'api/v1/tasks', action: 'update', user_id: '1', id: '2')

    expect(put: '/api/v1/users/1/tasks/2')
      .to route_to(controller: 'api/v1/tasks', action: 'update', user_id: '1', id: '2')

    expect(delete: '/api/v1/users/1/tasks/2')
      .to route_to(controller: 'api/v1/tasks', action: 'destroy', user_id: '1', id: '2')
  end
end
