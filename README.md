RxSwift

# 概要

Todo
```
replayAll
shareReplayLatestWhileConnected
share
shareReplay
NopDisposable
asObservable
asDriver
DisposeBag
observeOn
subscribeOn
MainScheduler
interval
RxTableViewDataSourceType
Binder
throttle
flatMapLatest
catchErrorJustReturn
```

## Observer

## Observable
 - 時間とともに送信されるイベントの流れ（ストリーム）

### 監視
 - subscribe

### 生成
Observableを生成するための関数
 - empty
 - never
 - just
 - of
 - from
 - create
 - range
 - repeatElement
 - generate
 - doOn
 - error
 - deffered

RxCocoaで提供される関数
 - rx_observe
 - rx_tap
 - rx_notification

#### empty
 - Completedのみ送信する空のストリームを生成する

#### never
 - Completedも送信しない空のストリームを生成する

#### just
 - 1つのイベントとCompletedを送信するストリームを生成する

#### of
 - 複数のイベントとCompletedを送信するストリームを生成する

#### from
 - ArrayやRangeなどシーケンスからストリームを生成する
 - toObservableは廃止、fromに変更

#### create
 - クロージャーからストリームを生成する
 
#### range
 - start引数で指定する数から始まる連続する整数をcount引数で指定する数だけイベントを送信する

#### repeatElement
 - 引数で指定した値を送信するイベントを無限に繰り返す

#### generate
 - 引数で指定したイテレート処理がtrueである限り生成した値をイベントとして送信する

#### doOn
 - 購読された後、nextが送信される前など各イベントの実行タイミングで処理を行う

#### error
 - Errorのみ送信するストリームを生成する

#### deffered
 - subscribeされたタイミングでObservableを返すストリームを生成する

#### rx.observe

#### rx.tap

#### rx.notification

## Subject
 - Observer、Observableの両方として機能する

### Subjectのクラス
 - PublishSubject
 - ReplaySubject
 - BehaviorSubject
 - Variable
 - BehaviorRelay
 
#### PublishSubject
 - subscribe後にそれ以降に送信したイベントのみを送信する
 
#### ReplaySubject
 - subscribeしたタイミングに関わらず、subscrieする前のイベントを送信する
 - create(bufferSize: )で指定した数だけイベントをキャッシュする
 - createUnbounded()を使うと全てのイベントをキャッシュする

#### BehaviorSubject
 - subscribe後に最後に送信したイベントとそれ以降に送信したイベントを送信する
 - 初期値を持つ 

#### Variable
 - Errorを送信しないBehaviorSubjectのラッパー
 - dealloc時にCompletedを送信
 - 値のアクセスはvalueプロパティのgetter/setterで行う
 - RxSwift4でBehaviorRelayに代わり、deprecated
 
#### BehaviorRelay
 - CompletedとErrorを送信しないBehaviorSubjectのラッパー
 - 値のアクセスはvalueプロパティとaccept関数で行う
 - RxCocoaで提供される

## オペレーター / Operator

 - 変換 / Transforming
 - 絞り込み / Filtering
 - 組み合わせ / Combining
 - エラー処理 / Error Handling
 - Observable Utility
 - Conditional and Boolean
 - Mathematical and Aggregate
 - Connectable Observable

### 変換 / Transforming
Observableから送信されるイベントを変換する関数
 - map
 - flatMap
 - scan
 - buffer
 - window

#### map
 - Observableで送信されるイベントそれぞれに関数を適用する

#### flatMap
 - Observableで送信されるイベントそれぞれに関数を適用する
 - 関数で空のイベント(empty)を返した場合はイベントを送信しない
 
#### scan
 - Observableで送信されるイベントそれぞれに関数を適用する
 - 初期値を取り、関数の適用結果を保持する

#### buffer
 - 

#### window
 - 

### 絞り込み / Filtering
Observableから送信されるイベントを絞り込む関数
 - filter
 - distinctUntilChanged
 - take
 - debounce
 - elementAt
 - ignoreElements
 - sample
 - skip
 - takeLast
 - distinct

#### filter
 - 引数のクロージャーの戻り値がtrueとなるイベントのみ送信する

#### distinctUntilChanged
 - 直前の重複するイベントを除去する

#### take
 - 引数で指定する個数の最初のイベントを送信する

### 組み合わせ / Combining
Observableから送信されるイベントを組み合わせる関数
 - startWith
 - combineLatest
 - zip
 - merge
 - switchLatest

#### startWith
 - イベント送信前に特定のストリームを送信
 - startWithを複数書いた場合は後に書いたものが先

