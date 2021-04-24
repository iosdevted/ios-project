# 👨‍🎨 RxSwift Photo Filter

Implemented a photo filter app using RxSwift.

<img src="https://user-images.githubusercontent.com/50784573/104888432-17012800-59b0-11eb-8a56-0cb99e5437ad.gif" width=300/>

## Code

```swift
    //ViewController
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        guard let navC = segue.destination as? UINavigationController,
              let photoCVC = navC.viewControllers.first as? PhotosCollectionViewController else {
            fatalError()
        }

        photoCVC.selectedPhoto.subscribe(onNext: { [weak self] photo in

            DispatchQueue.main.async {
                self?.updateUI(with: photo)

            }


        }).disposed(by: disposeBag)
    }

    @IBAction func applyFilterButtonPressed() {

        guard let sourceImage = self.photoImageView.image else { return }

        FilterService().applyFilter(to: sourceImage)
            .subscribe(onNext: { filteredImage in

                DispatchQueue.main.async {
                    self.photoImageView.image = filteredImage
                }
            }).disposed(by: disposeBag)

    }

    //FilterService
    func applyFilter(to inputImage: UIImage) -> Observable<UIImage> {

        return Observable<UIImage>.create { observer in
            self.applyFilter(to: inputImage) { (filteredImage) in
                observer.onNext(filteredImage)
            }

            return Disposables.create()
        }
    }
```

## How to run a demo app

1. Download the source code by cloning this repository.
2. RxSwfit is already installed.
3. Open the xcworkspace file with the latest version of Xcode.
