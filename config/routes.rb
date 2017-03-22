Rails.application.routes.draw do
  root to: 'quiz#welcome'
  get 'quiz/index'
  get 'quiz/start'
  get 'quiz/join'
  get 'quiz/end'
  get 'quiz/refresh_users'

  get 'question/index'
  get 'question/show'
  post 'question/answer'
  get 'question/end'
  get 'question/result'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