#### combineLatest
 - 2つのObservableの最新のイベントを1つのイベントに変換
 - 送信タイミングは2つのObservableのどちらかのイベントが送信される時

#### zip
 - 複数のObservableの送信イベントを1つのイベントに変換
 - 送信タイミングは全てのObservableからのイベントが揃った時
 - 一度送信したイベントは保持しない

#### merge
 - 複数のObservableを1つのObservableとみなして結合

#### switchLatest 
 - ?

#### concat

### エラー処理 / Error Handling

 - catchError
 - retry  
 
#### catchError
 - Errorが送信された時にErrorを送信せずに別のイベントを送信する
 
#### retry
 - Errorが送信された時に再度subscribeする
 
### Observable Utility
 - subscribe
 - subscribeNext
 - subscribeCompleted
 - subscribeError
 - doOn
 
#### subscribe
 - 略
 
#### subscribeNext
 - 略
 
#### subscribeCompleted
 - 略
 
#### subscribeError
 - 略
 
#### doOn
 - subscribeとの違いは?

### Conditional and Boolean
 - takeUntil
 - takeWhile
 
#### takeUntil
 - 別のストリームのイベントが送信されるまでのイベントのみ送信する

#### takeWhile
 - 引数のクロージャーの戻り値がtrueとなるイベントまで送信し、それ以降は送信しない

### Mathematical and Aggregate
 - concat
 - reduce

#### concat
 - 複数のストリームを直列で結合する

#### reduce
 - 各イベントに指定した関数を実行し、Completed時に結果をイベントを送信する
 - 初期値を指定可能

### Connectable Observable
connectメソッドを呼ばないとイベントが送信されない
Hot Observableと呼ばれる性質を持つ

 - multicast
 - replay
 - publish
 
#### multicast
#### replay
#### publish

# 参考
 - [ReactiveX/RxSwift](https://github.com/ReactiveX/RxSwift)
 - [ReactiveX - Operators](http://reactivex.io/documentation/operators.html)
 - [RxSwift 入門 その１](http://tiny-wing.hatenablog.com/entry/2016/01/02/161322)
 - [RxSwift 入門 その２](http://tiny-wing.hatenablog.com/entry/2016/01/11/172915) 
 - [RxSwift 入門 その３](http://tiny-wing.hatenablog.com/entry/2016/01/16/075011)
 - [RxSwift 入門 その４
](http://tiny-wing.hatenablog.com/entry/2016/01/17/182911)
 - [RxSwift 入門 その５](http://tiny-wing.hatenablog.com/entry/2016/01/20/072221)
 - [RxSwift 入門 その６](http://tiny-wing.hatenablog.com/entry/2016/01/27/185927)
 - [RxSwift 入門 その７](http://tiny-wing.hatenablog.com/entry/2016/02/02/125453)
 - [RxSwift Observable生成関数まとめ](https://qiita.com/moaible/items/de94c574b25ea4f0ef17) 
 - [RxSwift4で廃止になった Variable のリプレイス](https://qiita.com/mafmoff/items/7ffe707c2f3097b44297)
 - [【Swift】RxSwiftのPlaygroundを読む①](https://qiita.com/KentaKudo/items/d9ff7cdc639c24301456)
 - [【Swift】RxSwiftのPlaygroundを読む②](https://qiita.com/KentaKudo/items/4d7154c3dada93f11492)
 - [【Swift】RxSwiftのPlaygroundを読む③](https://qiita.com/KentaKudo/items/f4b0b55de1b761fb4ade)
 - [【Swift】RxSwiftのPlaygroundを読む④](https://qiita.com/KentaKudo/items/7d939b6c05aa7daf9746)
 - [【Swift】RxSwiftのPlaygroundを読む⑤](https://qiita.com/KentaKudo/items/c5eefa22706893834c86)  
 - [【Swift】RxSwiftのPlaygroundを読む⑥](https://qiita.com/KentaKudo/items/b91e897af3ee91d7f6bd)
 - [【Swift】RxSwiftのPlaygroundを読む⑦](https://qiita.com/KentaKudo/items/e1bb13ad31642ec86a47)
 - [【Swift】RxSwiftのPlaygroundを読む⑧](https://qiita.com/KentaKudo/items/ea9fba6a4c471d1c2ca2)
 - [【Swift】RxSwiftのPlaygroundを読む⑨](https://qiita.com/KentaKudo/items/a319402edef7109b216c)
 - [RxSwiftのshare*の早見表](https://qiita.com/marty-suzuki/items/593fa9550455364c052e)
