## URI
```
ws://localhost:8080/join?name=USERNAME
```
に接続。USERNAMEには名前が入る。スペクテイターは"SPECTATOR\_"で始まるようにすること
## Protocol
### 前提
- 全部のデータを流す
- 必要なものだけ受け取る
### 中身
{
  "user": "誰が送っているか(server, spectator, USERNAME)",
  "msg": { #この中がメッセージ
    "score": "スコアが入る(int)",
    "color_present": "現在の色が入る(RED, GREEN, WHITE, NONE:まだスタートしてない)",
    "color_next": "次の色が入る(RED, GREEN, WHITE, NONE:おわり)",
    "phase": "今何回目の切り替えか(0始まり, int)",
    "phase_max": "何回目の切り替えで終わるか(int)",
    "time_elapsed": "始まってからの秒数(int)",
    "graph" #入れるか？
  }
}

### 出来ると良いこと
- 今吸ってる相手
- 今吸われている相手
- 最も吸ってる相手
- 最も吸われてる相手
