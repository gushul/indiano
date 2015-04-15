host "indiano-moscow.ru"

sitemap :site do
    url root_url, last_mod: Time.now, change_freq: "daily", priority: 1.0
    url page_url(:about), last_mod: Time.now, change_freq: "daily", priority: 0.5
    url page_url(:buy), last_mod: Time.now, change_freq: "daily", priority: 0.5
    url page_url(:contact), last_mod: Time.now, change_freq: "daily", priority: 0.5
end

sitemap_for Product, name: :products do |product|
  url product, last_mod: product.updated_at, priority: 1.0
end

ping_with "http://#{host}/sitemap.xml"
