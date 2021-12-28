# == Schema Information
#
# Table name: articles
#
#  id         :bigint           not null, primary key
#  body       :text
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_articles_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
require "rails_helper"

RSpec.describe "Api::V1::Articles", type: :request do
  describe "GET /articles" do
    subject { get(api_v1_articles_path) }

    let!(:article1) { create(:article, updated_at: 1.days.ago) }
    let!(:article2) { create(:article, updated_at: 2.days.ago) }
    let!(:article3) { create(:article) }

    it "記事の一覧が取得できる" do
      subject
      res = JSON.parse(response.body)

      expect(response).to have_http_status(:ok)
      expect(res.length).to eq 3
      expect(res.map {|d| d["id"] }).to eq [article3.id, article1.id, article2.id]
      expect(res[0]["user"].keys).to eq ["id", "name", "email"]
    end
  end

  describe "GET /articles/:id" do
    subject { get(api_v1_article_path(article_id)) }

    context "指定した id の記事が存在する場合" do
      let(:article) { create(:article) }
      let(:article_id) { article.id }

      it "任意の記事の値が取得できる" do
        subject
        res = JSON.parse(response.body)

        expect(response).to have_http_status(:ok)
        expect(res["id"]).to eq article.id
        expect(res["title"]).to eq article.title
      end
    end

    context "指定した id の記事が存在しない場合" do
      let(:article_id) { 10000 }

      it "記事が見つからない" do
        expect { subject }.to raise_error ActiveRecord::RecordNotFound
      end
    end
  end
end
