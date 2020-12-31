
class CardsController < ApplicationController
  def new
  end

  def create
      redirect_to tables_path
  end
  def show
    id = params[:id]
      @card = Card.find(id)
  end
  def index
    @cards=Card.all
    @cards.each_with_index do |card, indexs|
      if card[:location] == "deck" and card[:status] == 1
        Card.find(card[:id]).update(location: 'GameDeck')
      end
    end
  end
  def take_from_board
    a = self.params[:commit]
    change = Card.where(cardFront: a)
    change.each do |card|
      if card.status == 4
        Card.find(card.id).update(status: 3, location: @current_user.name)
        flash[:warning]="Card taken by #{@current_user.name}"
      else
        flash[:warning]="No Card Found"
      end
    end
    redirect_to cards_path
  end
  def play_card
    a = self.params[:commit]
    change = Card.where(cardFront: a, location: @current_user.name)
    change.each do |card|
      if card.status == 3 and card.location == @current_user.name
        Card.find(card.id).update(status: 4)
        flash[:notice]="Card played"
      elsif card.status == 2 and card.location == @current_user.name
        Card.find(card.id).update(status: 3)
        flash[:notice]="Card played"
      else
        flash[:warning]="Card not played"
      end
    end
    redirect_to cards_path
  end
  def reset_card
    @cards=Card.all.where.not(status:0)
    @cards.find_each do |card|
      unless card.status == 0
        if card.name == 'RJ' or card.name == 'BJ'
          Card.find(card.id).update(location: "deck", status: 0)
        else
          Card.find(card.id).update(location: "deck", status: 1)
        end
      end
    end
    flash[:warning] = "reset deck"
    redirect_to cards_path
  end
  def recover_discard
    @cards=Card.where(status:5)
    @cards.find_each do |card|
      Card.find(card.id).update(status:1)
    end
    flash[:warning]="Discarded Cards Recovered"
    redirect_to cards_path
  end
  def recard_card
    count = 0
    movement = params[:move][:movement]
    case movement
    when 'Board to Action'
      Card.where(location: @current_user.name, status: 4).find_each do |card|
        Card.find(card.id).update(status: 3)
        count +=1
      end
    when 'Action to Hand'
      Card.where(location: @current_user.name,status: 3).find_each do |card|
        Card.find(card.id).update(status: 2)
        count +=1
      end
    when 'Hand to Assigned Deck'
      Card.where(location: @current_user.name,status: 2).find_each do |card|
        Card.find(card.id).update(status: 1)
        count +=1
      end
    end
    if count !=0
      flash[:warning]="recard"
      redirect_to cards_path
    else
      flash[:warning]="No recard happened"
      redirect_to cards_path
    end
  end
  def discard_card
    discard_params= params[:move][:movement]
    case discard_params
    when "Me"
      if params[:commit] != 'a'
      Card.where(status: 3).find_each do |card|
        Card.find(card.id).update(location: @current_user.name, status: 5)
      end
      flash[:warning]="Discarded Action to Me"
      redirect_to cards_path
      else
      Card.where(status: 4).find_each do |card|
        Card.find(card.id).update(location: @current_user.name, status: 5)
      end
      flash[:warning]="Discarded to Me"
      redirect_to cards_path
      end
      when "Unassigned"
      if params[:commit] != 'a'
        Card.where(status: 3).find_each do |card|
        Card.find(card.id).update(location: 'GameDeck', status: 5)
        end
        flash[:warning]="Discarded Action to Unassigned"
        redirect_to cards_path
        else
      Card.where(status: 4).find_each do |card|
        Card.find(card.id).update(location: 'GameDeck', status: 5)
      end
      flash[:warning]="Discarded to Unassigned"
      redirect_to cards_path
    end
    end
    end
  def pass_card
    @cards=Card.all
    @to = params[:to]
    count =0
    @from = @current_user.name
    @cards.find_each do |card|
      if card.status == 3 and card.location == @from#if card is in action
        count +=1
        Card.find(card.id).update(location: @to, status: 2)
      end
    end
    if count != 0
      flash[:warning]="Card(s) passed"
      redirect_to cards_path
    else
      flash[:warning]="Card(s) not passed"
      redirect_to cards_path
  end
    end
  def draw_card
    if params[:commit] == "Draw"
      get_shuffled_deck
      count =0
      @cards.each do |card|
      if card[:status] == 1
        if card.location == @current_user.name
          Card.find(card.id).update(status: 2)
          flash[:notice] = "Card added to #{@current_user.name}"
          count +=1
          break
        elsif card[:location] == 'GameDeck'
          Card.find(card[:id]).update(status: 2, location: @current_user.name)
          flash[:notice] = "Card added to #{@current_user.name}"
          count +=1
          break
        end
      end
      end
      if count == 0
        flash[:warning] = "decks empty"
      end
    else
      card = Card.where(status:1, location: 'GameDeck').shuffle
      if !card.first.nil?
        card.first.update(status:4, location: 'Dealer')
      else
        flash[:warning] = "decks empty"
      end
    end
    redirect_to cards_path
  end
  def select_card
    @cards = Card.all
    card_val = params[:card_select]
    @cards.where(name: card_val).find_each do |card|
      Card.find(card.id).update!(location: @current_user.name, status: 2)
    end
    flash[:notice]="Selected card placed in user hand"
    redirect_to cards_path
  end

  def get_shuffled_deck
    @cards=Card.all.shuffle
  end
end
