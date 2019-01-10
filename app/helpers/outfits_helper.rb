module OutfitsHelper
  def piece_check_box form:, piece:
    form.check_box :piece_ids,
                   {
                     id: "outfit_piece_ids_#{piece.id}",
                     name: 'outfit[piece_ids][]',
                     class: 'form-check-input'
                   },
                   piece.id,
                   nil
  end
end
