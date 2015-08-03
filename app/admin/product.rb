ActiveAdmin.register Product do

  permit_params :title, :size, :long, :material,
                :price, :old_price, :sale,
                :description, :category_id,
                picture_ids: [],
                pictures_attributes: [:id, :product_id, :image]

  sortable tree: false, # default
           sorting_attribute: :position

  index default: true do
    column :title
    column :size
    column :category
    column :sale
    column :price
    column :old_price
    actions
  end
  index :as => :sortable do
    label :title # item content
    actions
  end
  form(:html => { :multipart => true }) do |f|
    f.semantic_errors *f.object.errors.keys

    f.inputs "Product" do
      f.collection_select(:category_id, Category.all, :id, :title, :include_blank => "Выберите категорию")
      br
      f.input :title, label: "Название"
      br
      f.input :size, label: "Размер"
      br
      f.input :long, label: "Длинна"
      br
      f.input :material, label: "Материал"
      br
      f.input :price, label: "Цена(  только цифры )"
      br
      f.input :old_price, label: "Старая цена(  только цифры )"
      br
      f.input :sale, label: "Товар учавствует в распродаже?"
      br
      p 'Описание'
      f.text_area :description, label: "Описание"
      br
    end

    f.inputs "Pictures" do
      render "active_admin_multi_upload/upload_form", resource: product, association: "pictures", attribute: "image" , options: {}
    end
    f.actions
  end

  index as: :grid do |product|
    link_to image_tag(product.pictures.first.try(:image_url)), admin_product_path(product)
  end
end
