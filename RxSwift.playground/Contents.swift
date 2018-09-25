// No such module 'RxSwift'とエラーが出る場合はビルドします
import RxSwift
import RxCocoa

func log(_ message: String) {
    print("---")
    print("# " + message)
}

let disposeBag = DisposeBag()
let error = NSError(domain: "domain", code: 0, userInfo: nil)

log("Observableの生成")

log("empty")
Observable<Void>
    .empty()
    .subscribe { print($0) }
    .disposed(by: disposeBag)

log("never")
Observable<Void>
    .never()
    .subscribe { print($0) }
    .disposed(by: disposeBag)

log("just")
Observable<Int>
    .just(1)
    .subscribe { print($0) }
    .disposed(by: disposeBag)

log("of")
Observable<Int>
    .of(1, 2, 3)
    .subscribe { print($0) }
    .disposed(by: disposeBag)

log("from")
Observable<Int>
    .from([1, 2, 3])
    .subscribe { print($0) }
    .disposed(by: disposeBag)

log("create")
Observable<Int>.create { observer -> Disposable in
    observer.onNext(1)
    observer.onNext(2)
    observer.onCompleted()
    return Disposables.create()
    }
    .subscribe { print($0) }
    .disposed(by: disposeBag)

log("range")
Observable<Int>.range(start: 1, count: 3)
    .subscribe { print($0) }
    .disposed(by: disposeBag)

log("repeatElement")
Observable<Int>.repeatElement(1)
    .take(3)
    .subscribe { print($0) }
    .disposed(by: disposeBag)

log("generate")
Observable<Int>.generate(initialState: 0, condition: { $0 < 3 }, iterate: { $0 + 1 })
    .subscribe { print($0) }
    .disposed(by: disposeBag)

log("doOn")
Observable.just(1)
    .do(onNext: { print("do: onNext(\($0))") },
        onError: { print("do: onError(\($0))") },
        onCompleted: { print("do: onCompleted") },
        onSubscribe: { print("do: onSubscribe") },
        onSubscribed: { print("do: onSubscribed") },
        onDispose: { print("do: onDispose") })
    .subscribe { print($0) }
    .disposed(by: disposeBag)

log("error")

Observable<Void>.error(error)
    .subscribe { print($0) }
    .disposed(by: disposeBag)

log("deffered")
let defferedObservable = Observable<Int>.deferred { () -> Observable<Int> in
    print("return Observable")
    return .just(1)
}

defferedObservable
    .subscribe { print($0) }
    .disposed(by: disposeBag)

defferedObservable
    .subscribe { print($0) }
    .disposed(by: disposeBag)

log("Subject")

log("PublishSubject")

let publishSubject = PublishSubject<Int>()
publishSubject
    .subscribe { print("A: " + "\($0)") }
    .disposed(by: disposeBag)

publishSubject.onNext(1)
publishSubject.onNext(2)

publishSubject
    .subscribe { print("B: " + "\($0)") }
    .disposed(by: disposeBag)

publishSubject.onNext(3)

log("ReplaySubject")

let replaySubject = ReplaySubject<Int>.create(bufferSize: 1)
replaySubject
    .subscribe { print("A: " + "\($0)") }
    .disposed(by: disposeBag)

replaySubject.onNext(1)
replaySubject.onNext(2)

replaySubject
    .subscribe { print("B: " + "\($0)") }
    .disposed(by: disposeBag)

replaySubject.onNext(3)

log("BehaviorSubject")

let behaviorSubject = BehaviorSubject<Int>(value: 0)
behaviorSubject
    .subscribe { print("A: " + "\($0)") }
    .disposed(by: disposeBag)

behaviorSubject.onNext(1)
behaviorSubject.onNext(2)

behaviorSubject
    .subscribe { print("B: " + "\($0)") }
    .disposed(by: disposeBag)

behaviorSubject.onNext(3)

log("Variable")

let variable = Variable<Int>(0)
variable
    .asObservable()
    .subscribe { print("A: " + "\($0)") }
    .disposed(by: disposeBag)

variable.value = 1
variable.value = 2

variable
    .asObservable()
    .subscribe { print("B: " + "\($0)") }
    .disposed(by: disposeBag)

variable.value = 3

log("BehaviorRelay")

let behaviorRelay = BehaviorRelay<Int>(value: 0)
behaviorRelay
    .subscribe { print("A: " + "\($0)") }
    .disposed(by: disposeBag)

behaviorRelay.accept(1)
behaviorRelay.accept(2)

behaviorRelay
    .subscribe { print("B: " + "\($0)") }
    .disposed(by: disposeBag)

behaviorRelay.accept(3)








