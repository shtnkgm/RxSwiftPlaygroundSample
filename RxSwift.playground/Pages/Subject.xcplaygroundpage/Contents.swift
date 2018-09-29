import RxSwift
import RxCocoa

let disposeBag = DisposeBag()

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
