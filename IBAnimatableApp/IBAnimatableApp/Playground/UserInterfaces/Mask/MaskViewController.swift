//
//  Created by Jake Lin on 6/29/16.
//  Copyright © 2016 IBAnimatable. All rights reserved.
//

import UIKit
import IBAnimatable

final class MaskViewController: UIViewController {

  @IBOutlet fileprivate var maskedView: AnimatableView!
  // @IBOutlet var maskedImageView: AnimatableImageView!
  @IBOutlet fileprivate weak var pickerView: UIPickerView!
  var selectedEntry: PickerEntry!
  lazy var entries: [PickerEntry] = {
    let pointsParam = ParamType.number(min: 3, max: 10, interval: 1, ascending: true, unit: "points") // default 5
    let sidesParam = ParamType.number(min: 3, max: 10, interval: 1, ascending: true, unit: "sides") // default 6
    let angleParam = ParamType.number(min: 60, max: 180, interval: 2, ascending: true, unit: "°") // default 6
    let waveParam = ParamType(fromEnum: MaskType.WaveDirection.self)
    let widthParam = ParamType.number(min: 15, max: 90, interval: 2, ascending: true, unit: "px")
    let radiusParam = ParamType.number(min: 10, max: 40, interval: 10, ascending: true, unit: "px")
    let cogsParam = ParamType.number(min: 3, max: 10, interval: 1, ascending: true, unit: "cogs")
    let nParam = ParamType.number(min: 0.25, max: 2, interval: 0.25, ascending: true, unit: "n")
    let cornerParam = ParamType.enumeration(values: ["all"] + iterateEnum(CornerSide.self).map { String(describing: $0.rawValue) })

    return [PickerEntry(params: [], name: "circle"),
            PickerEntry(params: [], name: "ellipse"),
            PickerEntry(params: [], name: "triangle"),
            PickerEntry(params: [sidesParam], name: "polygon"),
            PickerEntry(params: [pointsParam], name: "star"),
            PickerEntry(params: [waveParam, widthParam], name: "wave"),
            PickerEntry(params: [angleParam], name: "parallelogram"),
            PickerEntry(params: [], name: "heart"),
            PickerEntry(params: [radiusParam], name: "ring"),
            PickerEntry(params: [radiusParam, cogsParam], name: "gear"),
            PickerEntry(params: [nParam], name: "superellipse"),
            PickerEntry(params: [], name: "drop"),
            PickerEntry(params: [widthParam], name: "plussign"),
            PickerEntry(params: [angleParam], name: "moon"),
            PickerEntry(params: [widthParam, widthParam], name: "insetby"),
            PickerEntry(params: [radiusParam, cornerParam], name: "rounded"),
            PickerEntry(params: [], name: "none"),
            PickerEntry(params: [], name: "CUSTOM Bubble")
    ]
  }()

  override func viewDidLoad() {
    super.viewDidLoad()
    selectedEntry = entries[0]
    pickerView.delegate = self
    pickerView.dataSource = self
    let maskString = selectedEntry.toString(selectedIndexes: 0)
    let maskType = MaskType(string: maskString)
    maskedView.maskType = maskType
  }
}

extension MaskViewController: UIPickerViewDelegate, UIPickerViewDataSource {

