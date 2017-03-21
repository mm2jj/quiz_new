Rails.application.routes.draw do
  get 'question/index'
  get 'question/show'

  root to: 'quiz#welcome'
  get 'quiz/index'
  get 'quiz/start'
  get 'quiz/join'
  get 'quiz/end'
  get 'quiz/refresh_users'
  get 'quiz/question'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
