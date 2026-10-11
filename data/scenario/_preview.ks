[_tb_system_call storage=system/_preview.ks ]

[mask time=10]
[mask_off time=10]
[cm  ]
[playbgm  volume="100"  time="1000"  loop="true"  storage="怪しいラグタイム_2.mp3"  ]
[bg  storage="背景.png"  time="0"  ]
[tb_image_show  time="0"  storage="default/テーブル.png"  width="971"  height="647"  x=""  y=""  _clickable_img=""  name="img_3"  ]
[tb_image_show  time="0"  storage="default/トランプ背面.png"  width="647"  height="432"  x="210"  y="278"  _clickable_img=""  name="img_4"  ]
[chara_show  name="超学生"  time="1500"  wait="true"  storage="chara/1/顔1.png"  width="966"  height="645"  left="-15"  top=""  reflect="false"  ]
[tb_show_message_window  ]
[font  size="23"  color="0xffffff"  ]
[tb_start_text mode=1 ]
#超学生
あ、こんにちは。[p]

[_tb_end_text]

[chara_mod  name="超学生"  time="0"  cross="false"  storage="chara/1/顔2.png"  ]
[tb_start_text mode=1 ]
#超学生
せっかくなので、僕と一緒にゲームをしませんか？[p]


[_tb_end_text]

[chara_mod  name="超学生"  time="0"  cross="false"  storage="chara/1/顔1.png"  ]
[tb_start_text mode=1 ]
#超学生
僕が今からカードを一枚[r]引いて、あなたに数字を[r]お見せします。[p]


[_tb_end_text]

[tb_hide_message_window  ]
[tb_eval  exp="f.retry_round=0"  name="retry_round"  cmd="="  op="t"  val="0"  val_2="undefined"  ]
*round_start

[tb_start_tyrano_code]
[clearstack stack="if"]
[cm]
[tb_hide_message_window]

[free name="dealer_card" layer="2"]
[free name="player_card" layer="2"]
[free name="card_deck" layer="2"]
[_tb_end_tyrano_code]

[tb_eval  exp="f.dealer_rank=0"  name="dealer_rank"  cmd="="  op="t"  val="0"  val_2="undefined"  ]
[tb_eval  exp="f.dealer_rank+=Math.floor(Math.random()*(13-1+1)+1)"  name="dealer_rank"  cmd="+="  op="r"  val="1"  val_2="13"  ]
[tb_start_tyrano_code]
[layopt layer="2" visible="true"]

; 山札として、その場に残すカード
[image name="card_deck" layer="2" storage="default/トランプ背面.png" left="210" top="278" width="647" height="432"]

; 引くカードを同じ位置に重ねる
[image name="dealer_card" layer="2" storage="default/トランプ背面.png" left="210" top="278" width="647" height="432"]

; 引くカードだけ左に240px移動
[anim name="dealer_card" left="-70" time="600" effect="easeOutQuad"]
[wa]
; 移動後、少し間を置く
[wait time="300"]

; 引いたカードの裏面だけ消す
[free name="dealer_card" layer="2" time="150" wait="true"]

