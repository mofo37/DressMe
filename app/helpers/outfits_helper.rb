module OutfitsHelper
  def piece_check_box form:, piece:
    form.check_box :piece_ids,
                   {
                     id: "outfit_piece_ids_#{piece.id}",
                     name: 'outfit[piece_ids][]',
                     class: 'form-check-input sr-only'
                   },
                   piece.id,
                   nil
  end

  def image_tag_for item, options = {}
    url = item.images.first.presence || 'https://via.placeholder.com/150'
    image_tag url, options 
  end
end

