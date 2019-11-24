① empty_seat変数ー配列で表現された座席
② seats_count変数ー座席数
③ number_of_visitors変数ーグループ数
④ users変数ーグループの人数
⑤ seating_number変数ー着席開始座席番号
⑥ fill_last_number変数ー来店したグループの最後の人間が着席した席


A=8, B=10, C=13, D=11, E=15, F=4, G=6, H=12, I=9, J=7, K=3, L=2, M=5, N=14, O=17, P=1, Q=16

# 下記のコードが何をしているかを説明してください・・・（A）
# 最初の行（座席数と入店するグループの総数）の入力を受け付けます（８）
seats_and_groups = gets.split(/\s/)

# 下記のコードが何をしているかを説明してください・・・（B）
# 座席を配列で作成します（１０）
empty_seat = [*1..(seats_and_groups[0].to_i)]

# 下記のコードが何をしているかを説明してください・・・（C）
# 座席の数を変数に入れておきます（１３）
seats_count = empty_seat.count

# 下記のコードが何をしているかを説明してください・・・（D）
# 何組のグループが入店するのか、その数を変数に入れておきます（１１）
number_of_visitors = seats_and_groups[1].to_i

# 下記のコードが何をしているかを説明してください・・・（E）
# 入店するグループの数だけループさせます（１５）
[*1..number_of_visitors].each do

  # 下記のコードが何をしているかを説明してください・・・（F）
  # 二行目以降の行（グループの人数と着席開始座席番号）の入力を受け付けます（４）
  used_seats = gets.split(/\s/)

  # 下記のコードが何をしているかを説明してください・・・（G）
  # 来店したグループの人数を変数に代入します（６）
  users = used_seats[0].to_i

  # 下記のコードが何をしているかを説明してください・・・（H）
  # 来店したグループの着席開始座席番号を変数に代入します（１２）
  seating_number = used_seats[1].to_i

  # 下記のコードが何をしているかを説明してください・・・（I）
  # 来店したグループの最後の人間が着席した席の番号を変数に代入します（９）
  fill_last_number = ((seating_number + users) - 1)

  # 下記のコードが何をしているかを説明してください・・・（J）
  # 来店したグループが席につけるかどうかを確認するための配列を、if文で条件分けしながら定義します。（７）
  if fill_last_number > seats_count

    # 下記のコードが何をしているかを説明してください・・・（K）
    # もしも最後の人間が着席した席の番号が、最初に定義された座席の数を超えていたら、最初の席の数に戻して再計算します（円卓だから）（３）
    # 「今回のグループが最後に着席する席の番号」 = 「今回のグループが最後に着席する席の番号」-「そもそもの座席の総数」となる（円卓だから）。
    # 例えば、fill_last_number == 13で、seats_countが12だったら、1 = 13 - 12となり、席番号が１の席に最後の人間が座る。
    fill_last_number = fill_last_number - seats_count

    # next_seat_candidateは、「その席に既に人が座っていないか？」を判断するための配列
    # ([*1..seats_count] - empty_seat)は、（「全ての席」-　「まだ人が座っていない席」）の意味。つまり、「既に人が座っている席」の数字が、([*1..seats_count] - empty_seat)
    # [*seating_number..seats_count]は、[*「今回のグループが最初に着席する席の番号」..「最後の席の番号」]の意味
    # [*1..fill_last_number]は、[*「１（最初の席）」..「今回のグループが最後に着席する席の番号」]の意味
    # なので、next_seat_candidate = ([*1..seats_count] - empty_seat) + [*seating_number..seats_count] + [*1..fill_last_number]は、
    # next_seat_candidate = 「既に人が座っている席」+ [*「今回のグループが最初に着席する席の番号」..「最後の席の番号」] + [*「１（最初の席）」..「今回のグループが最後に着席する席の番号」]となる。
    # つまり、 next_seat_candidateの配列の中に、同じ数字が含まれていれば、「既に埋まっている席に新たなグループの人間が座ろうとしている」ということになる
    next_seat_candidate = ([*1..seats_count] - empty_seat) + [*seating_number..seats_count] + [*1..fill_last_number]
  else
    # 下記のコードが何をしているかを説明してください・・・（L）
    # 最後の人間が着席した席の番号が、最初に定義された座席の数を超えていなかったら、そのまま計算します（２）
    # next_seat_candidate = 「既に人が座っている席」+ [*「今回のグループが最初に着席する席の番号」..「今回のグループが最後に着席する席の番号」]となる
    # つまり、 next_seat_candidateの配列の中に、同じ数字が含まれていれば、「既に埋まっている席に新たなグループの人間が座ろうとしている」ということになる
    next_seat_candidate = ([*1..seats_count] - empty_seat) + [*seating_number..fill_last_number]
  end

  # 下記のコードが何をしているかを説明してください・・・（M）
  # 来店したグループの座りたい席がすでに埋まっていないかをif文で確認します（埋まっていなければif内の処理をします）（５）
  if next_seat_candidate.count == next_seat_candidate.uniq.count

    # 下記のコードが何をしているかを説明してください・・・（N）
    # 最後の人間が着席した席の番号が、最初に定義された座席の数を超えていた場合と、そうでない場合とで座席の埋め方をif文で分岐させます（１４）
    if ((seating_number + users) - 1) > seats_count

      # 下記の二行のコードが何をしているかを説明してください・・・（O）
      # 埋まっていない、かつ、末尾の番号が最初に定義された座席の数を超えていれば、最初の席の番号〜末尾の番号と、着席開始座席番号〜最後の席の番号、の二回に分けて席を埋めていきます（１７）
      empty_seat = empty_seat - [*1..fill_last_number]
      empty_seat = empty_seat - [*seating_number..seats_count]
    else
      # 下記のコードが何をしているかを説明してください・・・（P）
      # 埋まっていない、かつ、末尾の番号が席の数を超えていなければ、そのまま来店した人数分のシートを埋めていきます（１）
      empty_seat = empty_seat - [*seating_number..fill_last_number]
    end
  end
end

# 下記のコードが何をしているかを説明してください・・・（Q）
# 最終的に席に座っている人数を出力します（１６）
puts seats_count - empty_seat.count
