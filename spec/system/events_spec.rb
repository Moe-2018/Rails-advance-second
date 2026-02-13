require 'rails_helper'

RSpec.describe "Events", type: :system do
  before do
    driven_by(:rack_test)
    @user = create(:user) 
    @event = create(:event, title: 'テスト', description: 'テスト中', start_date: '2026-02-01T12:45:41Z', organiser_name: 'テスト太郎さん', target_department: 'テスト部', user: @user)
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

      it 'イベント登録リンクを表示しない' do # 追加
        expect(page).not_to have_link('イベント登録', href: '/events/new')
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

      it 'イベント登録リンクを表示する' do 
        expect(page).to have_link('イベント登録', href: '/events/new')
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



 
  # 投稿フォーム
  let(:title) { 'テストタイトル' }
  let(:description) { 'テスト本文' }
  let(:start_date){'2026-02-01T12:45:41Z'}
  let(:organiser_name){'テスト主催'}
  let(:target_department){'テスト部'}
 
  describe 'イベント登録機能の検証' do
    # ログ投稿を行う一連の操作を subject にまとめる
    subject do
      fill_in 'event_title', with: title
      fill_in 'event_description', with: description
     fill_in 'event_start_date', with: start_date
     fill_in 'event_organiser_name', with: organiser_name
     fill_in 'event_target_department', with: target_department

      click_button '登録する'
    end
 
    context 'ログインしていない場合' do
      before { visit '/events/new' }
      it 'ログインページへリダイレクトする' do
        expect(current_path).to eq('/users/sign_in')
        expect(page).to have_content('You need to sign in or sign up before continuing')
      end
    end

    context 'ログインしている場合' do
      before do
        sign_in @user
        visit '/events/new'
      end
      it 'ログインページへリダイレクトしない' do
        expect(current_path).not_to eq('/users/sign_in')
      end
 
      context 'パラメータが正常な場合' do
        it 'Eventを作成できる' do
          expect { subject }.to change(Event, :count).by(1)
          expect(current_path).to eq('/')
          expect(page).to have_content('イベントを登録しました。')
        end
      end
 
      context 'パラメータが異常な場合' do
        let(:title) { nil }
        it 'Eventを作成できない' do
          expect { subject }.not_to change(Event, :count)
          expect(page).to have_content('登録に失敗しました')
        end
 
        it '入力していた内容は維持される' do
          subject
          expect(page).to have_field('event_description', with: description)
        end
      end
    end
  end
  describe 'イベント詳細機能の検証' do
    before { visit "/events/#{@event.id}" }
 
    it 'Eventの詳細が表示される' do
      expect(page).to have_content('テスト')
      expect(page).to have_content('テスト中')
      expect(page).to have_content('2026-02-01 12:45:41 UTC')
      expect(page).to have_content('テスト太郎さん')
      expect(page).to have_content('テスト部')
      expect(page).to have_content(@user.fullname)
    end
  end

  describe 'ログ一覧機能の検証' do
  before do
    @post2 = create(:event, title: 'テスト2', description: 'テスト中2', start_date: '2026-02-01T12:45:41Z', organiser_name: 'テスト太郎さん', target_department: 'テスト部', user: @user)
    visit '/events'
  end
 
  it '1件目のEventの詳細が表示される' do
   expect(page).to have_content('テスト')
   expect(page).to have_content('テスト部')
   expect(page).to have_content(@user.fullname)
  end
 
  it '2件目のPostの詳細が表示される' do
   expect(page).to have_content('テスト2')
   expect(page).to have_content('テスト部')
   expect(page).to have_content(@user.fullname)
  end
 
  it '投稿タイトルをクリックすると詳細ページへ遷移する' do
    click_link 'テスト'
    expect(current_path).to eq("/events/#{@event.id}")
  end
end
end

