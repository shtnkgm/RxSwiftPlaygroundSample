import RxSwift
import RxCocoa

let disposeBag = DisposeBag()

log("map")

Observable<Int>
    .from([1, 2, 3])
    .map { $0 + 1 }
    .subscribe { print($0) }
    .disposed(by: disposeBag)

log("flatMap")

Observable<Int>
    .from([1, 2, 3])
    .flatMap {
        if $0 % 2 == 0 {
           return Observable.just($0)
        }
        return Observable.empty()
    }
    .subscribe { print($0) }
    .disposed(by: disposeBag)