; 抽選した数字に合う表面を表示
[if exp="f.dealer_rank == 1"]
[image name="dealer_card" layer="2" storage="default/トランプA.png" left="-70" top="278" width="647" height="432" time="150"]
[elsif exp="f.dealer_rank == 2"]
[image name="dealer_card" layer="2" storage="default/トランプ2.png" left="-70" top="278" width="647" height="432" time="150"]
[elsif exp="f.dealer_rank == 3"]
[image name="dealer_card" layer="2" storage="default/トランプ3.png" left="-70" top="278" width="647" height="432" time="150"]
[elsif exp="f.dealer_rank == 4"]
[image name="dealer_card" layer="2" storage="default/トランプ4.png" left="-70" top="278" width="647" height="432" time="150"]
[elsif exp="f.dealer_rank == 5"]
[image name="dealer_card" layer="2" storage="default/トランプ5.png" left="-70" top="278" width="647" height="432" time="150"]
[elsif exp="f.dealer_rank == 6"]
[image name="dealer_card" layer="2" storage="default/トランプ6.png" left="-70" top="278" width="647" height="432" time="150"]
[elsif exp="f.dealer_rank == 7"]
[image name="dealer_card" layer="2" storage="default/トランプ7.png" left="-70" top="278" width="647" height="432" time="150"]
[elsif exp="f.dealer_rank == 8"]
[image name="dealer_card" layer="2" storage="default/トランプ8.png" left="-70" top="278" width="647" height="432" time="150"]
[elsif exp="f.dealer_rank == 9"]
[image name="dealer_card" layer="2" storage="default/トランプ9.png" left="-70" top="278" width="647" height="432" time="150"]
[elsif exp="f.dealer_rank == 10"]
[image name="dealer_card" layer="2" storage="default/トランプ10.png" left="-70" top="278" width="647" height="432" time="150"]
[elsif exp="f.dealer_rank == 11"]
[image name="dealer_card" layer="2" storage="default/トランプJ.png" left="-70" top="278" width="647" height="432" time="150"]
[elsif exp="f.dealer_rank == 12"]
[image name="dealer_card" layer="2" storage="default/トランプQ.png" left="-70" top="278" width="647" height="432" time="150"]
[elsif exp="f.dealer_rank == 13"]
[image name="dealer_card" layer="2" storage="default/トランプK.png" left="-70" top="278" width="647" height="432" time="150"]
[endif]
[_tb_end_tyrano_code]

[tb_start_tyrano_code]
[if exp="f.retry_round == 1"]
[jump target="*retry_prompt"]
[endif]
[_tb_end_tyrano_code]

[tb_show_message_window  ]
[font  size="22"  color="0xffffff"  ]
[chara_mod  name="超学生"  time="0"  cross="false"  storage="chara/1/顔2.png"  ]
[tb_start_text mode=1 ]
#超学生
次に引かれるトランプの数字が、僕が出したこの数字より『高い』のか『低い』のか...[p]
よく考えて当ててください。[p]
[_tb_end_text]

[chara_mod  name="超学生"  time="0"  cross="false"  storage="chara/1/顔3.png"  ]
[tb_start_text mode=1 ]
#超学生
当てて僕に勝てたら、特別な景品を差し上げます。[p]

[_tb_end_text]

[chara_mod  name="超学生"  time="0"  cross="false"  storage="chara/1/顔1.png"  ]
[tb_hide_message_window  ]
[jump  storage="scene1.ks"  target="*select_cards"  ]
*retry_prompt

[tb_show_message_window  ]
[font  size="22"  color="0xffffff"  ]
[chara_mod  name="超学生"  time="0"  cross="false"  storage="chara/1/顔2.png"  ]
[tb_start_text mode=1 ]
#超学生
それでは、もう一度どうぞ？[p]

[_tb_end_text]

[tb_hide_message_window  ]
*select_cards

[button  storage="scene1.ks"  target="*choose_high"  graphic="HIGHボタン.jpg"  width="194"  height="65"  x="100"  y="190"  _clickable_img=""  name="img_37"  ]
[button  storage="scene1.ks"  target="*choose_low"  graphic="LOWボタン.jpg"  width="194"  height="65"  x="650"  y="190"  _clickable_img=""  name="img_38"  ]
[s  ]
*choose_high

[tb_eval  exp="f.player_choice=1"  name="player_choice"  cmd="="  op="t"  val="1"  val_2="undefined"  ]
[jump  storage="scene1.ks"  target="*choice_confirm"  ]
*choose_low

[tb_eval  exp="f.player_choice=2"  name="player_choice"  cmd="="  op="t"  val="2"  val_2="undefined"  ]
[jump  storage="scene1.ks"  target="*choice_confirm"  ]
*choice_confirm

[tb_start_tyrano_code]
[cm]
[_tb_end_tyrano_code]

[tb_show_message_window  ]
[font  size="22"  color="0xffffff"  ]
[chara_mod  name="超学生"  time="0"  cross="true"  storage="chara/1/顔4.png"  ]
[tb_start_text mode=1 ]
#超学生
......[p]
[_tb_end_text]

[chara_mod  name="超学生"  time="0"  cross="false"  storage="chara/1/顔5.png"  ]
[tb_start_text mode=1 ]
#超学生
本当にその選択で大丈夫ですか？[p]

[_tb_end_text]

