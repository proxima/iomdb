module EquipmentPieceListsHelper
  def parchment_parse(parchment_text)
    @eq_pieces = []
    @not_found = []

    parchment_text.each_line do |line|
      temp = line.chomp
      piece = EquipmentPiece.find_by_name(temp)
      if piece
        @eq_pieces << piece
      else
        @not_found << temp
      end
    end

    return @eq_pieces, @not_found
  end
end
