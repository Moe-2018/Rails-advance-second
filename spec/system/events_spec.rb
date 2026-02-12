require 'rails_helper'

RSpec.describe "Events", type: :system do
  before do
    driven_by(:rack_test)
  end
 describe 'トップページの検証' do
    it 'イベント一覧という文字列が表示される' do
      visit '/'
 
      expect(page).to have_content('イベント一覧')
    end
  end

  describe 'ナビゲーションバーの検証' do
    context 'ログインしていない場合' do
      before { visit '/' }
 
    
 
      it 'ログインリンクを表示する' do
        expect(page).to have_link('ログイン', href: '/users/sign_in')
      end
 
      it 'ログアウトリンクは表示しない' do
        expect(page).not_to have_content('ログアウト')
      end
    end
 
    context 'ログインしている場合' do
      before do
        user = create(:user) # ログイン用のユーザーを作成
        sign_in user # 作成したユーザーでログイン
        visit '/'
      end
 
    
 
      it 'ログインリンクは表示しない' do
        expect(page).not_to have_link('ログイン', href: '/users/sign_in')
      end
 
      it 'ログアウトリンクを表示する' do
        expect(page).to have_content('ログアウト')
      end
 
      it 'ログアウトリンクが機能する' do
        click_button 'ログアウト'
 
      
        expect(page).to have_link('ログイン', href: '/users/sign_in')
        expect(page).not_to have_content('ログアウト')
      end
    end
  end
end