[tb_hide_message_window  ]
[button  storage="scene1.ks"  target="*choose_keep"  graphic="そのままボタン.jpg"  width="194"  height="65"  x="100"  y="190"  _clickable_img=""  name="img_55"  ]
[button  storage="scene1.ks"  target="*choose_change"  graphic="逆にするボタン.jpg"  width="194"  height="65"  x="650"  y="190"  _clickable_img=""  ]
[s  ]
*choose_keep

[jump  storage="scene1.ks"  target="*choose_reveal"  ]
*choose_change

[tb_start_tyrano_code]
[if exp="f.player_choice == 1"]
[jump target="*change_to_low"]
[else]
[jump target="*change_to_high"]
[endif]
[_tb_end_tyrano_code]

*change_to_high

[tb_eval  exp="f.player_choice=1"  name="player_choice"  cmd="="  op="t"  val="1"  val_2="undefined"  ]
[jump  storage="scene1.ks"  target="*choose_reveal"  ]
*change_to_low

[tb_eval  exp="f.player_choice=2"  name="player_choice"  cmd="="  op="t"  val="2"  val_2="undefined"  ]
[jump  storage="scene1.ks"  target="*choose_reveal"  ]
*choose_reveal

[tb_start_tyrano_code]
[cm]
[_tb_end_tyrano_code]

[tb_show_message_window  ]
[font  size="22"  color="0xffffff"  ]
[chara_mod  name="超学生"  time="0"  cross="false"  storage="chara/1/顔1.png"  ]
[tb_start_text mode=1 ]
#超学生
それでは答え合わせのほうをしましょうか。[p]
あなたが選んだ結果は...[p]
[_tb_end_text]

[tb_hide_message_window  ]
[tb_eval  exp="f.player_rank=0"  name="player_rank"  cmd="="  op="t"  val="0"  val_2="undefined"  ]
[tb_eval  exp="f.player_rank+=Math.floor(Math.random()*(13-1+1)+1)"  name="player_rank"  cmd="+="  op="r"  val="1"  val_2="13"  ]
[tb_start_tyrano_code]
; 右側の裏面を消す
[free name="card_deck" layer="2" time="150" wait="true"]

; 同じ位置に、抽選したカードの表面を表示
[if exp="f.player_rank == 1"]
[image name="player_card" layer="2" storage="default/トランプA.png" left="210" top="278" width="647" height="432" time="150" wait="true"]

[elsif exp="f.player_rank == 2"]
[image name="player_card" layer="2" storage="default/トランプ2.png" left="210" top="278" width="647" height="432" time="150" wait="true"]

[elsif exp="f.player_rank == 3"]
[image name="player_card" layer="2" storage="default/トランプ3.png" left="210" top="278" width="647" height="432" time="150" wait="true"]

[elsif exp="f.player_rank == 4"]
[image name="player_card" layer="2" storage="default/トランプ4.png" left="210" top="278" width="647" height="432" time="150" wait="true"]

[elsif exp="f.player_rank == 5"]
[image name="player_card" layer="2" storage="default/トランプ5.png" left="210" top="278" width="647" height="432" time="150" wait="true"]

[elsif exp="f.player_rank == 6"]
[image name="player_card" layer="2" storage="default/トランプ6.png" left="210" top="278" width="647" height="432" time="150" wait="true"]

[elsif exp="f.player_rank == 7"]
[image name="player_card" layer="2" storage="default/トランプ7.png" left="210" top="278" width="647" height="432" time="150" wait="true"]

[elsif exp="f.player_rank == 8"]
[image name="player_card" layer="2" storage="default/トランプ8.png" left="210" top="278" width="647" height="432" time="150" wait="true"]

[elsif exp="f.player_rank == 9"]
[image name="player_card" layer="2" storage="default/トランプ9.png" left="210" top="278" width="647" height="432" time="150" wait="true"]

[elsif exp="f.player_rank == 10"]
[image name="player_card" layer="2" storage="default/トランプ10.png" left="210" top="278" width="647" height="432" time="150" wait="true"]

[elsif exp="f.player_rank == 11"]
[image name="player_card" layer="2" storage="default/トランプJ.png" left="210" top="278" width="647" height="432" time="150" wait="true"]

[elsif exp="f.player_rank == 12"]
[image name="player_card" layer="2" storage="default/トランプQ.png" left="210" top="278" width="647" height="432" time="150" wait="true"]

