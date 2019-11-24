@@janken = ["グー","チョキ","パー"]

class Player
  def hand
  # コンソールを入力待ち状態にし、プレイヤーがコンソールから打ち込んだ値を出力する処理のメソッドの処理をこの中に作成する
    puts"数字を入力してください。
         0:グー
         1:チョキ
         2:パー"
    player_hand = gets.chomp

    if player_hand == "0" || player_hand == "1" || player_hand == "2"
      puts("あなたが選んだのは#{@@janken[player_hand.to_i]}です。")
      return player_hand.to_i
    else
      puts("0～2の数字を入力してください。")
      hand
    end
  end
end

class Enemy
  def hand
    # グー、チョキ、パーの値をランダムに出力するメソッドの処理をこの中に作成する
    option = [0,1,2] #https://ref.xaio.jp/ruby/classes/array/sample
    enemy_hand = option.sample
    return enemy_hand
  end
end

class Janken
  def pon(player_hand, enemy_hand)
    result = (player_hand.to_i - enemy_hand.to_i + 3) % 3
    if result == 2
      puts "相手の手は#{@@janken[enemy_hand]}です。あなたの勝ちです。"
    elsif result == 1
      puts "相手の手は#{@@janken[enemy_hand]}です。あなたの負けです。"
    else
      puts "相手の手は#{@@janken[enemy_hand]}です。あいこです。"
      player_aiko = Player.new
      enemy_aiko = Enemy.new
      janken_aiko = Janken.new
      janken_aiko.pon(player_aiko.hand,enemy_aiko.hand)
# プレイヤーが打ち込んだ値と、Enemyがランダムに出した値でじゃんけんをさせ、その結果をコンソール上に出力するメソッドをこの中に作成する
# その際、あいこもしくはグー、チョキ、パー以外の値入力時には、もう一度ジャンケンをする
# 相手がグー、チョキ、パーのうち、何を出したのかも表示させる
    end
  end
end

player = Player.new
enemy = Enemy.new
janken = Janken.new
janken.pon(player.hand,enemy.hand)
#newメソッドを使用することで、それぞれPlayerとEnemy、Jankenクラスのオブジェクトを作成。利用しやすいように変数に代入。
