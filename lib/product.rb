class Product
  attr_accessor :id, :body_html, :variants, :images, :created_at, :handle, :body_html, :images, :options,:product_type,:published_at,:published_scope,:published, :tags,:template_suffix,:title,:updated_at,:barcode,:compare_at_price,:created_at,:fulfillment_service,:grams,:weight,:weight_unit,:inventory_management,:inventory_policy,:inventory_quantity,:metafield,:vendor

  def find_by_sku(sku)
    variants.find do |v|
      v.sku =~ /sku/ 
    end
  end

  def images
      ##
  end

end
