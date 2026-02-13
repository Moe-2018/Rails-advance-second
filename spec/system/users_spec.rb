require 'rails_helper'
 
describe 'User', type: :system do
  before { driven_by :rack_test }

    let(:email) { 'test@example.com' }
  let(:fullname) { 'テスト太郎' }
  let(:password) { 'password' }
  let(:password_confirmation) { password }
 
  describe 'ログイン機能の検証' do
    # 事前にユーザー作成
    before do
      create(:user, fullname: fullname, email: email, password: password, password_confirmation: password) 
 
      visit '/users/sign_in'
      fill_in 'user_email', with: email
      fill_in 'user_password', with: 'password'
      click_button 'ログイン'
    end
 
    context '正常系' do
      it 'ログインに成功し、トップページにリダイレクトする' do
        expect(current_path).to eq('/')
      end

       it 'ログイン成功時のフラッシュメッセージを表示する' do 
        expect(page).to have_content('Signed in successfully')
      end
    end
 
    context '異常系' do
      let(:password) { 'NGpassword' }
      it 'ログインに失敗し、ページ遷移しない' do
        expect(current_path).to eq('/users/sign_in')
      end

      it 'ログイン失敗時のフラッシュメッセージを表示する' do  
        expect(page).to have_content('Invalid email or password')
      end
    end
  end
end