[_tb_system_call storage=system/_title_screen.ks]


;==============================
; タイトル画面
;==============================


[hidemenubutton]

[tb_clear_images]

[tb_keyconfig  flag="0"  ]

;標準のメッセージレイヤを非表示


[tb_hide_message_window  ]
[playbgm  volume="100"  time="1000"  loop="true"  storage="Curious_Night.mp3"  ]

;タイトル表示


[bg  storage="ハイロータイトル.png"  ]
[tb_start_tyrano_code]
[mask_off time=1000"]
[_tb_end_tyrano_code]

*title


;タイトル各種ボタン


[glink  color="btn_09_black"  text="はじめる"  x="229"  y="448"  size="24"  target="*start"  width="130"  height="64"  _clickable_img=""  ]
[s  ]

;-------ボタンが押されたときの処理


*start

[cm  ]
[tb_keyconfig  flag="1"  ]
[jump  storage="scene1.ks"  target=""  ]
[s  ]

;--------ロードが押された時の処理


*load

[cm  ]
[showload]

[jump  target="*title"  storage=""  ]
[s  ]