  func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    if component == 0 {
      return entries.count
    }
    return selectedEntry.params[safe: component - 1]?.count() ?? 0
  }

  func numberOfComponents(in pickerView: UIPickerView) -> Int {
    return 3
  }

  func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {

    // the goal of this is to mask useless components
    switch component {
    case 0:
      return view.frame.size.width * 0.5
    case let c where c > selectedEntry.params.count:
      return 0
    default:
      return view.frame.size.width * 0.25
    }
  }

  func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
    let label = UILabel()
    label.textColor = .white
    if component == 0 {
      label.text = entries[safe: row]?.name
    } else {
      label.text = selectedEntry.params[safe: component - 1]?.title(at: row)
    }
    return label

  }
  func bubbleButtonPath(size: CGSize) -> UIBezierPath {
    // Code generated by PaintCode with ❤️ :)
    let frame = CGRect(origin: .zero, size: size)
    //// General Declarations
    // This non-generic function dramatically improves compilation times of complex expressions.
    func fastFloor(_ x: CGFloat) -> CGFloat { return floor(x) }

    //// Subframes
    let frame2 = CGRect(x: frame.minX + fastFloor((frame.width - 53) * 0.507_69 + 0.5), y: frame.minY + frame.height - 45, width: 53, height: 38)

    let bezierPath = UIBezierPath()

    bezierPath.move(to: CGPoint(x: frame.maxX - 8.2, y: frame.minY + 14.15))
    bezierPath.addLine(to: CGPoint(x: frame.maxX - 7.81, y: frame.minY + 14.25))
    bezierPath.addCurve(to: CGPoint(x: frame.maxX - 2.25, y: frame.minY + 19.81),
                        controlPoint1: CGPoint(x: frame.maxX - 5.23, y: frame.minY + 15.19),
                        controlPoint2: CGPoint(x: frame.maxX - 3.19, y: frame.minY + 17.23))
    bezierPath.addCurve(to: CGPoint(x: frame.maxX - 1.5, y: frame.minY + 28.79),
                        controlPoint1: CGPoint(x: frame.maxX - 1.5, y: frame.minY + 22.18),
                        controlPoint2: CGPoint(x: frame.maxX - 1.5, y: frame.minY + 24.38))
    bezierPath.addLine(to: CGPoint(x: frame.maxX - 1.5, y: frame.maxY - 36.79))
    bezierPath.addCurve(to: CGPoint(x: frame.maxX - 2.15, y: frame.maxY - 28.2),
                        controlPoint1: CGPoint(x: frame.maxX - 1.5, y: frame.maxY - 32.38),
                        controlPoint2: CGPoint(x: frame.maxX - 1.5, y: frame.maxY - 30.18))
    bezierPath.addLine(to: CGPoint(x: frame.maxX - 2.25, y: frame.maxY - 27.81))
    bezierPath.addCurve(to: CGPoint(x: frame.maxX - 7.81, y: frame.maxY - 22.25),
                        controlPoint1: CGPoint(x: frame.maxX - 3.19, y: frame.maxY - 25.23),
                        controlPoint2: CGPoint(x: frame.maxX - 5.23, y: frame.maxY - 23.19))
    bezierPath.addCurve(to: CGPoint(x: frame.maxX - 16.79, y: frame.maxY - 21.5),
                        controlPoint1: CGPoint(x: frame.maxX - 10.18, y: frame.maxY - 21.5),
                        controlPoint2: CGPoint(x: frame.maxX - 12.38, y: frame.maxY - 21.5))
    bezierPath.addLine(to: CGPoint(x: frame2.minX + 46.37, y: frame2.maxY - 14.5))
    bezierPath.addCurve(to: CGPoint(x: frame2.minX + 32.37, y: frame2.maxY - 0.5),
                        controlPoint1: CGPoint(x: frame2.minX + 39.47, y: frame2.maxY - 7.6),
                        controlPoint2: CGPoint(x: frame2.minX + 32.37, y: frame2.maxY - 0.5))
    bezierPath.addCurve(to: CGPoint(x: frame2.minX + 18.37, y: frame2.maxY - 14.5),
                        controlPoint1: CGPoint(x: frame2.minX + 32.37, y: frame2.maxY - 0.5),
                        controlPoint2: CGPoint(x: frame2.minX + 25.27, y: frame2.maxY - 7.6))
    bezierPath.addLine(to: CGPoint(x: frame.minX + 28.79, y: frame.maxY - 21.5))
    bezierPath.addCurve(to: CGPoint(x: frame.minX + 20.2, y: frame.maxY - 22.15),
                        controlPoint1: CGPoint(x: frame.minX + 24.38, y: frame.maxY - 21.5),
                        controlPoint2: CGPoint(x: frame.minX + 22.18, y: frame.maxY - 21.5))
    bezierPath.addLine(to: CGPoint(x: frame.minX + 19.81, y: frame.maxY - 22.25))
    bezierPath.addCurve(to: CGPoint(x: frame.minX + 14.25, y: frame.maxY - 27.81),
                        controlPoint1: CGPoint(x: frame.minX + 17.23, y: frame.maxY - 23.19),
                        controlPoint2: CGPoint(x: frame.minX + 15.19, y: frame.maxY - 25.23))
    bezierPath.addCurve(to: CGPoint(x: frame.minX + 13.5, y: frame.maxY - 36.79),
                        controlPoint1: CGPoint(x: frame.minX + 13.5, y: frame.maxY - 30.18),
                        controlPoint2: CGPoint(x: frame.minX + 13.5, y: frame.maxY - 32.38))
    bezierPath.addLine(to: CGPoint(x: frame.minX + 13.5, y: frame.minY + 28.79))
    bezierPath.addCurve(to: CGPoint(x: frame.minX + 14.15, y: frame.minY + 20.2),
                        controlPoint1: CGPoint(x: frame.minX + 13.5, y: frame.minY + 24.38),
                        controlPoint2: CGPoint(x: frame.minX + 13.5, y: frame.minY + 22.18))
    bezierPath.addLine(to: CGPoint(x: frame.minX + 14.25, y: frame.minY + 19.81))
    bezierPath.addCurve(to: CGPoint(x: frame.minX + 19.81, y: frame.minY + 14.25),
                        controlPoint1: CGPoint(x: frame.minX + 15.19, y: frame.minY + 17.23),
                        controlPoint2: CGPoint(x: frame.minX + 17.23, y: frame.minY + 15.19))
    bezierPath.addCurve(to: CGPoint(x: frame.minX + 28.79, y: frame.minY + 13.5),
                        controlPoint1: CGPoint(x: frame.minX + 22.18, y: frame.minY + 13.5),
                        controlPoint2: CGPoint(x: frame.minX + 24.38, y: frame.minY + 13.5))
    bezierPath.addLine(to: CGPoint(x: frame.maxX - 16.79, y: frame.minY + 13.5))
    bezierPath.addCurve(to: CGPoint(x: frame.maxX - 8.2, y: frame.minY + 14.15),
                        controlPoint1: CGPoint(x: frame.maxX - 12.38, y: frame.minY + 13.5),
                        controlPoint2: CGPoint(x: frame.maxX - 10.18, y: frame.minY + 13.5))
    bezierPath.close()
    return bezierPath
  }

  func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    if component == 0 {
      if selectedEntry.name != entries[row].name {
        selectedEntry = entries[row]
        pickerView.reloadComponent(1)
        pickerView.reloadComponent(2)
        pickerView.setNeedsLayout() // trick to re-ask for components width
      }
    }
    if selectedEntry.name.hasPrefix("CUSTOM") {
      maskedView.maskType = .custom(pathProvider: bubbleButtonPath)
    } else {
      let maskString = selectedEntry.toString(selectedIndexes: pickerView.selectedRow(inComponent: 1), pickerView.selectedRow(inComponent: 2))
      maskedView.maskType = MaskType(string: maskString)
    }
  }
}
