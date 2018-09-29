import RxSwift
import RxCocoa

let disposeBag = DisposeBag()
let error = NSError(domain: "domain", code: 0, userInfo: nil)

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
