# pathView
ビーコン検知シミュレータ

高槻市駅と高槻駅の間の歩行データを表示．ビーコンが反応する様子を確認する

歩行データの作成は contextWalk で行う。

パラメータとしていじれる変数：
* isPathDisplay: true の時は、歩行者の歩いた経路を表示。false なら、棒人間が歩く。
* isNetworkDisplay: true の時は beacon 間の伝播の強さの関係を表示する。
