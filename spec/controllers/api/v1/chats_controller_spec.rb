require 'rails_helper'

describe Api::V1::ChatsController do
  let(:user) { create(:user) }
  let(:task) { create(:task, user_id: user.id) }
  let(:chat) { create(:chat, user_id: user.id, task_id: task.id) }
  
  it 'correct configuration of routes' do
    expect(get: '/api/v1/users/1/tasks/1/chats')
    .to route_to(controller: 'api/v1/chats', action: 'index', user_id: '1', task_id: '1')
    
    expect(post: '/api/v1/users/1/tasks/1/chats')
    .to route_to(controller: 'api/v1/chats', action: 'create', user_id: '1', task_id: '1')
    
    expect(get: '/api/v1/users/1/tasks/1/chats/new')
    .to route_to(controller: 'api/v1/chats', action: 'new', user_id: '1', task_id: '1')
    
    expect(get: '/api/v1/users/1/tasks/1/chats/1/edit')
    .to route_to(controller: 'api/v1/chats', action: 'edit', user_id: '1', task_id: '1', id: '1')
    
    expect(get: '/api/v1/users/1/tasks/1/chats/1')
    .to route_to(controller: 'api/v1/chats', action: 'show', user_id: '1', task_id: '1', id: '1')
    
    expect(patch: '/api/v1/users/1/tasks/1/chats/1')
    .to route_to(controller: 'api/v1/chats', action: 'update', user_id: '1', task_id: '1', id: '1')
    
    expect(put: '/api/v1/users/1/tasks/1/chats/1')
    .to route_to(controller: 'api/v1/chats', action: 'update', user_id: '1', task_id: '1', id: '1')
    
    expect(delete: '/api/v1/users/1/tasks/1/chats/1')
    .to route_to(controller: 'api/v1/chats', action: 'destroy', user_id: '1', task_id: '1', id: '1')
  end

  describe '#index' do
    it 'returns correct data' do

    get :index, params: { user_id: user.id, task_id: task.id }

      expect(response).to be_ok
    end
  end
end
