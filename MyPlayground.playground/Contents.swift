// No such module 'RxSwift'とエラーが出る場合はビルドします
import RxSwift

func log(_ message: String) {
    print("---")
    print("[" + message + "]")
}

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

log("error")

Observable<Void>.error(error)
    .subscribe { print($0) }
    .disposed(by: disposeBag)

log("deffered")

