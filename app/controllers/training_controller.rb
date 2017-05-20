class TrainingController < ApplicationController

  def check
    result = CheckCard.call(user_input: params[:original_text],
                            card_id: params[:id])
    if result
      answer = params[:original_text]
      redirect_to root_path, notice: "#{answer} Success!"
    else
      redirect_to root_path, notice: 'Ouch..Try again..'
    end
  end
end
