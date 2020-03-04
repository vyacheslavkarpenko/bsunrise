require 'rails_helper'

describe Api::V1::ChatsController do
  it 'correct configuration of routes' do
    expect(get: '/api/v1/users/1/tasks/2/chats')
      .to route_to(controller: 'api/v1/chats', action: 'index', user_id: '1', task_id: '2')

    expect(post: '/api/v1/users/1/tasks/2/chats')
      .to route_to(controller: 'api/v1/chats', action: 'create', user_id: '1', task_id: '2')

    expect(get: '/api/v1/users/1/tasks/2/chats/new')
      .to route_to(controller: 'api/v1/chats', action: 'new', user_id: '1', task_id: '2')

    expect(get: '/api/v1/users/1/tasks/2/chats/3/edit')
      .to route_to(controller: 'api/v1/chats', action: 'edit', user_id: '1', task_id: '2', id: '3')

    expect(get: '/api/v1/users/1/tasks/2/chats/3')
      .to route_to(controller: 'api/v1/chats', action: 'show', user_id: '1', task_id: '2', id: '3')

    expect(patch: '/api/v1/users/1/tasks/2/chats/3')
      .to route_to(controller: 'api/v1/chats', action: 'update', user_id: '1', task_id: '2', id: '3')

    expect(put: '/api/v1/users/1/tasks/2/chats/3')
      .to route_to(controller: 'api/v1/chats', action: 'update', user_id: '1', task_id: '2', id: '3')

    expect(delete: '/api/v1/users/1/tasks/2/chats/3')
      .to route_to(controller: 'api/v1/chats', action: 'destroy', user_id: '1', task_id: '2', id: '3')
  end

  describe '#index' do
    it 'returns correct data' do

      get :index, params: { user_id: '1', task_id: '2' }
      
      expect(response).to be_ok
      
      binding.pry
      
    end
  end
end
