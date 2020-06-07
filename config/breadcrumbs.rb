crumb :root do
  link "FURIMA", root_path
end

crumb :category do
  link "カテゴリー一覧", categories_path
  parent :root
end

crumb :parent do
  @parent = Category.find(params[:id])
  link "#{@parent.name}", category_path(@parent.id)
  parent :category
end

crumb :child do
  @child = Category.find(params[:id])
  @parent = @child.parent
  link "#{@parent.name}", category_path(@parent.id)
  link "#{@child.name}", subcategory_category_path(@child.id)
  parent :category
end

crumb :grandchild do
  @grandchild = Category.find(params[:id])
  @child = @grandchild.parent
  @parent = @child.parent
  link "#{@parent.name}", category_path(@parent.id)
  link "#{@child.name}", subcategory_category_path(@child.id)
  link "#{@grandchild.name}", item_category_path(@grandchild.id)
  parent :category
end

crumb :mypage do
  link "#{current_user.nickname}さんのマイページ", user_path(current_user.id)
  parent :root
end

crumb :favorite do
  link "お気に入り一覧"
  parent :mypage
end

crumb :search do
  link "商品検索"
  parent :root
end

crumb :product_show do
  @product = Product.find(params[:id])
  @grandchild = Category.find_by(id: @product.category_id)
  @child = @grandchild.parent
  @parent = @child.parent
  link "#{@parent.name}", category_path(@parent.id)
  link "#{@child.name}", subcategory_category_path(@child.id)
  link "#{@grandchild.name}", item_category_path(@grandchild.id)
  link "#{@product.product_name}", product_path(@product.id)
  parent :root
end

crumb :confirm_purchase do
  @product = Product.find(params[:id])
  @grandchild = Category.find_by(id: @product.category_id)
  @child = @grandchild.parent
  @parent = @child.parent
  link "#{@parent.name}", category_path(@parent.id)
  link "#{@child.name}", subcategory_category_path(@child.id)
  link "#{@grandchild.name}", item_category_path(@grandchild.id)
  link "#{@product.product_name}", product_path(@product.id)
  link "購入内容の確認"
  parent :root
end

crumb :login do
  link "ログイン", new_user_session_path
  parent :root
end

crumb :signup do
  link "新規登録", new_user_registration_path
  parent :root
end

crumb :identify do
  link "住所登録"
  parent :signup
end

crumb :exhibition do
  link "商品出品"
  parent :root
end

crumb :edit_product do
  link "商品編集"
  parent :root
end