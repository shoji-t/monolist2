class RankingController < ApplicationController
  def have
    @title = "ranking_have"
    @ranking = Have.group(:item_id).order('count_item_id desc').limit(10).count('item_id')
    item_ids = @ranking.keys
    @items = Item.find(item_ids).sort_by{ |o| item_ids.index(o.id) }
    render 'ranking'
  end

  def want
    @title = "ranking_want"
    @ranking = Want.group(:item_id).order('count_item_id desc').limit(10).count('item_id')
    item_ids = @ranking.keys
    @items = Item.find(item_ids).sort_by{ |o| item_ids.index(o.id) }
    render 'ranking'
  end
end