[elsif exp="f.player_rank == 13"]
[image name="player_card" layer="2" storage="default/トランプK.png" left="210" top="278" width="647" height="432" time="150" wait="true"]
[endif]

[wait time="500"]
[_tb_end_tyrano_code]

[tb_start_tyrano_code]
; 同じ数字なら引き直し
[if exp="f.player_rank == f.dealer_rank"]
[jump target="*result_draw"]

; HIGHを選び、プレイヤーの数字が大きければ成功
[elsif exp="f.player_choice == 1 && f.player_rank > f.dealer_rank"]
[jump target="*result_win"]

; LOWを選び、プレイヤーの数字が小さければ成功
[elsif exp="f.player_choice == 2 && f.player_rank < f.dealer_rank"]
[jump target="*result_win"]

; それ以外は失敗
[else]
[jump target="*result_lose"]
[endif]
[_tb_end_tyrano_code]

*result_win

[tb_show_message_window  ]
[font  size="22"  color="0xffffff"  ]
[chara_mod  name="超学生"  time="0"  cross="false"  storage="chara/1/顔6.png"  ]
[tb_start_text mode=1 ]
#超学生
オーン、負けちゃったぁ...！[p]
[_tb_end_text]

[chara_mod  name="超学生"  time="0"  cross="false"  storage="chara/1/顔1.png"  ]
[tb_start_text mode=1 ]
#超学生
...[p]
おめでとうございます。[r]お見事でございました。[p]
このあとちゃんと景品を受け取ってくださいね。[p]
[_tb_end_text]

[chara_mod  name="超学生"  time="0"  cross="false"  storage="chara/1/顔3.png"  ]
[tb_start_text mode=1 ]
#超学生
それでは、また。[p]
[_tb_end_text]

[tb_start_tyrano_code]
[mask time="800"]
[cm]
[free name="dealer_card" layer="2"]
[free name="player_card" layer="2"]
[free name="card_deck" layer="2"]
[_tb_end_tyrano_code]

[stopbgm  time="1000"  fadeout="true"  ]
[tb_hide_message_window  ]
[chara_hide  name="超学生"  time="0"  wait="true"  pos_mode="true"  ]
[tb_image_hide  time="0"  ]
[jump  storage="title_screen.ks"  target=""  ]
*result_lose

[tb_show_message_window  ]
[font  size="22"  color="0xffffff"  ]
[chara_mod  name="超学生"  time="0"  cross="false"  storage="chara/1/顔7.png"  ]
[tb_start_text mode=1 ]
#超学生
残念。[r]まぁ僕が勝ちますよね。[p]
[_tb_end_text]

[chara_mod  name="超学生"  time="0"  cross="false"  storage="chara/1/顔2.png"  ]
[tb_start_text mode=1 ]
#超学生
またいつかチャレンジして[r]みてください。[p]
次がいつかはちょっと分からないけど...[p]

[_tb_end_text]

[chara_mod  name="超学生"  time="0"  cross="false"  storage="chara/1/顔1.png"  ]
[tb_start_text mode=1 ]
#超学生
それでは、良き生活を。[p]

[_tb_end_text]

[tb_start_tyrano_code]
[mask time="800"]
[cm]
[free name="dealer_card" layer="2"]
[free name="player_card" layer="2"]
[free name="card_deck" layer="2"]
[_tb_end_tyrano_code]

[stopbgm  time="1000"  fadeout="true"  ]
[tb_hide_message_window  ]
[chara_hide  name="超学生"  time="0"  wait="true"  pos_mode="true"  ]
[tb_image_hide  time="0"  ]
[jump  storage="title_screen.ks"  target=""  ]
*result_draw

[tb_show_message_window  ]
[font  size="22"  color="0xffffff"  ]
[chara_mod  name="超学生"  time="0"  cross="false"  storage="chara/1/顔4.png"  ]
[tb_start_text mode=1 ]
#超学生
おや、同じ数字ですね。[p]
もう一度勝負しましょうか。[p]
[_tb_end_text]

[tb_eval  exp="f.retry_round=1"  name="retry_round"  cmd="="  op="t"  val="1"  val_2="undefined"  ]
[jump  storage="scene1.ks"  target="*round_start"  ]
[s  ]
