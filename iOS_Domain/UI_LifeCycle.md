# UI Life Cycle

## Overview
1. Viewの読み込み
2. 制約の追加 (AutoLayout)
    - SubViewが先に実行されて、その後にParentViewが実行される
3. 制約を基にViewのFrameを計算 (Layout)
    - ParentViewが先に実行されて、その後にSubViewが実行される
4. frameの位置に描画 (Rendering)

## UIView
### Constraint
#### updateConstraints()
- 制約の更新を実行
- 開発者が直接呼び出すのはNG

#### setNeedsUpdateConstraints()
- 制約更新の実行要否のフラグを立てる
- 計算実行タイミングはシステム任せ

#### updateConstraintsIfNeeded()
- 制約更新を即座に実行（更新フラグがあれば）

### Layout
#### layoutSubviews()
- frameの更新を実行
- 開発者が直接呼び出すのはNG

#### setNeedsLayout()
- frame更新要否のフラグを立てる
- 計算実行タイミングはシステム任せ

#### layoutIfNeeded()
- frame更新を即座に実行（更新フラグがあれば）

### Drawing
#### draw()
- 開発者が直接呼び出してはいけない
- CoreGraphicsを使って画面に描画する

#### setNeedsDisplay()
- 描画更新の実行要否のフラグを立てる
- 制約やレイアウト更新のように、即時実行用のメソッドはない

## UIViewController
#### loadView()
- 管理するViewを読み込む
- StoryBoardで実行する場合はoverride不要
- Viewの追加、制約の追加など、StoryBoardで行う操作をコードで実装するのに適する

#### viewDidLoad()
- loadView()が完了した際に呼ばれる
- ViewControllerの表示サイクルで一度だけ呼ばれるため、クラス内で利用するオブジェクトの初期化などに適する

#### viewWillAppear()
- Viewが表示される直前の呼ばれる
- 初回表示以外にも Background復帰、タブ切り替えなど
- まだViewが表示されていないため、計算コストの高い処理は避ける

#### updateViewConstraints()
- SubViewの制約更新後、self.viewの制約更新が必要な際に呼ばれる
- self.viewのupdateConstraints()が呼ばれる
- override での利用用途はあまりないのかもしれない

#### viewWillLayoutSubviews() 
- Viewのレイアウトを開始する直前に呼ばれる（初期表示時や画面回転時など）
- ViewのlayoutSubviews()が実行される

#### viewDidLayoutSubviews()
- Viewのレイアウトが完了した際に呼ばれる（複数回呼ばれるので、オブジェクトの初期化などには向かない）
- self.view.frameはこのメソッドよりも前だと確定していない
- viewDidLoad()などでself.view.frameを用いてレイアウトすると意図するレイアウトとならない可能性あり

#### viewDidAppear()
- Viewが表示された直後に呼ばれる
- viewWillAPpear()同様、Background復帰時やタブ切り替え時など複数回呼ばれる
- 既にUI表示が完了しているので、UI表示に関係のない処理を実行するのに適する（ログの送信など）
