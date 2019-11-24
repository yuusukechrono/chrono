$(document).ready(function(){
    // このような記述をすることで、subject_pointsという変数の中に
    let click = 0;

    function score_indicate(){
    // [国語の点数,英語の点数,数学の点数,理科の点数,社会の点数]という配列を作成できる。
    let subject_points = [Number($('#national_language').val()),
                          Number($('#english').val()),
                          Number($('#mathematics').val()),
                          Number($('#science').val()),
                          Number($('#society').val())
                          ];
    // さらにこのような記述をすることで、「合計点：」となっている右の部分に合計点が出力される
    let number = subject_points.length;
    let sum = 0;
    sum = subject_points.reduce(function(x,y){return x+y;});
    let average = sum / number;
    $("#sum_indicate").text(sum);　//Htmlの#sum_indicateに文字列に変換したsumを記載する。
    $("#average_indicate").text(average);
    let status = [number, sum, average];
    let result = [subject_points,status];
    return result;
  };

  function get_achievement(result){
    // ここに、ランクの値の文字列（平均点が80点以上なら"A"、60点以上なら"B"、40点以上なら"C"、それ以下なら"D"）を出力する処理を書き込む
    if(result[1][2] >=80){
      $("#evaluation").text("A");
      return "A";
    }else if(result[1][2] >=60){
      $("#evaluation").text("B");
      return "B";
    }else if(result[1][2] >=40){
      $("#evaluation").text("C");
      return "C";
    }else{
      $("#evaluation").text("D");
      return "D";
    }

  }

  function get_pass_or_failure(result){
    // ここに、全ての教科が60点以上なら"合格"の文字列、一つでも60点未満の教科があったら"不合格"の文字列を出す処理を書き込む
    let number = result[1][0];
    let judge = "合格";
      for(let i=0; i<number;i++){
         if(result[0][i]<60){
          judge = "不合格";
          break;
         }
      }
      $("#judge").text(judge);
      return judge;
  }

//lists[0].textContent

  function judgement(){
    // ここに、「最終ジャッジ」のボタンを押したら「あなたの成績はAです。合格です」といった内容を出力する処理を書き込む
    // 下記の記述をすることで、「最終ジャッジ」のボタンを押すと「あなたの成績は（ここに「ランク」の値を入れる）です。（ここに「判定」の値を入れる）です」という文字の入った水色のフキダシが出力される処理が実装される。
    let achievement = get_achievement(score_indicate());
    let pass_or_failure =  get_pass_or_failure(score_indicate());
    click += 1;
    if(click>1){
    $('#declaration').empty();
    }
    $('#declaration').append(`<label id="alert-indicate" class="alert alert-info">あなたの成績は${achievement}です。${pass_or_failure}です</label>`);
  };
//.appendで指定の文字列を追加する。
  $('#national_language, #english, #mathematics, #science, #society').change(function() {　//.changeが要素の変化を検知してイベントを自動的に実行してくれる。
    score_indicate();
  });

  $('#btn-evaluation').click(function() {
    get_achievement(score_indicate());
  });
  //ボタンをクリックした際に、ランクを判定するget_achievementを呼び出す。

  $('#btn-judge').click(function() {
    get_pass_or_failure(score_indicate());
  });

  $('#btn-declaration').click(function() {
    judgement();
  });
});
