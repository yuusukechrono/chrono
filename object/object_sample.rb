@@janken = ["グー","チョキ","パー"]

class Player
  def hand
  # コンソールを入力待ち状態にし、プレイヤーがコンソールから打ち込んだ値を出力する処理のメソッドの処理をこの中に作成する
    puts"数字を入力してください。
         0:グー
         1:チョキ
         2:パー"
    player_hand = gets.to_i
    check = linear_search(player_hand)
    if check == 1
      puts("あなたが選んだのは#{@@janken[player_hand]}です。")
      return player_hand
    else
      puts("0～2の数字を入力してください")
      hand
    end
  end

  def linear_search(value)
    i = 0
    numbers =[0,1,2]
    # iが配列の個数を超えるまで繰り返し処理をする
    while i < 3
      # もしも、iのindexから出される配列の値が、「探したい数字」と一致していたら
      if numbers[i] == value
        # そのインデックスの値をreturnする
        return 1
      end
      i += 1
      # もしも、iのindexから出される配列の値が、「探したい数字」と一致していなかったら
      # 次の数字をチェックするためにiの数字を+1する
    end
    return 0
  end
    # iが配列の個数を超えても探したい数字がなかったら、その配列の中に探したい数字がない
    # ということなので、Noneを返す
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
