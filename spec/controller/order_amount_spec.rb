require 'rails_helper'

RSpec.describe OrderAmount do
  describe "總額計算功能" do
    it "原本總額為 1000 ，折扣 9 折之後，總額變 900 元"
    it "原本總額為 1000 ，折扣 300 元之後，總額變 700 元"
    it "原本總額為 100 ，折扣 300 元之後，總額變 0 元（折價卷的折扣金額大於商品金額，結帳時總金額不會變負的）"
  end

end